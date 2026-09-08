package com.realestate.servlet.auth;

import com.realestate.dao.UserDAO;
import com.realestate.model.SessionUser;
import com.realestate.model.User;
import com.realestate.util.EmailUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Random;
import java.util.logging.Logger;

@WebServlet("/api/send-otp")
public class SendOtpApiServlet extends HttpServlet {
    private static final Logger LOGGER = Logger.getLogger(SendOtpApiServlet.class.getName());
    private final UserDAO userDAO = new UserDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        String email = request.getParameter("email");
        if (email == null || email.trim().isEmpty()) {
            response.getWriter().write("{\"success\": false, \"message\": \"Email is required\"}");
            return;
        }

        email = email.toLowerCase().trim();

        // Check if user already exists
        User existingUser = userDAO.findByEmail(email);
        if (existingUser != null) {
            response.getWriter().write("{\"success\": false, \"message\": \"An account with this email already exists\"}");
            return;
        }

        // Generate 6-digit OTP
        String otpCode = String.format("%06d", new Random().nextInt(999999));
        
        // Save to session (expires naturally when session expires)
        HttpSession session = request.getSession(true);
        session.setAttribute("reg_otp_" + email, otpCode);

        // Send email
        String subject = "Your Registration Verification Code";
        String htmlContent = "<div style=\"font-family: Arial, sans-serif; max-width: 600px; margin: 0 auto; padding: 20px; border: 1px solid #e0e0e0; border-radius: 5px;\">"
                + "<h2 style=\"color: #2c3e50; text-align: center;\">Verify Your Email</h2>"
                + "<p style=\"font-size: 16px; color: #333;\">Hello,</p>"
                + "<p style=\"font-size: 16px; color: #333;\">Please use the verification code below to complete your registration:</p>"
                + "<div style=\"background-color: #f8f9fa; padding: 15px; text-align: center; margin: 20px 0; border-radius: 4px;\">"
                + "<h1 style=\"letter-spacing: 5px; color: #004d5e; margin: 0;\">" + otpCode + "</h1>"
                + "</div>"
                + "<p style=\"font-size: 14px; color: #666;\">This code is valid for your current session. Do not share this code with anyone.</p>"
                + "</div>";

        boolean sent = EmailUtil.sendEmail(email, subject, htmlContent);

        if (sent) {
            response.getWriter().write("{\"success\": true, \"message\": \"OTP sent successfully\"}");
        } else {
            response.getWriter().write("{\"success\": false, \"message\": \"Failed to send OTP email\"}");
        }
    }
}
