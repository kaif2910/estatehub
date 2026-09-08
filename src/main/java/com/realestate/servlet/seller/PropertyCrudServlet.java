package com.realestate.servlet.seller;

import com.realestate.dao.CategoryDAO;
import com.realestate.dao.PropertyDAO;
import com.realestate.model.Property;
import com.realestate.model.PropertyCategory;
import com.realestate.model.PropertyImage;
import com.realestate.model.SessionUser;
import com.realestate.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/property/crud")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
    maxFileSize = -1L,
    maxRequestSize = -1L
)
public class PropertyCrudServlet extends HttpServlet {

    private final PropertyDAO propertyDAO = new PropertyDAO();
    private final CategoryDAO categoryDAO = new CategoryDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        SessionUser currentUser = (session != null) ? (SessionUser) session.getAttribute("currentUser") : null;

        String action = request.getParameter("action");
        List<PropertyCategory> categories = categoryDAO.findAll();
        request.setAttribute("categories", categories);

        if ("edit".equalsIgnoreCase(action)) {
            if (currentUser == null) {
                response.sendRedirect(request.getContextPath() + "/views/login.jsp");
                return;
            }
            String propIdStr = request.getParameter("id");
            if (propIdStr != null) {
                Property prop = propertyDAO.findById(Integer.parseInt(propIdStr), currentUser.getUserId());
                if (prop != null && (prop.getUserId() == currentUser.getUserId() || currentUser.getRole() == User.Role.ADMIN)) {
                    request.setAttribute("property", prop);
                    request.getRequestDispatcher("/views/edit-property.jsp").forward(request, response);
                    return;
                }
            }
        }

        request.getRequestDispatcher("/views/add-property.jsp").forward(request, response);
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

        String action = request.getParameter("action");
        if ("delete".equalsIgnoreCase(action)) {
            int propId = Integer.parseInt(request.getParameter("propertyId"));
            boolean ok = propertyDAO.deleteProperty(propId, currentUser.getUserId(), currentUser.getRole() == User.Role.ADMIN);
            if (ok) {
                session.setAttribute("successMessage", "Property deleted successfully.");
            } else {
                session.setAttribute("errorMessage", "Failed to delete property.");
            }
            redirectDashboard(currentUser, request, response);
            return;
        }

        // Create or Update
        String propIdStr = request.getParameter("propertyId");
        String title = request.getParameter("title");
        String categoryIdStr = request.getParameter("categoryId");
        String description = request.getParameter("description");
        String priceStr = request.getParameter("price");
        String location = request.getParameter("location");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String purpose = request.getParameter("purpose");
        String areaStr = request.getParameter("areaSqft");
        String bedroomsStr = request.getParameter("bedrooms");
        String bathroomsStr = request.getParameter("bathrooms");
        String furnishing = request.getParameter("furnishing");
        String availability = request.getParameter("availability");

        Property p = new Property();
        p.setUserId(currentUser.getUserId());
        p.setTitle(title != null ? title.trim() : "");
        p.setCategoryId(categoryIdStr != null && !categoryIdStr.isEmpty() ? Integer.parseInt(categoryIdStr) : 1);
        p.setDescription(description != null ? description.trim() : "");
        p.setPrice(priceStr != null && !priceStr.isEmpty() ? new BigDecimal(priceStr) : BigDecimal.ZERO);
        p.setLocation(location != null ? location.trim() : "");
        p.setCity(city != null ? city.trim() : "");
        p.setState(state != null ? state.trim() : "CA");
        p.setPurpose(purpose != null ? Property.Purpose.valueOf(purpose) : Property.Purpose.SALE);
        p.setAreaSqft(areaStr != null && !areaStr.isEmpty() ? new BigDecimal(areaStr) : BigDecimal.ZERO);
        p.setBedrooms(bedroomsStr != null && !bedroomsStr.isEmpty() ? Integer.parseInt(bedroomsStr) : 1);
        p.setBathrooms(bathroomsStr != null && !bathroomsStr.isEmpty() ? Integer.parseInt(bathroomsStr) : 1);
        p.setFurnishing(furnishing != null ? Property.Furnishing.valueOf(furnishing) : Property.Furnishing.UNFURNISHED);
        p.setAvailability(availability != null ? Property.Availability.valueOf(availability) : Property.Availability.IMMEDIATE);
        p.setPropertyStatus(Property.PropertyStatus.AVAILABLE);
        p.setVerificationStatus(Property.VerificationStatus.PENDING); // submitted for admin approval

