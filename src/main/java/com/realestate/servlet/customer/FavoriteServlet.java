package com.realestate.servlet.customer;

import com.realestate.dao.FavoriteDAO;
import com.realestate.model.Property;
import com.realestate.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/favorites")
public class FavoriteServlet extends HttpServlet {

    private final FavoriteDAO favoriteDAO = new FavoriteDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User currentUser = (session != null) ? (User) session.getAttribute("currentUser") : null;
        if (currentUser == null) {
            response.sendRedirect(request.getContextPath() + "/views/login.jsp");
            return;
        }

        List<Property> favorites = favoriteDAO.getFavoritesByUser(currentUser.getUserId());
        request.setAttribute("favorites", favorites);
        request.getRequestDispatcher("/views/favorites.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User currentUser = (session != null) ? (User) session.getAttribute("currentUser") : null;
        if (currentUser == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            return;
        }

        String action = request.getParameter("action");
        String propIdStr = request.getParameter("propertyId");

        if (propIdStr != null) {
            try {
                int propertyId = Integer.parseInt(propIdStr);
                if ("remove".equalsIgnoreCase(action)) {
                    favoriteDAO.removeFavorite(currentUser.getUserId(), propertyId);
                } else {
                    favoriteDAO.addFavorite(currentUser.getUserId(), propertyId);
                }
                String redirect = request.getParameter("redirect");
                if (redirect != null && !redirect.isEmpty()) {
                    response.sendRedirect(redirect);
                    return;
                }
                response.setContentType("application/json");
                response.getWriter().write("{\"success\":true}");
            } catch (NumberFormatException e) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            }
        }
    }
}
