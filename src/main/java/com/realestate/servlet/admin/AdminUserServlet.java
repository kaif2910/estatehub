package com.realestate.servlet.admin;

import com.realestate.dao.UserDAO;
import com.realestate.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/users")
public class AdminUserServlet extends HttpServlet {

    private final UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String roleFilter = request.getParameter("role");
        String statusFilter = request.getParameter("status");
        String search = request.getParameter("search");

        List<User> users = userDAO.findAllUsers(roleFilter, statusFilter, search);
        request.setAttribute("users", users);
        request.setAttribute("selectedRole", roleFilter);
        request.setAttribute("selectedStatus", statusFilter);
        request.setAttribute("searchTerm", search);

        request.getRequestDispatcher("/views/admin-users.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        int userId = Integer.parseInt(request.getParameter("userId"));
        HttpSession session = request.getSession(false);

        if ("suspend".equalsIgnoreCase(action)) {
            userDAO.updateUserStatus(userId, User.Status.SUSPENDED);
            if (session != null) session.setAttribute("successMessage", "User account has been suspended.");
        } else if ("activate".equalsIgnoreCase(action)) {
            userDAO.updateUserStatus(userId, User.Status.ACTIVE);
            if (session != null) session.setAttribute("successMessage", "User account has been activated.");
        }

        response.sendRedirect(request.getContextPath() + "/admin/users");
    }
}
