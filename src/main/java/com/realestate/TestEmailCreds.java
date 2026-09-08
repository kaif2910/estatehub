package com.realestate;
import com.realestate.util.EmailUtil;
public class TestEmailCreds {
    public static void main(String[] args) {
        System.out.println("Email: " + EmailUtil.getSecret("SMTP_EMAIL", ""));
        System.out.println("Pass: " + EmailUtil.getSecret("SMTP_APP_PASSWORD", ""));
    }
}
