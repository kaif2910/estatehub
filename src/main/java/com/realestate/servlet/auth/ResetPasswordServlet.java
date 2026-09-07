package com.realestate.servlet.auth;

import com.realestate.dao.UserDAO;
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
        HttpSession session = request.getSession(false);
        Integer userId = (session != null) ? (Integer) session.getAttribute("resetUserId") : null;
        
        if (userId == null) {
            response.sendRedirect(request.getContextPath() + "/views/forgot-password.jsp");
            return;
        }

        String otpCode = request.getParameter("otpCode");
        String newPassword = request.getParameter("newPassword");

        if (newPassword == null || newPassword.length() < 6) {
            request.setAttribute("errorMessage", "Password must be at least 6 characters.");
            request.getRequestDispatcher("/views/reset-password.jsp").forward(request, response);
            return;
        }

        boolean verified = otpService.verifyOtp(userId, otpCode, "PASSWORD_RESET");
        if (verified) {
            User user = userDAO.findById(userId);
            if (user != null) {
                user.setPassword(PasswordUtil.hashPassword(newPassword));
                
                boolean updated = updatePasswordInDB(userId, user.getPassword());
                if (updated) {
                    session.removeAttribute("resetUserId");
                    session.removeAttribute("resetEmail");
                    session.setAttribute("successMessage", "Password reset successfully! You can now log in.");
                    response.sendRedirect(request.getContextPath() + "/views/login.jsp");
                    return;
                }
            }
        }
        
        request.setAttribute("errorMessage", "Invalid or expired OTP code.");
        request.getRequestDispatcher("/views/reset-password.jsp").forward(request, response);
    }
    
    private boolean updatePasswordInDB(int userId, String hashedPassword) {
        try (java.sql.Connection conn = com.realestate.util.DBConnection.getConnection();
             java.sql.PreparedStatement pstmt = conn.prepareStatement("UPDATE users SET password = ? WHERE user_id = ?")) {
            pstmt.setString(1, hashedPassword);
            pstmt.setInt(2, userId);
            return pstmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
