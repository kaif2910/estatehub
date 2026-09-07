package com.realestate.servlet.auth;

import com.realestate.model.User;
import com.realestate.service.AuthService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private final AuthService authService = new AuthService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("currentUser") != null) {
            redirectBasedOnRole((User) session.getAttribute("currentUser"), request, response);
            return;
        }
        request.getRequestDispatcher("/views/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        AuthService.AuthResult result = authService.login(email, password);

        if (result.isSuccess()) {
            User user = result.getUser();
            HttpSession session = request.getSession(true);
            
            if (user.getRole() == User.Role.ADMIN) {
                com.realestate.service.OtpService otpService = new com.realestate.service.OtpService();
                otpService.generateAndSendOtp(user, "ADMIN_LOGIN");
                
                session.setAttribute("pendingAdminUserId", user.getUserId());
                session.setAttribute("pendingAdminEmail", user.getEmail());
                session.setAttribute("pendingAdminName", user.getName());
                session.setAttribute("successMessage", "An OTP has been sent to your email for Admin Verification.");
                
                response.sendRedirect(request.getContextPath() + "/views/admin-login-otp.jsp");
                return;
            }

            if (!user.isEmailVerified()) {
                com.realestate.service.OtpService otpService = new com.realestate.service.OtpService();
                otpService.generateAndSendOtp(user, "REGISTRATION");
                
                session.setAttribute("pendingOtpUserId", user.getUserId());
                session.setAttribute("pendingOtpEmail", user.getEmail());
                session.setAttribute("pendingOtpName", user.getName());
                session.setAttribute("successMessage", "First time login requires Email OTP verification. Please enter the code sent to your email.");
                
                response.sendRedirect(request.getContextPath() + "/views/otp-verify.jsp");
                return;
            }

            session.setAttribute("currentUser", user);
            session.setAttribute("userId", user.getUserId());
            session.setAttribute("name", user.getName());
            session.setAttribute("email", user.getEmail());
            session.setAttribute("role", user.getRole().name());
            session.setAttribute("verificationStatus", user.getVerificationStatus().name());

            String redirectUri = (String) session.getAttribute("redirectAfterLogin");
            session.removeAttribute("redirectAfterLogin");
            if (redirectUri != null && !redirectUri.contains("login") && !redirectUri.contains("register") && !redirectUri.contains("otp")) {
                response.sendRedirect(redirectUri);
                return;
            }

            redirectBasedOnRole(user, request, response);
        } else {
            request.setAttribute("errorMessage", result.getMessage());
            request.setAttribute("email", email);
            request.getRequestDispatcher("/views/login.jsp").forward(request, response);
        }
    }

    private void redirectBasedOnRole(User user, HttpServletRequest request, HttpServletResponse response)
            throws IOException {
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
    }
}
