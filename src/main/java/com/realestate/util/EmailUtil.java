package com.realestate.util;

import java.io.InputStream;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

import io.github.cdimascio.dotenv.Dotenv;

public class EmailUtil {
    private static final Logger LOGGER = Logger.getLogger(EmailUtil.class.getName());
    private static Properties configProps = new Properties();
    private static Dotenv dotenv;

    static {
        try {
            // Try to find .env by traversing up from user.dir
            java.io.File currentDir = new java.io.File(System.getProperty("user.dir")).getAbsoluteFile();
            while (currentDir != null) {
                java.io.File envFile = new java.io.File(currentDir, ".env");
                if (envFile.exists()) {
                    dotenv = Dotenv.configure().directory(currentDir.getAbsolutePath()).ignoreIfMissing().load();
                    break;
                }
                currentDir = currentDir.getParentFile();
            }
            if (dotenv == null) {
                dotenv = Dotenv.configure().ignoreIfMissing().load();
            }
        } catch (Exception e) {
            LOGGER.log(Level.INFO, "No local .env file found for EmailUtil");
        }
        
        try (InputStream input = EmailUtil.class.getClassLoader().getResourceAsStream("config.properties")) {
            if (input != null) {
                configProps.load(input);
            }
        } catch (Exception e) {
            LOGGER.log(Level.WARNING, "Could not load config.properties for EmailUtil", e);
        }
    }

    public static String getSecret(String key, String defaultValue) {
        // 1. Try OS Environment Variables first
        String sysEnv = System.getenv(key);
        if (sysEnv != null && !sysEnv.isEmpty()) {
            return sysEnv;
        }
        // 2. Try Dotenv for local dev
        if (dotenv != null && dotenv.get(key) != null && !dotenv.get(key).isEmpty()) {
            return dotenv.get(key);
        }
        // 3. Fallback to default
        return configProps.getProperty(key, defaultValue);
    }

