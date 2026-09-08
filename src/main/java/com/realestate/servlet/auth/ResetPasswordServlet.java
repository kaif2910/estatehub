package com.realestate.servlet.auth;

import com.realestate.dao.UserDAO;
import com.realestate.model.SessionUser;
import com.realestate.model.User;
import com.realestate.service.OtpService;
import com.realestate.util.PasswordUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/reset-password")
public class ResetPasswordServlet extends HttpServlet {

    private final UserDAO userDAO = new UserDAO();
    private final OtpService otpService = new OtpService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/views/reset-password.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String token = request.getParameter("token");
        String newPassword = request.getParameter("newPassword");

        if (token == null || token.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/views/forgot-password.jsp");
            return;
        }

        if (newPassword == null || newPassword.length() < 6) {
            request.setAttribute("errorMessage", "Password must be at least 6 characters.");
            request.setAttribute("token", token);
            request.getRequestDispatcher("/views/reset-password.jsp").forward(request, response);
            return;
        }

        User user = userDAO.getUserByResetToken(token);
        if (user != null) {
            user.setPassword(PasswordUtil.hashPassword(newPassword));
            boolean updated = userDAO.updatePassword(user.getUserId(), user.getPassword());
            if (updated) {
                userDAO.clearResetToken(user.getUserId());
                request.getSession().setAttribute("successMessage", "Password reset successfully! You can now log in.");
                response.sendRedirect(request.getContextPath() + "/views/login.jsp");
                return;
            }
        }
        
        request.setAttribute("errorMessage", "Invalid or expired reset link.");
        request.getRequestDispatcher("/views/reset-password.jsp").forward(request, response);
    }
}
