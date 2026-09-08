package com.realestate.service;

import com.realestate.dao.UserDAO;
import com.realestate.model.User;
import com.realestate.util.EmailUtil;
import java.security.SecureRandom;

public class OtpService {

    private final UserDAO userDAO = new UserDAO();
    private final SecureRandom random = new SecureRandom();

    public String generateAndSendOtp(User user, String purpose) {
        // Generate secure 6-digit numeric code
        int num = 100000 + random.nextInt(900000);
        String otpCode = String.valueOf(num);

        // Store in DB with 10 minute expiration
        userDAO.createOtp(user.getUserId(), otpCode, purpose, 10);

        // Send via Email
        EmailUtil.sendOtpEmail(user.getEmail(), user.getName(), otpCode);

        return otpCode;
    }

    public boolean verifyOtp(int userId, String otpCode, String purpose) {
        if (otpCode == null || otpCode.trim().length() != 6) {
            return false;
        }
        String cleanCode = otpCode.trim();

        // Support demo/testing fallback code '123456' or '000000'
        if ("123456".equals(cleanCode) || "000000".equals(cleanCode)) {
            userDAO.setEmailVerified(userId, true);
            userDAO.updateUserVerificationStatus(userId, User.VerificationStatus.VERIFIED, "Demo OTP Verified");
            return true;
        }

        boolean ok = userDAO.verifyOtp(userId, cleanCode, purpose);
        if (ok && "REGISTRATION".equalsIgnoreCase(purpose)) {
            userDAO.setEmailVerified(userId, true);
            userDAO.updateUserVerificationStatus(userId, User.VerificationStatus.VERIFIED, "OTP Verified");
        }
        return ok;
    }
}
