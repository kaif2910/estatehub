package com.realestate.servlet.auth;

import com.realestate.model.SessionUser;
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
        HttpSession session = request.getSession(true);
        if (session.getAttribute("currentUser") != null) {
            // Need to map SessionUser if we were to check role, but just going to dashboard
            response.sendRedirect(request.getContextPath() + "/");
            return;
        }
        com.realestate.util.CsrfTokenUtil.generateToken(session);
        request.getRequestDispatcher("/views/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String csrfToken = request.getParameter("csrf_token");
        
        if (session == null || !com.realestate.util.CsrfTokenUtil.validateToken(session, csrfToken)) {
            request.setAttribute("errorMessage", "Invalid CSRF token or session expired.");
            request.getRequestDispatcher("/views/login.jsp").forward(request, response);
            return;
        }

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        AuthService.AuthResult result = authService.login(email, password);

        if (result.isSuccess()) {
            User user = result.getUser();
            if (session == null) {
                session = request.getSession(true);
            }
            
            if (user.getRole() == User.Role.ADMIN) {
                com.realestate.service.OtpService otpService = new com.realestate.service.OtpService();
                otpService.generateAndSendOtp(user, "REGISTRATION");
                
                session.setAttribute("pendingAdminUserId", user.getUserId());
                session.setAttribute("pendingAdminEmail", user.getEmail());
                session.setAttribute("pendingAdminName", user.getName());
                session.setAttribute("successMessage", "An OTP has been sent to your email for Admin Verification.");
                
                response.sendRedirect(request.getContextPath() + "/views/admin-login-otp.jsp");
                return;
            }

            if (!user.isEmailVerified()) {
                com.realestate.dao.UserDAO userDAO = new com.realestate.dao.UserDAO();
                user.setEmailVerified(true);
                user.setVerificationStatus(User.VerificationStatus.VERIFIED);
                userDAO.setEmailVerified(user.getUserId(), true);
                userDAO.updateUserVerificationStatus(user.getUserId(), User.VerificationStatus.VERIFIED, "Auto-verified on login");
            }

            session.setAttribute("currentUser", new com.realestate.model.SessionUser(user));
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
