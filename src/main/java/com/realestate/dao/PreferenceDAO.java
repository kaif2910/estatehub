package com.realestate.dao;

import com.realestate.model.Preference;
import com.realestate.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PreferenceDAO {

    public Preference findByUserId(int userId) {
        String sql = "SELECT p.*, c.name AS category_name FROM user_preferences p LEFT JOIN property_categories c ON p.category_id = c.category_id WHERE p.user_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return mapPreference(rs);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean saveOrUpdate(Preference pref) {
        String sql = "INSERT INTO user_preferences (user_id, preferred_location, preferred_city, min_price, max_price, category_id, preferred_bedrooms, preferred_area_sqft, preferred_purpose) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?) " +
                "ON DUPLICATE KEY UPDATE preferred_location=VALUES(preferred_location), preferred_city=VALUES(preferred_city), min_price=VALUES(min_price), max_price=VALUES(max_price), category_id=VALUES(category_id), preferred_bedrooms=VALUES(preferred_bedrooms), preferred_area_sqft=VALUES(preferred_area_sqft), preferred_purpose=VALUES(preferred_purpose)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, pref.getUserId());
            ps.setString(2, pref.getPreferredLocation());
            ps.setString(3, pref.getPreferredCity());
            ps.setBigDecimal(4, pref.getMinPrice());
            ps.setBigDecimal(5, pref.getMaxPrice());
            if (pref.getCategoryId() != null) {
                ps.setInt(6, pref.getCategoryId());
            } else {
                ps.setNull(6, java.sql.Types.INTEGER);
            }
            if (pref.getPreferredBedrooms() != null) {
                ps.setInt(7, pref.getPreferredBedrooms());
            } else {
                ps.setNull(7, java.sql.Types.INTEGER);
            }
            if (pref.getPreferredAreaSqft() != null) {
                ps.setBigDecimal(8, pref.getPreferredAreaSqft());
            } else {
                ps.setNull(8, java.sql.Types.DECIMAL);
            }
            ps.setString(9, pref.getPreferredPurpose().name());

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    private Preference mapPreference(ResultSet rs) throws SQLException {
        Preference p = new Preference();
        p.setPreferenceId(rs.getInt("preference_id"));
        p.setUserId(rs.getInt("user_id"));
        p.setPreferredLocation(rs.getString("preferred_location"));
        p.setPreferredCity(rs.getString("preferred_city"));
        p.setMinPrice(rs.getBigDecimal("min_price"));
        p.setMaxPrice(rs.getBigDecimal("max_price"));
        p.setCategoryId((Integer) rs.getObject("category_id"));
        p.setPreferredBedrooms((Integer) rs.getObject("preferred_bedrooms"));
        p.setPreferredAreaSqft(rs.getBigDecimal("preferred_area_sqft"));
        p.setPreferredPurpose(Preference.PurposePreference.valueOf(rs.getString("preferred_purpose")));
        p.setUpdatedAt(rs.getTimestamp("updated_at"));
        try {
            p.setCategoryName(rs.getString("category_name"));
        } catch (Exception ignored) {}
        return p;
    }
}
