package com.realestate.dao;

import com.realestate.model.Property;
import com.realestate.model.PropertyImage;
import com.realestate.model.User;
import com.realestate.util.DBConnection;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class PropertyDAO {

    public int createProperty(Property property) {
        String sql = "INSERT INTO properties (user_id, category_id, title, description, price, location, city, state, purpose, area_sqft, bedrooms, bathrooms, furnishing, availability, property_status, verification_status, is_featured) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, property.getUserId());
            ps.setInt(2, property.getCategoryId());
            ps.setString(3, property.getTitle());
            ps.setString(4, property.getDescription());
            ps.setBigDecimal(5, property.getPrice());
            ps.setString(6, property.getLocation());
            ps.setString(7, property.getCity());
            ps.setString(8, property.getState());
            ps.setString(9, property.getPurpose().name());
            ps.setBigDecimal(10, property.getAreaSqft());
            ps.setInt(11, property.getBedrooms());
            ps.setInt(12, property.getBathrooms());
            ps.setString(13, property.getFurnishing().name());
            ps.setString(14, property.getAvailability().name());
            ps.setString(15, property.getPropertyStatus().name());
            ps.setString(16, property.getVerificationStatus().name());
            ps.setBoolean(17, property.isFeatured());

            int affected = ps.executeUpdate();
            if (affected > 0) {
                try (ResultSet rs = ps.getGeneratedKeys()) {
                    if (rs.next()) {
                        int propId = rs.getInt(1);
                        property.setPropertyId(propId);
                        return propId;
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    public boolean updateProperty(Property property) {
        String sql = "UPDATE properties SET category_id=?, title=?, description=?, price=?, location=?, city=?, state=?, purpose=?, area_sqft=?, bedrooms=?, bathrooms=?, furnishing=?, availability=?, property_status=?, verification_status=? WHERE property_id=? AND (user_id=? OR ?='ADMIN')";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, property.getCategoryId());
            ps.setString(2, property.getTitle());
            ps.setString(3, property.getDescription());
            ps.setBigDecimal(4, property.getPrice());
            ps.setString(5, property.getLocation());
            ps.setString(6, property.getCity());
            ps.setString(7, property.getState());
            ps.setString(8, property.getPurpose().name());
            ps.setBigDecimal(9, property.getAreaSqft());
            ps.setInt(10, property.getBedrooms());
            ps.setInt(11, property.getBathrooms());
            ps.setString(12, property.getFurnishing().name());
            ps.setString(13, property.getAvailability().name());
            ps.setString(14, property.getPropertyStatus().name());
            ps.setString(15, property.getVerificationStatus().name());
            ps.setInt(16, property.getPropertyId());
            ps.setInt(17, property.getUserId());
            ps.setString(18, "USER"); // or check session
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteProperty(int propertyId, int userId, boolean isAdmin) {
        String sql = isAdmin ? "DELETE FROM properties WHERE property_id = ?" : "DELETE FROM properties WHERE property_id = ? AND user_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, propertyId);
            if (!isAdmin) {
                ps.setInt(2, userId);
            }
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public Property findById(int propertyId, Integer currentUserId) {
        String sql = "SELECT p.*, c.name AS category_name, u.name AS owner_name, u.email AS owner_email, u.phone AS owner_phone, u.whatsapp_number AS owner_whatsapp, u.role AS owner_role, u.verification_status AS owner_verification_status, " +
                "(SELECT image_url FROM property_images pi WHERE pi.property_id = p.property_id ORDER BY pi.is_primary DESC, pi.image_id ASC LIMIT 1) AS primary_image_url " +
                "FROM properties p " +
                "JOIN property_categories c ON p.category_id = c.category_id " +
                "JOIN users u ON p.user_id = u.user_id " +
                "WHERE p.property_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, propertyId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Property p = mapProperty(rs);
                    p.setImages(getImagesForProperty(conn, propertyId));
                    if (currentUserId != null) {
                        p.setFavoriteByUser(isFavorite(conn, currentUserId, propertyId));
                    }
                    return p;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void incrementViewCount(int propertyId, Integer userId, String ipAddress) {
        String updateCountSql = "UPDATE properties SET view_count = view_count + 1 WHERE property_id = ?";
        String recordViewSql = "INSERT INTO property_views (property_id, user_id, ip_address) VALUES (?, ?, ?)";
        try (Connection conn = DBConnection.getConnection()) {
            try (PreparedStatement ps = conn.prepareStatement(updateCountSql)) {
                ps.setInt(1, propertyId);
                ps.executeUpdate();
            }
            try (PreparedStatement ps2 = conn.prepareStatement(recordViewSql)) {
                ps2.setInt(1, propertyId);
                if (userId != null) {
                    ps2.setInt(2, userId);
                } else {
                    ps2.setNull(2, java.sql.Types.INTEGER);
                }
                ps2.setString(3, ipAddress);
                ps2.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Property> findRecentlyViewed(int userId, int limit) {
        List<Property> list = new ArrayList<>();
        String sql = "SELECT p.*, c.name AS category_name, u.name AS owner_name, u.email AS owner_email, u.phone AS owner_phone, u.whatsapp_number AS owner_whatsapp, u.role AS owner_role, u.verification_status AS owner_verification_status, " +
                "(SELECT image_url FROM property_images pi WHERE pi.property_id = p.property_id ORDER BY pi.is_primary DESC, pi.image_id ASC LIMIT 1) AS primary_image_url " +
                "FROM properties p " +
                "JOIN property_categories c ON p.category_id = c.category_id " +
                "JOIN users u ON p.user_id = u.user_id " +
                "WHERE p.property_id IN (SELECT property_id FROM property_views WHERE user_id = ? " +
                "  AND property_id IN (SELECT property_id FROM properties WHERE verification_status IN ('VERIFIED','PENDING') AND property_status = 'AVAILABLE')) " +
                "ORDER BY (SELECT MAX(viewed_at) FROM property_views WHERE user_id = ? AND property_id = p.property_id) DESC LIMIT ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setInt(2, userId);
            ps.setInt(3, limit);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Property p = mapProperty(rs);
                    list.add(p);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Property> findFeatured(int limit) {
        List<Property> list = new ArrayList<>();
        String sql = "SELECT p.*, c.name AS category_name, u.name AS owner_name, u.email AS owner_email, u.phone AS owner_phone, u.whatsapp_number AS owner_whatsapp, u.role AS owner_role, u.verification_status AS owner_verification_status, " +
                "(SELECT image_url FROM property_images pi WHERE pi.property_id = p.property_id ORDER BY pi.is_primary DESC, pi.image_id ASC LIMIT 1) AS primary_image_url " +
                "FROM properties p " +
                "JOIN property_categories c ON p.category_id = c.category_id " +
                "JOIN users u ON p.user_id = u.user_id " +
                "WHERE p.verification_status IN ('VERIFIED', 'PENDING') AND p.property_status = 'AVAILABLE' " +
                "ORDER BY p.is_featured DESC, p.created_at DESC LIMIT ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, limit);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(mapProperty(rs));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Property> findByUser(int userId) {
        List<Property> list = new ArrayList<>();
        String sql = "SELECT p.*, c.name AS category_name, u.name AS owner_name, u.email AS owner_email, u.phone AS owner_phone, u.whatsapp_number AS owner_whatsapp, u.role AS owner_role, u.verification_status AS owner_verification_status, " +
                "(SELECT image_url FROM property_images pi WHERE pi.property_id = p.property_id ORDER BY pi.is_primary DESC, pi.image_id ASC LIMIT 1) AS primary_image_url " +
                "FROM properties p " +
                "JOIN property_categories c ON p.category_id = c.category_id " +
                "JOIN users u ON p.user_id = u.user_id " +
                "WHERE p.user_id = ? " +
                "ORDER BY p.created_at DESC";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Property p = mapProperty(rs);
                    p.setImages(getImagesForProperty(conn, p.getPropertyId()));
                    list.add(p);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Property> searchProperties(String keyword, Integer categoryId, String purpose, BigDecimal minPrice, BigDecimal maxPrice, Integer minBedrooms, Integer minBathrooms, BigDecimal minArea, BigDecimal maxArea, String furnishing, String availability, String sortBy, int page, int pageSize) {
        List<Property> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT p.*, c.name AS category_name, u.name AS owner_name, u.email AS owner_email, u.phone AS owner_phone, u.whatsapp_number AS owner_whatsapp, u.role AS owner_role, u.verification_status AS owner_verification_status, " +
                "(SELECT image_url FROM property_images pi WHERE pi.property_id = p.property_id ORDER BY pi.is_primary DESC, pi.image_id ASC LIMIT 1) AS primary_image_url " +
                "FROM properties p " +
                "JOIN property_categories c ON p.category_id = c.category_id " +
                "JOIN users u ON p.user_id = u.user_id " +
                "WHERE p.verification_status IN ('VERIFIED', 'PENDING') AND p.property_status = 'AVAILABLE' ");

        List<Object> params = new ArrayList<>();

        String cleanKeyword = (keyword != null) ? keyword.trim() : "";
        if (!cleanKeyword.isEmpty()) {
            String[] tokens = cleanKeyword.split("\\s+");
            for (String t : tokens) {
                if (!t.isEmpty()) {
                    sql.append(" AND (LOWER(p.title) LIKE ? OR LOWER(p.location) LIKE ? OR LOWER(p.city) LIKE ? OR LOWER(p.state) LIKE ? OR LOWER(p.description) LIKE ?");
                    String term = "%" + t.toLowerCase() + "%";
                    params.add(term); params.add(term); params.add(term); params.add(term); params.add(term);
                    if (t.length() >= 4) {
                        String stem = "%" + t.toLowerCase().substring(0, 4) + "%";
                        sql.append(" OR LOWER(p.title) LIKE ? OR LOWER(p.location) LIKE ? OR LOWER(p.city) LIKE ?");
                        params.add(stem); params.add(stem); params.add(stem);
                    }
                    sql.append(")");
                }
            }
        }
        if (categoryId != null && categoryId > 0) {
            sql.append(" AND p.category_id = ?");
            params.add(categoryId);
        }
        if (purpose != null && !purpose.isEmpty() && !"ANY".equalsIgnoreCase(purpose)) {
            sql.append(" AND p.purpose = ?");
            params.add(purpose.toUpperCase());
        }
        if (minPrice != null && minPrice.compareTo(BigDecimal.ZERO) > 0) {
            sql.append(" AND p.price >= ?");
            params.add(minPrice);
        }
        if (maxPrice != null && maxPrice.compareTo(BigDecimal.ZERO) > 0) {
            sql.append(" AND p.price <= ?");
            params.add(maxPrice);
        }
        if (minBedrooms != null && minBedrooms > 0) {
            sql.append(" AND p.bedrooms >= ?");
            params.add(minBedrooms);
        }
        if (minBathrooms != null && minBathrooms > 0) {
            sql.append(" AND p.bathrooms >= ?");
            params.add(minBathrooms);
        }
        if (minArea != null && minArea.compareTo(BigDecimal.ZERO) > 0) {
            sql.append(" AND p.area_sqft >= ?");
            params.add(minArea);
        }
        if (maxArea != null && maxArea.compareTo(BigDecimal.ZERO) > 0) {
            sql.append(" AND p.area_sqft <= ?");
            params.add(maxArea);
        }
        if (furnishing != null && !furnishing.isEmpty() && !"ANY".equalsIgnoreCase(furnishing)) {
            sql.append(" AND p.furnishing = ?");
            params.add(furnishing);
        }
        if (availability != null && !availability.isEmpty() && !"ANY".equalsIgnoreCase(availability)) {
            sql.append(" AND p.availability = ?");
            params.add(availability);
        }

        // Sorting - prioritize exact locality/city token match when keyword exists
        if ("price_asc".equalsIgnoreCase(sortBy)) {
            sql.append(" ORDER BY p.price ASC");
        } else if ("price_desc".equalsIgnoreCase(sortBy)) {
            sql.append(" ORDER BY p.price DESC");
        } else if ("area_desc".equalsIgnoreCase(sortBy)) {
            sql.append(" ORDER BY p.area_sqft DESC");
        } else {
            if (!cleanKeyword.isEmpty()) {
                sql.append(" ORDER BY (LOWER(p.location) LIKE ? OR LOWER(p.city) LIKE ?) DESC, p.is_featured DESC, p.created_at DESC");
                String matchTerm = "%" + cleanKeyword.toLowerCase() + "%";
                params.add(matchTerm);
                params.add(matchTerm);
            } else {
                sql.append(" ORDER BY p.is_featured DESC, p.created_at DESC");
            }
        }

        int offset = (page - 1) * pageSize;
        sql.append(" LIMIT ? OFFSET ?");
        params.add(pageSize);
        params.add(offset);

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql.toString())) {
            for (int i = 0; i < params.size(); i++) {
                ps.setObject(i + 1, params.get(i));
            }
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(mapProperty(rs));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Property> findPropertiesByLocality(String location, String city, int excludePropertyId, int limit) {
        List<Property> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT p.*, c.name AS category_name, u.name AS owner_name, u.email AS owner_email, u.phone AS owner_phone, u.whatsapp_number AS owner_whatsapp, u.role AS owner_role, u.verification_status AS owner_verification_status, " +
                "(SELECT image_url FROM property_images pi WHERE pi.property_id = p.property_id ORDER BY pi.is_primary DESC, pi.image_id ASC LIMIT 1) AS primary_image_url " +
                "FROM properties p " +
                "JOIN property_categories c ON p.category_id = c.category_id " +
                "JOIN users u ON p.user_id = u.user_id " +
                "WHERE p.verification_status IN ('VERIFIED', 'PENDING') AND p.property_status = 'AVAILABLE' AND p.property_id != ? ");

        List<Object> params = new ArrayList<>();
        params.add(excludePropertyId);

        String searchArea = (location != null && !location.trim().isEmpty()) ? location.trim() : (city != null ? city.trim() : "");
        if (!searchArea.isEmpty()) {
            sql.append("AND (");
            String[] tokens = searchArea.split("\\s+");
            for (int i = 0; i < tokens.length; i++) {
                if (i > 0) sql.append(" OR ");
                sql.append("LOWER(p.location) LIKE ? OR LOWER(p.city) LIKE ? OR LOWER(p.title) LIKE ?");
                String term = "%" + tokens[i].toLowerCase() + "%";
                params.add(term); params.add(term); params.add(term);
            }
            sql.append(") ");
        }

        sql.append("ORDER BY p.is_featured DESC, p.created_at DESC LIMIT ?");
        params.add(limit);

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql.toString())) {
            for (int i = 0; i < params.size(); i++) {
                ps.setObject(i + 1, params.get(i));
            }
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(mapProperty(rs));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Fallback: If no locality matches, return latest available properties
        if (list.isEmpty()) {
            return searchProperties(null, null, null, null, null, null, null, null, null, null, null, "newest", 1, limit);
        }
        return list;
    }

    public List<Property> findAllAdmin(String verificationStatus, String propertyStatus) {
        List<Property> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT p.*, c.name AS category_name, u.name AS owner_name, u.email AS owner_email, u.phone AS owner_phone, u.whatsapp_number AS owner_whatsapp, u.role AS owner_role, u.verification_status AS owner_verification_status, " +
                "(SELECT image_url FROM property_images pi WHERE pi.property_id = p.property_id ORDER BY pi.is_primary DESC, pi.image_id ASC LIMIT 1) AS primary_image_url " +
                "FROM properties p " +
                "JOIN property_categories c ON p.category_id = c.category_id " +
                "JOIN users u ON p.user_id = u.user_id WHERE 1=1 ");

        List<Object> params = new ArrayList<>();
        if (verificationStatus != null && !verificationStatus.isEmpty() && !"ALL".equalsIgnoreCase(verificationStatus)) {
            sql.append(" AND p.verification_status = ?");
            params.add(verificationStatus);
        }
        if (propertyStatus != null && !propertyStatus.isEmpty() && !"ALL".equalsIgnoreCase(propertyStatus)) {
            sql.append(" AND p.property_status = ?");
            params.add(propertyStatus);
        }
        sql.append(" ORDER BY p.created_at DESC");

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql.toString())) {
            for (int i = 0; i < params.size(); i++) {
                ps.setObject(i + 1, params.get(i));
            }
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Property p = mapProperty(rs);
                    p.setImages(getImagesForProperty(conn, p.getPropertyId()));
                    list.add(p);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean updateVerificationStatus(int propertyId, Property.VerificationStatus status, String rejectionReason) {
        String sql = "UPDATE properties SET verification_status = ?, rejection_reason = ? WHERE property_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, status.name());
            ps.setString(2, rejectionReason);
            ps.setInt(3, propertyId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Images
    public boolean addImage(PropertyImage img) {
        String sql = "INSERT INTO property_images (property_id, image_url, file_name, is_primary) VALUES (?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, img.getPropertyId());
            ps.setString(2, img.getImageUrl());
            ps.setString(3, img.getFileName());
            ps.setBoolean(4, img.isPrimary());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteImage(int imageId, int propertyId) {
        String sql = "DELETE FROM property_images WHERE image_id = ? AND property_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, imageId);
            ps.setInt(2, propertyId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<PropertyImage> getImagesForProperty(Connection conn, int propertyId) {
        List<PropertyImage> list = new ArrayList<>();
        String sql = "SELECT * FROM property_images WHERE property_id = ? ORDER BY is_primary DESC, image_id ASC";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, propertyId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    PropertyImage img = new PropertyImage();
                    img.setImageId(rs.getInt("image_id"));
                    img.setPropertyId(rs.getInt("property_id"));
                    img.setImageUrl(rs.getString("image_url"));
                    img.setFileName(rs.getString("file_name"));
                    img.setPrimary(rs.getBoolean("is_primary"));
                    img.setCreatedAt(rs.getTimestamp("created_at"));
                    list.add(img);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    private boolean isFavorite(Connection conn, int userId, int propertyId) {
        String sql = "SELECT 1 FROM favorites WHERE user_id = ? AND property_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setInt(2, propertyId);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    private Property mapProperty(ResultSet rs) throws SQLException {
        Property p = new Property();
        p.setPropertyId(rs.getInt("property_id"));
        p.setUserId(rs.getInt("user_id"));
        p.setCategoryId(rs.getInt("category_id"));
        p.setTitle(rs.getString("title"));
        p.setDescription(rs.getString("description"));
        p.setPrice(rs.getBigDecimal("price"));
        p.setLocation(rs.getString("location"));
        p.setCity(rs.getString("city"));
        p.setState(rs.getString("state"));
        p.setPurpose(Property.Purpose.valueOf(rs.getString("purpose")));
        p.setAreaSqft(rs.getBigDecimal("area_sqft"));
        p.setBedrooms(rs.getInt("bedrooms"));
        p.setBathrooms(rs.getInt("bathrooms"));
        p.setFurnishing(Property.Furnishing.valueOf(rs.getString("furnishing")));
        p.setAvailability(Property.Availability.valueOf(rs.getString("availability")));
        p.setPropertyStatus(Property.PropertyStatus.valueOf(rs.getString("property_status")));
        p.setVerificationStatus(Property.VerificationStatus.valueOf(rs.getString("verification_status")));
        p.setRejectionReason(rs.getString("rejection_reason"));
        p.setFeatured(rs.getBoolean("is_featured"));
        p.setViewCount(rs.getInt("view_count"));
        p.setCreatedAt(rs.getTimestamp("created_at"));
        p.setUpdatedAt(rs.getTimestamp("updated_at"));

        try {
            p.setCategoryName(rs.getString("category_name"));
            p.setOwnerName(rs.getString("owner_name"));
            p.setOwnerEmail(rs.getString("owner_email"));
            p.setOwnerPhone(rs.getString("owner_phone"));
            p.setOwnerWhatsapp(rs.getString("owner_whatsapp"));
            p.setOwnerRole(User.Role.valueOf(rs.getString("owner_role")));
            p.setOwnerVerificationStatus(User.VerificationStatus.valueOf(rs.getString("owner_verification_status")));
            p.setPrimaryImageUrl(rs.getString("primary_image_url"));
        } catch (Exception ignored) {}

        return p;
    }
}
