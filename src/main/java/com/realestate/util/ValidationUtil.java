package com.realestate.util;

import java.math.BigDecimal;
import java.util.Arrays;
import java.util.List;
import java.util.regex.Pattern;

public class ValidationUtil {

    private static final Pattern EMAIL_PATTERN = 
        Pattern.compile("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}$");

    private static final Pattern PHONE_PATTERN = 
        Pattern.compile("^\\+?[0-9\\s-]{7,20}$");

    private static final List<String> ALLOWED_IMAGE_EXTENSIONS = 
        Arrays.asList("jpg", "jpeg", "png", "webp");

    private static final List<String> ALLOWED_DOCUMENT_EXTENSIONS = 
        Arrays.asList("pdf", "jpg", "jpeg", "png");

    public static boolean isValidEmail(String email) {
        if (email == null || email.trim().isEmpty()) return false;
        return EMAIL_PATTERN.matcher(email.trim()).matches();
    }

    public static boolean isValidPhone(String phone) {
        if (phone == null || phone.trim().isEmpty()) return false;
        return PHONE_PATTERN.matcher(phone.trim()).matches();
    }

    public static boolean isValidPassword(String password) {
        // At least 6 chars
        return password != null && password.length() >= 6;
    }

    public static boolean isPositiveDecimal(BigDecimal value) {
        return value != null && value.compareTo(BigDecimal.ZERO) > 0;
    }

    public static boolean isPositiveInteger(int value) {
        return value >= 0;
    }

    public static boolean isAllowedImageExtension(String fileName) {
        if (fileName == null || !fileName.contains(".")) return false;
        String ext = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
        return ALLOWED_IMAGE_EXTENSIONS.contains(ext);
    }

    public static boolean isAllowedDocumentExtension(String fileName) {
        if (fileName == null || !fileName.contains(".")) return false;
        String ext = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
        return ALLOWED_DOCUMENT_EXTENSIONS.contains(ext);
    }

    public static String sanitizeString(String input) {
        if (input == null) return null;
        return input.trim();
    }
}
