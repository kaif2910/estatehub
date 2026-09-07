package com.realestate.servlet.admin;

import com.realestate.dao.CategoryDAO;
import com.realestate.model.PropertyCategory;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/categories")
public class AdminCategoryServlet extends HttpServlet {

    private final CategoryDAO categoryDAO = new CategoryDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<PropertyCategory> categories = categoryDAO.findAll();
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("/views/admin-categories.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String action = request.getParameter("action");

        if ("delete".equalsIgnoreCase(action)) {
            int categoryId = Integer.parseInt(request.getParameter("categoryId"));
            categoryDAO.delete(categoryId);
            if (session != null) session.setAttribute("successMessage", "Category deleted successfully.");
        } else if ("create".equalsIgnoreCase(action)) {
            String name = request.getParameter("name");
            String slug = request.getParameter("slug");
            String description = request.getParameter("description");
            String iconClass = request.getParameter("iconClass");

            PropertyCategory cat = new PropertyCategory();
            cat.setName(name);
            cat.setSlug(slug != null && !slug.isEmpty() ? slug : name.toLowerCase().replaceAll("[^a-z0-9]", "-"));
            cat.setDescription(description);
            cat.setIconClass(iconClass != null && !iconClass.isEmpty() ? iconClass : "bi-building");

            categoryDAO.create(cat);
            if (session != null) session.setAttribute("successMessage", "Category added successfully.");
        }

        response.sendRedirect(request.getContextPath() + "/admin/categories");
    }
}
