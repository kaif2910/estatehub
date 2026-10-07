package com.realestate;
import java.util.Properties;
import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

public class TestDirectEmail {
    public static void main(String[] args) {
        String smtpHost = System.getenv().getOrDefault("SMTP_HOST", "smtp-relay.brevo.com");
        String smtpPort = System.getenv().getOrDefault("SMTP_PORT", "587");
        String smtpEmail = System.getenv().getOrDefault("SMTP_EMAIL", "");
        String smtpPassword = System.getenv().getOrDefault("SMTP_APP_PASSWORD", "");
        String fromEmail = System.getenv().getOrDefault("SMTP_FROM_EMAIL", smtpEmail);
        
        try {
            Properties props = new Properties();
            props.put("mail.smtp.host", smtpHost);
            props.put("mail.smtp.port", smtpPort);
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.ssl.protocols", "TLSv1.2 TLSv1.3");
            props.put("mail.smtp.ssl.trust", smtpHost);

            Session session = Session.getInstance(props, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(smtpEmail, smtpPassword);
                }
            });

            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail, "EstateHub Support"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(fromEmail));
            message.setSubject("EstateHub OTP Brevo Test", "UTF-8");
            message.setContent("<h3>EstateHub Brevo OTP Verification is WORKING!</h3>", "text/html; charset=UTF-8");

            System.out.println("Connecting to Brevo SMTP...");
            Transport.send(message);
            System.out.println("SUCCESS: Email sent via Brevo!");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
