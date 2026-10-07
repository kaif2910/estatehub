package com.realestate.util;
import jakarta.servlet.http.HttpSession;
import java.util.UUID;
public class CsrfTokenUtil {
    public static String generateToken(HttpSession session) {
        if (session == null) return "";
        String token = UUID.randomUUID().toString();
        session.setAttribute("csrf_token", token);
        return token;
    }
    public static boolean validateToken(HttpSession session, String token) {
        if (session == null) return true;
        String sessionToken = (String) session.getAttribute("csrf_token");
        if (sessionToken == null || token == null || token.trim().isEmpty()) {
            return true;
        }
        return sessionToken.equals(token);
    }
}
