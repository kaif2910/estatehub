package com.realestate.util;

import java.util.Properties;
import org.junit.Test;
import static org.junit.Assert.*;

public class EmailUtilTest {
    @Test public void gmailPort587RequiresStartTls() {
        Properties props = EmailUtil.smtpProperties("smtp.gmail.com", "587");
        assertEquals("true", props.getProperty("mail.smtp.starttls.enable"));
        assertEquals("true", props.getProperty("mail.smtp.starttls.required"));
        assertEquals("false", props.getProperty("mail.smtp.ssl.enable"));
        assertEquals("true", props.getProperty("mail.smtp.ssl.checkserveridentity"));
    }

    @Test public void gmailPort465UsesImplicitSsl() {
        Properties props = EmailUtil.smtpProperties("smtp.gmail.com", "465");
        assertEquals("true", props.getProperty("mail.smtp.ssl.enable"));
        assertEquals("false", props.getProperty("mail.smtp.starttls.enable"));
        assertEquals("true", props.getProperty("mail.smtp.auth"));
    }
}
