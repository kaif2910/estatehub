package com.realestate;
import com.realestate.util.EmailUtil;
public class TestEmail {
    public static void main(String[] args) {
        System.out.println("Testing email to kaif282907@gmail.com...");
        boolean success = EmailUtil.sendOtpEmail("kaif282907@gmail.com", "Admin", "123456");
        System.out.println("Success: " + success);
    }
}
