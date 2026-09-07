package com.realestate.filter;

import com.realestate.model.User;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "AuthFilter", urlPatterns = {
    "/customer/*", "/seller/*", "/broker/*", "/admin/*",
    "/favorites", "/preferences", "/inquiries", "/edit-property", "/verification", "/profile"
})
public class AuthFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {}

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        HttpSession session = httpRequest.getSession(false);
        boolean isLoggedIn = (session != null && session.getAttribute("currentUser") != null);

        if (!isLoggedIn) {
            String targetUri = httpRequest.getRequestURI();
            String query = httpRequest.getQueryString();
            if (query != null) {
                targetUri += "?" + query;
            }
            if (!targetUri.contains("login") && !targetUri.contains("register") && !targetUri.contains("otp")) {
                httpRequest.getSession(true).setAttribute("redirectAfterLogin", targetUri);
            }
            httpRequest.getSession(true).setAttribute("errorMessage", "Please log in to access this page.");
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/views/login.jsp");
            return;
        }

        // Prevent caching of protected pages
        httpResponse.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        httpResponse.setHeader("Pragma", "no-cache");
        httpResponse.setDateHeader("Expires", 0);

        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {}
}
