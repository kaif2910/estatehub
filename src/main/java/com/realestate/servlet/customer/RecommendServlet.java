package com.realestate.servlet.customer;

import com.realestate.dao.PreferenceDAO;
import com.realestate.model.Preference;
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

@WebServlet("/recommendations")
public class RecommendServlet extends HttpServlet {

    private final RecommendationService recommendationService = new RecommendationService();
    private final PreferenceDAO preferenceDAO = new PreferenceDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User currentUser = (session != null) ? (User) session.getAttribute("currentUser") : null;
        if (currentUser == null) {
            response.sendRedirect(request.getContextPath() + "/views/login.jsp");
            return;
        }

        String locality = request.getParameter("locality");
        if (locality == null || locality.trim().isEmpty()) {
            locality = request.getParameter("city");
        }
        if (locality == null || locality.trim().isEmpty()) {
            locality = request.getParameter("keyword");
        }

        Preference preference = preferenceDAO.findByUserId(currentUser.getUserId());
        if (preference == null) {
            preference = new Preference();
            preference.setUserId(currentUser.getUserId());
        }

        if (locality != null && !locality.trim().isEmpty()) {
            preference.setPreferredLocation(locality.trim());
            preference.setPreferredCity(locality.trim());
        }

        List<RecommendationMatch> recommendations = recommendationService.getRecommendationsForUser(currentUser.getUserId(), 20);

        request.setAttribute("selectedLocality", locality);
        request.setAttribute("preference", preference);
        request.setAttribute("recommendations", recommendations);
        request.getRequestDispatcher("/views/recommendations.jsp").forward(request, response);
    }
}
