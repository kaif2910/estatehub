package com.realestate.servlet.customer;

import com.realestate.dao.FavoriteDAO;
import com.realestate.dao.InquiryDAO;
import com.realestate.dao.PropertyDAO;
import com.realestate.model.Inquiry;
import com.realestate.model.Property;
import com.realestate.model.RecommendationMatch;
import com.realestate.model.User;
import com.realestate.service.RecommendationService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/customer/dashboard")
public class CustomerDashboardServlet extends HttpServlet {

    private final PropertyDAO propertyDAO = new PropertyDAO();
    private final FavoriteDAO favoriteDAO = new FavoriteDAO();
    private final InquiryDAO inquiryDAO = new InquiryDAO();
    private final RecommendationService recommendationService = new RecommendationService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User currentUser = (session != null) ? (User) session.getAttribute("currentUser") : null;
        if (currentUser == null) {
            response.sendRedirect(request.getContextPath() + "/views/login.jsp");
            return;
        }

        int userId = currentUser.getUserId();
        List<Property> favorites = favoriteDAO.getFavoritesByUser(userId);
        List<Inquiry> inquiries = inquiryDAO.findByCustomerId(userId);
        List<Property> recentlyViewed = propertyDAO.findRecentlyViewed(userId, 6);
        List<RecommendationMatch> recommendations = recommendationService.getRecommendationsForUser(userId, 6);

        request.setAttribute("favoritesCount", favorites.size());
        request.setAttribute("inquiriesCount", inquiries.size());
        request.setAttribute("recommendationsCount", recommendations.size());
        request.setAttribute("recentlyViewedCount", recentlyViewed.size());

        request.setAttribute("favorites", favorites);
        request.setAttribute("inquiries", inquiries);
        request.setAttribute("recentlyViewed", recentlyViewed);
        request.setAttribute("recommendations", recommendations);

        request.getRequestDispatcher("/views/customer-dashboard.jsp").forward(request, response);
    }
}
