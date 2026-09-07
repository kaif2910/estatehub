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

@WebFilter(filterName = "RoleFilter", urlPatterns = {"/admin/*", "/seller/*", "/broker/*", "/customer/*"})
public class RoleFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {}

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        HttpSession session = httpRequest.getSession(false);
        User currentUser = (session != null) ? (User) session.getAttribute("currentUser") : null;

        if (currentUser == null) {
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/views/login.jsp");
            return;
        }

        String path = httpRequest.getRequestURI();
        User.Role role = currentUser.getRole();

        if (path.contains("/admin/") && role != User.Role.ADMIN) {
            httpResponse.sendError(HttpServletResponse.SC_FORBIDDEN, "Access Denied: Administrator role required.");
            return;
        }

        if (path.contains("/seller/") && role != User.Role.SELLER && role != User.Role.ADMIN) {
            httpResponse.sendError(HttpServletResponse.SC_FORBIDDEN, "Access Denied: Seller account required.");
            return;
        }

        if (path.contains("/broker/") && role != User.Role.BROKER && role != User.Role.ADMIN) {
            httpResponse.sendError(HttpServletResponse.SC_FORBIDDEN, "Access Denied: Broker account required.");
            return;
        }

        if (path.contains("/customer/") && role != User.Role.CUSTOMER && role != User.Role.ADMIN) {
            // Usually sellers/brokers can view customer views, but keep role clean
        }

        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {}
}
