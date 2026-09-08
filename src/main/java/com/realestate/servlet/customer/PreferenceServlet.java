package com.realestate.servlet.customer;

import com.realestate.dao.CategoryDAO;
import com.realestate.dao.PreferenceDAO;
import com.realestate.model.Preference;
import com.realestate.model.PropertyCategory;
import com.realestate.model.SessionUser;
import com.realestate.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

@WebServlet("/preferences")
public class PreferenceServlet extends HttpServlet {

    private final PreferenceDAO preferenceDAO = new PreferenceDAO();
    private final CategoryDAO categoryDAO = new CategoryDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        SessionUser currentUser = (session != null) ? (SessionUser) session.getAttribute("currentUser") : null;
        if (currentUser == null) {
            response.sendRedirect(request.getContextPath() + "/views/login.jsp");
            return;
        }

        Preference pref = preferenceDAO.findByUserId(currentUser.getUserId());
        if (pref == null) {
            pref = new Preference();
            pref.setUserId(currentUser.getUserId());
        }

        List<PropertyCategory> categories = categoryDAO.findAll();
        request.setAttribute("preference", pref);
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("/views/preferences.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        SessionUser currentUser = (session != null) ? (SessionUser) session.getAttribute("currentUser") : null;
        if (currentUser == null) {
            response.sendRedirect(request.getContextPath() + "/views/login.jsp");
            return;
        }

        String location = request.getParameter("preferredLocation");
        String city = request.getParameter("preferredCity");
        String minPriceStr = request.getParameter("minPrice");
        String maxPriceStr = request.getParameter("maxPrice");
        String categoryIdStr = request.getParameter("categoryId");
        String bedroomsStr = request.getParameter("preferredBedrooms");
        String areaStr = request.getParameter("preferredAreaSqft");
        String purposeStr = request.getParameter("preferredPurpose");

        Preference pref = new Preference();
        pref.setUserId(currentUser.getUserId());
        pref.setPreferredLocation(location);
        pref.setPreferredCity(city != null && !city.trim().isEmpty() ? city : location);
        pref.setMinPrice(minPriceStr != null && !minPriceStr.isEmpty() ? new BigDecimal(minPriceStr) : BigDecimal.ZERO);
        pref.setMaxPrice(maxPriceStr != null && !maxPriceStr.isEmpty() ? new BigDecimal(maxPriceStr) : new BigDecimal("10000000"));
        if (categoryIdStr != null && !categoryIdStr.isEmpty()) {
            pref.setCategoryId(Integer.parseInt(categoryIdStr));
        }
        if (bedroomsStr != null && !bedroomsStr.isEmpty()) {
            pref.setPreferredBedrooms(Integer.parseInt(bedroomsStr));
        }
        if (areaStr != null && !areaStr.isEmpty()) {
            pref.setPreferredAreaSqft(new BigDecimal(areaStr));
        }
        if (purposeStr != null && !purposeStr.isEmpty()) {
            pref.setPreferredPurpose(Preference.PurposePreference.valueOf(purposeStr));
        }

        preferenceDAO.saveOrUpdate(pref);
        session.setAttribute("successMessage", "Property preferences updated successfully! Check your new personalized recommendations.");
        response.sendRedirect(request.getContextPath() + "/recommendations");
    }
}
