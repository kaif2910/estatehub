package com.realestate.util;
import jakarta.servlet.http.HttpSession;
import java.util.UUID;
public class CsrfTokenUtil {
    public static String generateToken(HttpSession session) {
        String token = UUID.randomUUID().toString();
        session.setAttribute("csrf_token", token);
        return token;
    }
    public static boolean validateToken(HttpSession session, String token) {
        String sessionToken = (String) session.getAttribute("csrf_token");
        return sessionToken != null && sessionToken.equals(token);
    }
}
