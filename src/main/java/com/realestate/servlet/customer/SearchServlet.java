package com.realestate.servlet.customer;

import com.realestate.dao.CategoryDAO;
import com.realestate.dao.PropertyDAO;
import com.realestate.model.Property;
import com.realestate.model.PropertyCategory;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

@WebServlet("/search")
public class SearchServlet extends HttpServlet {

    private final PropertyDAO propertyDAO = new PropertyDAO();
    private final CategoryDAO categoryDAO = new CategoryDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String keyword = request.getParameter("keyword");
        if (keyword == null || keyword.trim().isEmpty()) {
            keyword = request.getParameter("query");
        }
        if (keyword == null || keyword.trim().isEmpty()) {
            keyword = request.getParameter("city");
        }
        if (keyword == null || keyword.trim().isEmpty()) {
            keyword = request.getParameter("location");
        }
        if (keyword == null || keyword.trim().isEmpty()) {
            keyword = request.getParameter("q");
        }
        String categoryIdStr = request.getParameter("categoryId");
        String purpose = request.getParameter("purpose");
        String minPriceStr = request.getParameter("minPrice");
        String maxPriceStr = request.getParameter("maxPrice");
        String bedroomsStr = request.getParameter("bedrooms");
        String bathroomsStr = request.getParameter("bathrooms");
        String minAreaStr = request.getParameter("minArea");
        String maxAreaStr = request.getParameter("maxArea");
        String furnishing = request.getParameter("furnishing");
        String availability = request.getParameter("availability");
        String sortBy = request.getParameter("sortBy");
        String pageStr = request.getParameter("page");

        Integer categoryId = parseInteger(categoryIdStr);
        BigDecimal minPrice = parseBigDecimal(minPriceStr);
        BigDecimal maxPrice = parseBigDecimal(maxPriceStr);
        Integer bedrooms = parseInteger(bedroomsStr);
        Integer bathrooms = parseInteger(bathroomsStr);
        BigDecimal minArea = parseBigDecimal(minAreaStr);
        BigDecimal maxArea = parseBigDecimal(maxAreaStr);
        int page = pageStr != null ? Math.max(1, Integer.parseInt(pageStr)) : 1;
        int pageSize = 12;

        List<Property> properties = propertyDAO.searchProperties(
                keyword, categoryId, purpose, minPrice, maxPrice,
                bedrooms, bathrooms, minArea, maxArea,
                furnishing, availability, sortBy, page, pageSize
        );

        List<PropertyCategory> categories = categoryDAO.findAll();

        request.setAttribute("properties", properties);
        request.setAttribute("categories", categories);
        request.setAttribute("keyword", keyword);
        request.setAttribute("categoryId", categoryId);
        request.setAttribute("purpose", purpose);
        request.setAttribute("minPrice", minPrice);
        request.setAttribute("maxPrice", maxPrice);
        request.setAttribute("bedrooms", bedrooms);
        request.setAttribute("bathrooms", bathrooms);
        request.setAttribute("furnishing", furnishing);
        request.setAttribute("availability", availability);
        request.setAttribute("sortBy", sortBy);
        request.setAttribute("currentPage", page);

        request.getRequestDispatcher("/views/search.jsp").forward(request, response);
    }

    private Integer parseInteger(String val) {
        if (val == null || val.trim().isEmpty()) return null;
        try { return Integer.parseInt(val.trim()); } catch (NumberFormatException e) { return null; }
    }

    private BigDecimal parseBigDecimal(String val) {
        if (val == null || val.trim().isEmpty()) return null;
        try { return new BigDecimal(val.trim()); } catch (NumberFormatException e) { return null; }
    }
}
