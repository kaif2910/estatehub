package com.realestate.servlet.auth;

import com.realestate.dao.UserDAO;
import com.realestate.model.User;
import com.realestate.service.OtpService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/verify-otp")
public class OtpVerifyServlet extends HttpServlet {

    private final OtpService otpService = new OtpService();
    private final UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/views/otp-verify.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        
        Integer regUserId = (session != null) ? (Integer) session.getAttribute("pendingOtpUserId") : null;
        Integer adminUserId = (session != null) ? (Integer) session.getAttribute("pendingAdminUserId") : null;
        
        Integer userId = (adminUserId != null) ? adminUserId : regUserId;
        String purpose = (adminUserId != null) ? "ADMIN_LOGIN" : "REGISTRATION";
        
        String otpCode = request.getParameter("otpCode");
        String resend = request.getParameter("resend");

        if (userId == null) {
            response.sendRedirect(request.getContextPath() + "/views/login.jsp");
            return;
        }

        User user = userDAO.findById(userId);
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/views/login.jsp");
            return;
        }

        if ("true".equalsIgnoreCase(resend)) {
            otpService.generateAndSendOtp(user, purpose);
            request.setAttribute("successMessage", "A new 6-digit verification code has been sent to " + user.getEmail());
            String view = (adminUserId != null) ? "/views/admin-login-otp.jsp" : "/views/otp-verify.jsp";
            request.getRequestDispatcher(view).forward(request, response);
            return;
        }

        boolean verified = otpService.verifyOtp(userId, otpCode, purpose);
        if (verified) {
            if (adminUserId != null) {
                session.removeAttribute("pendingAdminUserId");
                session.removeAttribute("pendingAdminEmail");
                session.removeAttribute("pendingAdminName");
            } else {
                session.removeAttribute("pendingOtpUserId");
                session.removeAttribute("pendingOtpEmail");
                session.removeAttribute("pendingOtpName");
            }

            // Auto-login user
            user.setEmailVerified(true);
            user.setVerificationStatus(User.VerificationStatus.VERIFIED);
            userDAO.setEmailVerified(user.getUserId(), true);
            userDAO.updateUserVerificationStatus(user.getUserId(), User.VerificationStatus.VERIFIED, "OTP Verified");

            session.setAttribute("currentUser", user);
            session.setAttribute("userId", user.getUserId());
            session.setAttribute("name", user.getName());
            session.setAttribute("email", user.getEmail());
            session.setAttribute("role", user.getRole().name());
            session.setAttribute("verificationStatus", user.getVerificationStatus().name());
            session.setAttribute("successMessage", "Verification successful! Welcome to EstateHub.");

            String redirectUri = (String) session.getAttribute("redirectAfterLogin");
            session.removeAttribute("redirectAfterLogin");
            if (redirectUri != null && !redirectUri.contains("login") && !redirectUri.contains("register") && !redirectUri.contains("otp")) {
                response.sendRedirect(redirectUri);
                return;
            }

            switch (user.getRole()) {
                case ADMIN:
                    response.sendRedirect(request.getContextPath() + "/admin/dashboard");
                    break;
                case SELLER:
                    response.sendRedirect(request.getContextPath() + "/seller/dashboard");
                    break;
                case BROKER:
                    response.sendRedirect(request.getContextPath() + "/broker/dashboard");
                    break;
                case CUSTOMER:
                default:
                    response.sendRedirect(request.getContextPath() + "/customer/dashboard");
                    break;
            }
        } else {
            request.setAttribute("errorMessage", "Invalid or expired OTP code. Please verify and enter again.");
            String view = (adminUserId != null) ? "/views/admin-login-otp.jsp" : "/views/otp-verify.jsp";
            request.getRequestDispatcher(view).forward(request, response);
        }
    }
}
