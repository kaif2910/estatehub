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
            // Do not hardcode path, just use local directory for dev if it exists
            dotenv = Dotenv.configure().ignoreIfMissing().load();
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

    private static String getSecret(String key, String defaultValue) {
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
        final String smtpHost = getSecret("SMTP_HOST", "smtp.gmail.com");
        final String smtpPort = getSecret("SMTP_PORT", "587");
        final String smtpEmail = getSecret("SMTP_EMAIL", "");
        final String smtpPassword = getSecret("SMTP_APP_PASSWORD", "");
        final String fromName = getSecret("SMTP_FROM_NAME", "EstateHub Support");

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
            props.put("mail.smtp.ssl.protocols", "TLSv1.2");

            Session session = Session.getInstance(props, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(smtpEmail, smtpPassword);
                }
            });

            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(smtpEmail, fromName));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
            message.setSubject(subject, "UTF-8");
            message.setContent(htmlContent, "text/html; charset=UTF-8");

            Transport.send(message);
            LOGGER.info("Email successfully sent to " + recipientEmail);
            return true;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Failed to send email via SMTP to " + recipientEmail + ": " + e.getMessage(), e);
            return false;
        }
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