    /**
     * Sends an HTML email using Brevo REST API (HTTPS Port 443) or SMTP
     */
    public static boolean sendEmail(String recipientEmail, String subject, String htmlContent) {
        final String brevoApiKey = getSecret("BREVO_API_KEY", "");
        final String fromEmail = getSecret("SMTP_FROM_EMAIL", getSecret("SMTP_EMAIL", "propertywallah28@gmail.com"));
        final String fromName = getSecret("SMTP_FROM_NAME", "EstateHub Support");

        // 1. Try Brevo HTTPS REST API first if BREVO_API_KEY is configured (Bypasses all SMTP port & IP restrictions)
        if (brevoApiKey != null && !brevoApiKey.trim().isEmpty() && !brevoApiKey.contains("your_")) {
            boolean httpSuccess = sendViaBrevoRestApi(brevoApiKey, fromEmail, fromName, recipientEmail, subject, htmlContent);
            if (httpSuccess) {
                return true;
            }
            LOGGER.warning("Brevo REST API call failed, falling back to SMTP...");
        }

        final String smtpHost = getSecret("SMTP_HOST", "smtp-relay.brevo.com");
        final String smtpPort = getSecret("SMTP_PORT", "587");
        final String smtpEmail = getSecret("SMTP_EMAIL", "");
        final String smtpPassword = getSecret("SMTP_APP_PASSWORD", "");

        // If credentials are not configured, simulate delivery in development/demo mode
        if (smtpEmail.isEmpty() || smtpPassword.isEmpty() || smtpEmail.contains("your_email")) {
            LOGGER.info("[SIMULATED EMAIL DISPATCH]");
            LOGGER.info("To: " + recipientEmail);
            LOGGER.info("Subject: " + subject);
            LOGGER.info("Body: " + htmlContent);
            return true;
        }

        try {
            Properties props = new Properties();
            props.put("mail.smtp.host", smtpHost);
            props.put("mail.smtp.port", smtpPort);
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.ssl.protocols", "TLSv1.2 TLSv1.3");
            props.put("mail.smtp.ssl.trust", smtpHost);
            props.put("mail.smtp.connectiontimeout", "10000");
            props.put("mail.smtp.timeout", "10000");

            Session session = Session.getInstance(props, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(smtpEmail, smtpPassword);
                }
            });

            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail, fromName));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
            message.setSubject(subject, "UTF-8");
            message.setContent(htmlContent, "text/html; charset=UTF-8");

            Transport.send(message);
            LOGGER.info("Email successfully sent via SMTP to " + recipientEmail);
            return true;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Failed to send email via SMTP to " + recipientEmail + ": " + e.getMessage(), e);
            return false;
        }
    }

    /**
     * Dispatches email over HTTPS using Brevo REST API v3 (Port 443).
     * Works on all cloud platforms (Railway, Render, AWS, Heroku) with zero IP blocking.
     */
    private static boolean sendViaBrevoRestApi(String apiKey, String fromEmail, String fromName, String toEmail, String subject, String htmlContent) {
        try {
            java.net.URI uri = java.net.URI.create("https://api.brevo.com/v3/smtp/email");
            
            // Build JSON payload safely
            StringBuilder json = new StringBuilder();
            json.append("{")
                .append("\"sender\":{\"name\":\"").append(escapeJson(fromName)).append("\",\"email\":\"").append(escapeJson(fromEmail)).append("\"},")
                .append("\"to\":[{\"email\":\"").append(escapeJson(toEmail)).append("\"}],")
                .append("\"subject\":\"").append(escapeJson(subject)).append("\",")
                .append("\"htmlContent\":\"").append(escapeJson(htmlContent)).append("\"")
                .append("}");

            java.net.http.HttpClient client = java.net.http.HttpClient.newBuilder()
                    .connectTimeout(java.time.Duration.ofSeconds(10))
                    .build();

            java.net.http.HttpRequest request = java.net.http.HttpRequest.newBuilder()
                    .uri(uri)
                    .header("api-key", apiKey.trim())
                    .header("Content-Type", "application/json")
                    .header("Accept", "application/json")
                    .POST(java.net.http.HttpRequest.BodyPublishers.ofString(json.toString(), java.nio.charset.StandardCharsets.UTF_8))
                    .timeout(java.time.Duration.ofSeconds(15))
                    .build();

            java.net.http.HttpResponse<String> response = client.send(request, java.net.http.HttpResponse.BodyHandlers.ofString());

            if (response.statusCode() >= 200 && response.statusCode() < 300) {
                LOGGER.info("Email successfully dispatched via Brevo HTTPS REST API to " + toEmail + " (Status: " + response.statusCode() + ")");
                return true;
            } else {
                LOGGER.warning("Brevo REST API returned error status " + response.statusCode() + ": " + response.body());
                return false;
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Exception while sending email via Brevo REST API: " + e.getMessage(), e);
            return false;
        }
    }

    private static String escapeJson(String input) {
        if (input == null) return "";
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < input.length(); i++) {
            char ch = input.charAt(i);
            switch (ch) {
                case '"': sb.append("\\\""); break;
                case '\\': sb.append("\\\\"); break;
                case '\b': sb.append("\\b"); break;
                case '\f': sb.append("\\f"); break;
                case '\n': sb.append("\\n"); break;
                case '\r': sb.append("\\r"); break;
                case '\t': sb.append("\\t"); break;
                default:
                    if (ch < ' ') {
                        String hex = Integer.toHexString(ch);
                        sb.append("\\u");
                        for (int k = 0; k < 4 - hex.length(); k++) sb.append('0');
                        sb.append(hex);
                    } else {
                        sb.append(ch);
                    }
            }
        }
        return sb.toString();
    }

    /**
     * Sends OTP registration code template
     */
    public static boolean sendOtpEmail(String recipientEmail, String recipientName, String otpCode) {
        String subject = "Your EstateHub Verification Code: " + otpCode;
        String htmlContent = "<div style='font-family: Arial, sans-serif; max-width: 600px; margin: 0 auto; padding: 24px; border: 1px solid #e2e8f0; border-radius: 8px; background-color: #ffffff;'>"
                + "<div style='text-align: center; margin-bottom: 24px;'>"
                + "<h1 style='color: #0f766e; margin: 0; font-size: 28px;'>EstateHub</h1>"
                + "<p style='color: #64748b; font-size: 14px; margin-top: 4px;'>Real Estate Marketplace & Property Recommendation System</p>"
                + "</div>"
                + "<div style='padding: 20px; background-color: #f8fafc; border-radius: 6px;'>"
                + "<h2 style='color: #1e293b; font-size: 18px; margin-top: 0;'>Hello " + escapeHtml(recipientName) + ",</h2>"
                + "<p style='color: #475569; line-height: 1.6;'>Thank you for joining EstateHub. Please use the following One-Time Password (OTP) to verify your account. This code is valid for 10 minutes.</p>"
                + "<div style='text-align: center; margin: 24px 0;'>"
                + "<span style='display: inline-block; font-size: 32px; font-weight: bold; letter-spacing: 8px; color: #0f766e; background-color: #ccfbf1; padding: 12px 32px; border-radius: 8px; border: 1px dashed #0d9488;'>"
                + otpCode + "</span>"
                + "</div>"
                + "<p style='color: #64748b; font-size: 13px; margin-bottom: 0;'>If you did not request this verification, please safely disregard this message.</p>"
                + "</div>"
                + "<div style='text-align: center; margin-top: 24px; color: #94a3b8; font-size: 12px;'>"
                + "&copy; 2026 EstateHub Inc. All rights reserved."
                + "</div>"
                + "</div>";

        return sendEmail(recipientEmail, subject, htmlContent);
    }

    private static String escapeHtml(String input) {
        if (input == null) return "";
        return input.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;").replace("\"", "&quot;");
    }
}
