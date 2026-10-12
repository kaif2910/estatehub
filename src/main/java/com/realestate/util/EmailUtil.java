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

    private static final ThreadLocal<String> LAST_DELIVERY_ERROR = new ThreadLocal<>();

    public static String getLastDeliveryError() {
        String error = LAST_DELIVERY_ERROR.get();
        return error == null ? "Email delivery failed. Please try again or contact support." : error;
    }

    /** Sends real email through the configured SMTP server. */
    public static boolean sendEmail(String recipientEmail, String subject, String htmlContent) {
        LAST_DELIVERY_ERROR.remove();
        final String smtpHost = getSecret("SMTP_HOST", "smtp.gmail.com").trim();
        final String smtpPort = getSecret("SMTP_PORT", "587").trim();
        final String smtpEmail = getSecret("SMTP_EMAIL", "").trim();
        String configuredPassword = getSecret("SMTP_APP_PASSWORD", "").trim();
        final String smtpPassword = "smtp.gmail.com".equalsIgnoreCase(smtpHost)
                ? configuredPassword.replace(" ", "") : configuredPassword;
        final String fromEmail = getSecret("SMTP_FROM_EMAIL", smtpEmail).trim();
        final String fromName = getSecret("SMTP_FROM_NAME", "EstateHub Support");

        if (smtpEmail.isEmpty() || smtpPassword.isEmpty() || smtpEmail.contains("your_email")
                || smtpPassword.contains("your_")) {
            LAST_DELIVERY_ERROR.set("Email delivery is not configured. Please contact support.");
            LOGGER.warning("SMTP credentials are missing; email was not sent.");
            return false;
        }

        try {
            Properties props = smtpProperties(smtpHost, smtpPort);
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
            LOGGER.info("Email accepted by the configured SMTP server.");
            return true;
        } catch (jakarta.mail.AuthenticationFailedException e) {
            LAST_DELIVERY_ERROR.set("The email server rejected authentication. Please contact support to check the SMTP app password and configuration.");
            LOGGER.log(Level.WARNING, "SMTP authentication rejected: " + e.getMessage());
            return false;
        } catch (Exception e) {
            LAST_DELIVERY_ERROR.set("We could not send the verification email. Please retry or contact support.");
            LOGGER.log(Level.WARNING, "SMTP email delivery failed: " + e.getClass().getSimpleName());
            return false;
        }
    }

    static Properties smtpProperties(String host, String port) {
        boolean implicitSsl = "465".equals(port);
        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", port);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.ssl.enable", Boolean.toString(implicitSsl));
        props.put("mail.smtp.starttls.enable", Boolean.toString(!implicitSsl));
        props.put("mail.smtp.starttls.required", Boolean.toString(!implicitSsl));
        props.put("mail.smtp.ssl.checkserveridentity", "true");
        props.put("mail.smtp.ssl.protocols", "TLSv1.2 TLSv1.3");
        props.put("mail.smtp.connectiontimeout", "10000");
        props.put("mail.smtp.timeout", "10000");
        props.put("mail.smtp.writetimeout", "10000");
        return props;
    }

    /**
     * Sends OTP registration code template
     */
    public static boolean sendOtpEmail(String recipientEmail, String recipientName, String otpCode) {
        return sendOtpEmail(recipientEmail, recipientName, otpCode, false);
    }

    public static boolean sendOtpEmail(String recipientEmail, String recipientName, String otpCode, boolean admin) {
        String subject = admin ? "Your EstateHub Admin Login Code: " + otpCode
                : "Your EstateHub Verification Code: " + otpCode;
        String greeting = recipientName == null || recipientName.trim().isEmpty()
                ? (admin ? "EstateHub admin" : "EstateHub user") : recipientName.trim();
        String instructions = admin
                ? "Please use the following One-Time Password (OTP) to sign in to your EstateHub admin account."
                : "Please use the following One-Time Password (OTP) to verify your EstateHub account.";
        String htmlContent = "<div style='font-family: Arial, sans-serif; max-width: 600px; margin: 0 auto; padding: 24px; border: 1px solid #e2e8f0; border-radius: 8px; background-color: #ffffff;'>"
                + "<div style='text-align: center; margin-bottom: 24px;'>"
                + "<h1 style='color: #0f766e; margin: 0; font-size: 28px;'>EstateHub</h1>"
                + "<p style='color: #64748b; font-size: 14px; margin-top: 4px;'>Real Estate Marketplace & Property Recommendation System</p>"
                + "</div>"
                + "<div style='padding: 20px; background-color: #f8fafc; border-radius: 6px;'>"
                + "<h2 style='color: #1e293b; font-size: 18px; margin-top: 0;'>Hello " + escapeHtml(greeting) + ",</h2>"
                + "<p style='color: #475569; line-height: 1.6;'>" + instructions + " This code is valid for 10 minutes.</p>"
                + "<div style='text-align: center; margin: 24px 0;'>"
                + "<span style='display: inline-block; font-size: 32px; font-weight: bold; letter-spacing: 8px; color: #0f766e; background-color: #ccfbf1; padding: 12px 32px; border-radius: 8px; border: 1px dashed #0d9488;'>"
                + escapeHtml(otpCode) + "</span>"
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
