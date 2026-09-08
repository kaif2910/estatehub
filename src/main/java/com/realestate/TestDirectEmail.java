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
        String smtpEmail = "propertywallah28@gmail.com";
        String smtpPassword = "jdawujycviicwfqx";
        
        try {
            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.port", "587");
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
            message.setFrom(new InternetAddress(smtpEmail, "EstateHub Support"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse("kaif282907@gmail.com"));
            message.setSubject("Test Email", "UTF-8");
            message.setContent("Hello", "text/html; charset=UTF-8");

            Transport.send(message);
            System.out.println("Success!");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
