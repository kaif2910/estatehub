package com.realestate.servlet.auth;

import com.realestate.dao.UserDAO;
import com.realestate.model.SessionUser;
import com.realestate.model.User;
import com.realestate.service.OtpService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/forgot-password")
public class ForgotPasswordServlet extends HttpServlet {

    private final UserDAO userDAO = new UserDAO();
    private final OtpService otpService = new OtpService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/views/forgot-password.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        if (email == null || email.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Please provide an email address.");
            request.getRequestDispatcher("/views/forgot-password.jsp").forward(request, response);
            return;
        }

        User user = userDAO.findByEmail(email.trim().toLowerCase());
        if (user == null) {
            // For security, do not reveal if the email exists or not
            request.setAttribute("successMessage", "If an account with that email exists, a password reset OTP has been sent.");
            request.getRequestDispatcher("/views/forgot-password.jsp").forward(request, response);
            return;
        }

        String resetToken = java.util.UUID.randomUUID().toString();
        long expiresAt = System.currentTimeMillis() + (30 * 60 * 1000); // 30 minutes
        userDAO.updateResetToken(user.getUserId(), resetToken, expiresAt);

        String resetLink = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/reset-password?token=" + resetToken;
        String subject = "EstateHub Password Reset";
        String htmlBody = "<p>Hello " + user.getName() + ",</p>" +
                          "<p>Click the link below to reset your password. It is valid for 30 minutes.</p>" +
                          "<p><a href='" + resetLink + "'>Reset Password</a></p>";
        com.realestate.util.EmailUtil.sendEmail(user.getEmail(), subject, htmlBody);

        request.setAttribute("successMessage", "Password reset link sent successfully! Please check your email.");
        request.getRequestDispatcher("/views/forgot-password.jsp").forward(request, response);
    }
}
