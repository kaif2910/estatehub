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
     * Sends an HTML email using Gmail SMTP or logs to console if credentials not provided
     */
    public static boolean sendEmail(String recipientEmail, String subject, String htmlContent) {
        final String brevoApiKey = getSecret("BREVO_API_KEY", "");
        final String smtpEmail = getSecret("SMTP_EMAIL", "");
        final String fromName = getSecret("SMTP_FROM_NAME", "EstateHub Support");

        // If credentials are not configured, simulate delivery in development/demo mode
        if (brevoApiKey.isEmpty() || smtpEmail.isEmpty() || smtpEmail.contains("your_email")) {
            LOGGER.info("[SIMULATED EMAIL DISPATCH]");
            LOGGER.info("To: " + recipientEmail);
            LOGGER.info("Subject: " + subject);
            LOGGER.info("Body: " + htmlContent);
            return true;
        }

        try {
            // Build simple JSON payload manually to avoid extra dependencies
            String jsonPayload = "{"
                    + "\"sender\": {\"name\": \"" + escapeJson(fromName) + "\", \"email\": \"" + escapeJson(smtpEmail) + "\"},"
                    + "\"to\": [{\"email\": \"" + escapeJson(recipientEmail) + "\"}],"
                    + "\"subject\": \"" + escapeJson(subject) + "\","
                    + "\"htmlContent\": \"" + escapeJson(htmlContent) + "\""
                    + "}";

            java.net.http.HttpRequest request = java.net.http.HttpRequest.newBuilder()
                    .uri(java.net.URI.create("https://api.brevo.com/v3/smtp/email"))
                    .header("Accept", "application/json")
                    .header("Content-Type", "application/json")
                    .header("api-key", brevoApiKey)
                    .POST(java.net.http.HttpRequest.BodyPublishers.ofString(jsonPayload))
                    .build();

            java.net.http.HttpClient client = java.net.http.HttpClient.newHttpClient();
            java.net.http.HttpResponse<String> response = client.send(request, java.net.http.HttpResponse.BodyHandlers.ofString());

            if (response.statusCode() >= 200 && response.statusCode() < 300) {
                LOGGER.info("Email successfully sent via Brevo API to " + recipientEmail);
                return true;
            } else {
                LOGGER.severe("Failed to send email via Brevo API. Status: " + response.statusCode() + " Response: " + response.body());
                return false;
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Exception occurred while sending email via Brevo API to " + recipientEmail + ": " + e.getMessage(), e);
            return false;
        }
    }

    private static String escapeJson(String input) {
        if (input == null) return "";
        return input.replace("\\", "\\\\")
                    .replace("\"", "\\\"")
                    .replace("\b", "\\b")
                    .replace("\f", "\\f")
                    .replace("\n", "\\n")
                    .replace("\r", "\\r")
                    .replace("\t", "\\t");
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
