package com.realestate.dao;

import com.realestate.model.Favorite;
import com.realestate.model.Property;
import com.realestate.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FavoriteDAO {

    public boolean addFavorite(int userId, int propertyId) {
        String sql = "INSERT IGNORE INTO favorites (user_id, property_id) VALUES (?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setInt(2, propertyId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean removeFavorite(int userId, int propertyId) {
        String sql = "DELETE FROM favorites WHERE user_id = ? AND property_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setInt(2, propertyId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean isFavorite(int userId, int propertyId) {
        String sql = "SELECT 1 FROM favorites WHERE user_id = ? AND property_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
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

    public List<Property> getFavoritesByUser(int userId) {
        List<Property> list = new ArrayList<>();
        String sql = "SELECT p.*, c.name AS category_name, u.name AS owner_name, u.email AS owner_email, u.phone AS owner_phone, u.whatsapp_number AS owner_whatsapp, u.role AS owner_role, u.verification_status AS owner_verification_status, " +
                "(SELECT image_url FROM property_images pi WHERE pi.property_id = p.property_id ORDER BY pi.is_primary DESC, pi.image_id ASC LIMIT 1) AS primary_image_url " +
                "FROM favorites f " +
                "JOIN properties p ON f.property_id = p.property_id " +
                "JOIN property_categories c ON p.category_id = c.category_id " +
                "JOIN users u ON p.user_id = u.user_id " +
                "WHERE f.user_id = ? " +
                "ORDER BY f.created_at DESC";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
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
                    p.setCategoryName(rs.getString("category_name"));
                    p.setOwnerName(rs.getString("owner_name"));
                    p.setOwnerPhone(rs.getString("owner_phone"));
                    p.setOwnerWhatsapp(rs.getString("owner_whatsapp"));
                    p.setPrimaryImageUrl(rs.getString("primary_image_url"));
                    p.setFavoriteByUser(true);
                    list.add(p);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
