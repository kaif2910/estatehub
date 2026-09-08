package com.realestate.servlet.customer;

import com.realestate.dao.PropertyDAO;
import com.realestate.model.Property;
import com.realestate.model.SessionUser;
import com.realestate.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;

@WebServlet("/property/details")
public class PropertyDetailServlet extends HttpServlet {

    private final PropertyDAO propertyDAO = new PropertyDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idStr = request.getParameter("id");
        if (idStr == null || idStr.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/search");
            return;
        }

        try {
            int propertyId = Integer.parseInt(idStr);
            HttpSession session = request.getSession(false);
            SessionUser currentUser = (session != null) ? (SessionUser) session.getAttribute("currentUser") : null;
            Integer userId = (currentUser != null) ? currentUser.getUserId() : null;

            Property property = propertyDAO.findById(propertyId, userId);
            if (property == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Property not found.");
                return;
            }

            // Track view
            String ipAddress = request.getRemoteAddr();
            propertyDAO.incrementViewCount(propertyId, userId, ipAddress);

            // Fetch recommended properties in the same locality / city
            List<Property> similar = propertyDAO.findPropertiesByLocality(property.getLocation(), property.getCity(), property.getPropertyId(), 4);
            if (similar.isEmpty()) {
                similar = propertyDAO.searchProperties(null, property.getCategoryId(), null, null, null, null, null, null, null, null, null, "newest", 1, 4);
            }

            // Generate WhatsApp wa.me click-to-chat link
            String rawPhone = property.getOwnerWhatsapp() != null ? property.getOwnerWhatsapp() : property.getOwnerPhone();
            String cleanPhone = rawPhone != null ? rawPhone.replaceAll("[^0-9]", "") : "";
            String defaultWaMsg = "Hello " + property.getOwnerName() + ", I am interested in your property listing on EstateHub: '" + property.getTitle() + "' ($" + property.getPrice() + "). Is it still available?";
            String encodedMsg = URLEncoder.encode(defaultWaMsg, StandardCharsets.UTF_8);
            String whatsappUrl = "https://wa.me/" + cleanPhone + "?text=" + encodedMsg;

            request.setAttribute("property", property);
            request.setAttribute("similarProperties", similar);
            request.setAttribute("whatsappUrl", whatsappUrl);

            request.getRequestDispatcher("/views/property-details.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/search");
        }
    }
}