        List<String> errors = new ArrayList<>();
        if (p.getTitle() == null || p.getTitle().isEmpty()) {
            errors.add("Property title is required");
        }
        if (p.getPrice() == null || p.getPrice().compareTo(BigDecimal.ZERO) <= 0) {
            errors.add("Price must be greater than zero");
        }
        if (p.getCity() == null || p.getCity().isEmpty()) {
            errors.add("City is required");
        }
        if (p.getDescription() == null || p.getDescription().isEmpty()) {
            errors.add("Description is required");
        }
        if (p.getCategoryId() <= 0) {
            errors.add("Category is required");
        }
        
        if (!errors.isEmpty()) {
            session.setAttribute("errorMessage", String.join(", ", errors));
            response.sendRedirect(request.getContextPath() + "/property/crud?action=add");
            return;
        }

        if (propIdStr != null && !propIdStr.trim().isEmpty()) {
            // Edit
            p.setPropertyId(Integer.parseInt(propIdStr));
            propertyDAO.updateProperty(p);
            
            // Handle image uploads for Edit (Optional)
            handleImageUploads(request, p.getPropertyId());

            session.setAttribute("successMessage", "Property updated and re-submitted for admin verification.");
        } else {
            // Create
            int newId = propertyDAO.createProperty(p);
            if (newId > 0) {
                // Add initial images
                int uploadedCount = handleImageUploads(request, newId);
                
                if (uploadedCount == 0) {
                    PropertyImage img = new PropertyImage();
                    img.setPropertyId(newId);
                    img.setImageUrl("https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?auto=format&fit=crop&w=1200&q=80");
                    img.setFileName("listing_cover.jpg");
                    img.setPrimary(true);
                    propertyDAO.addImage(img);
                }

                session.setAttribute("successMessage", "Property submitted successfully! It is currently PENDING review by the admin team.");
            } else {
                session.setAttribute("errorMessage", "Failed to submit property. Please check the inputs.");
            }
        }

        redirectDashboard(currentUser, request, response);
    }
    
    private int handleImageUploads(HttpServletRequest request, int propertyId) throws IOException, ServletException {
        int count = 0;
        
        for (int i = 1; i <= 4; i++) {
            Part part = request.getPart("propertyPhoto" + i);
            if (part != null && part.getSize() > 0) {
                // Ignore files > 10MB
                if (part.getSize() > 1024 * 1024 * 10) {
                    request.getSession().setAttribute("errorMessage", "One or more images were too large (max 10MB) and were skipped.");
                    continue;
                }
                
                String fileName = System.currentTimeMillis() + "_" + getSubmittedFileName(part);
                
                String uploadDir = getServletContext().getRealPath("/uploads");
                if (uploadDir == null) {
                    uploadDir = System.getProperty("java.io.tmpdir") + File.separator + "estatehub-uploads";
                }
                File dir = new File(uploadDir);
                if (!dir.exists()) {
                    dir.mkdirs();
                }
                
                String savePath = uploadDir + File.separator + fileName;
                part.write(savePath);
                
                PropertyImage img = new PropertyImage();
                img.setPropertyId(propertyId);
                img.setImageUrl(request.getContextPath() + "/uploads/" + fileName);
                img.setFileName(fileName);
                img.setPrimary(count == 0); // First successfully uploaded image is primary
                propertyDAO.addImage(img);
                count++;
            }
        }
        return count;
    }

    private String getSubmittedFileName(Part part) {
        for (String cd : part.getHeader("content-disposition").split(";")) {
            if (cd.trim().startsWith("filename")) {
                return cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return "unknown";
    }

    private void redirectDashboard(SessionUser user, HttpServletRequest request, HttpServletResponse response) throws IOException {
        if (user.getRole() == User.Role.BROKER) {
            response.sendRedirect(request.getContextPath() + "/broker/dashboard");
        } else if (user.getRole() == User.Role.ADMIN) {
            response.sendRedirect(request.getContextPath() + "/admin/properties");
        } else if (user.getRole() == User.Role.SELLER) {
            response.sendRedirect(request.getContextPath() + "/seller/dashboard");
        } else {
            response.sendRedirect(request.getContextPath() + "/customer/dashboard");
        }
    }
}
