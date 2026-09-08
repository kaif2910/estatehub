package com.realestate.servlet.auth;

import com.realestate.service.AuthService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private final AuthService authService = new AuthService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/views/register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String role = request.getParameter("role");
        String whatsapp = request.getParameter("whatsapp");
        String otp = request.getParameter("otp");

        HttpSession session = request.getSession(true);
        String expectedOtp = (String) session.getAttribute("reg_otp_" + email.toLowerCase().trim());
        boolean preVerified = false;

        AuthService.AuthResult result = authService.register(name, email, password, phone, role, whatsapp, preVerified);

        if (result.isSuccess()) {
            com.realestate.model.User user = result.getUser();
            session.setAttribute("pendingOtpUserId", user.getUserId());
            session.setAttribute("pendingOtpEmail", user.getEmail());
            session.setAttribute("pendingOtpName", user.getName());
            session.setAttribute("successMessage", "Account created successfully! Enter your 6-digit OTP (or demo code 123456) to verify.");
            response.sendRedirect(request.getContextPath() + "/views/otp-verify.jsp");
        } else {
            request.setAttribute("errorMessage", result.getMessage());
            request.setAttribute("name", name);
            request.setAttribute("email", email);
            request.setAttribute("phone", phone);
            request.setAttribute("role", role);
            request.setAttribute("whatsapp", whatsapp);
            request.getRequestDispatcher("/views/register.jsp").forward(request, response);
        }
    }
}
