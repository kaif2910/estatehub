package com.realestate.dao;

import com.realestate.model.Inquiry;
import com.realestate.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class InquiryDAO {

    public int createInquiry(Inquiry inq) {
        String sql = "INSERT INTO inquiries (property_id, customer_id, message, contact_phone, preferred_visit_date, status) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, inq.getPropertyId());
            ps.setInt(2, inq.getCustomerId());
            ps.setString(3, inq.getMessage());
            ps.setString(4, inq.getContactPhone());
            ps.setDate(5, inq.getPreferredVisitDate());
            ps.setString(6, inq.getStatus().name());

            int affected = ps.executeUpdate();
            if (affected > 0) {
                try (ResultSet rs = ps.getGeneratedKeys()) {
                    if (rs.next()) {
                        int inqId = rs.getInt(1);
                        inq.setInquiryId(inqId);
                        return inqId;
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    public List<Inquiry> findByCustomerId(int customerId) {
        List<Inquiry> list = new ArrayList<>();
        String sql = "SELECT i.*, p.title AS property_title, p.location AS property_location, p.city AS property_city, p.price AS property_price, " +
                "(SELECT image_url FROM property_images pi WHERE pi.property_id = p.property_id ORDER BY pi.is_primary DESC LIMIT 1) AS property_image_url, " +
                "u.user_id AS seller_id, u.name AS seller_name " +
                "FROM inquiries i " +
                "JOIN properties p ON i.property_id = p.property_id " +
                "JOIN users u ON p.user_id = u.user_id " +
                "WHERE i.customer_id = ? ORDER BY i.created_at DESC";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, customerId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(mapInquiry(rs));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Inquiry> findBySellerId(int sellerId) {
        List<Inquiry> list = new ArrayList<>();
        String sql = "SELECT i.*, p.title AS property_title, p.location AS property_location, p.city AS property_city, p.price AS property_price, " +
                "(SELECT image_url FROM property_images pi WHERE pi.property_id = p.property_id ORDER BY pi.is_primary DESC LIMIT 1) AS property_image_url, " +
                "c.name AS customer_name, c.email AS customer_email, c.phone AS customer_phone " +
                "FROM inquiries i " +
                "JOIN properties p ON i.property_id = p.property_id " +
                "JOIN users c ON i.customer_id = c.user_id " +
                "WHERE p.user_id = ? ORDER BY i.created_at DESC";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, sellerId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(mapInquiry(rs));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Inquiry> findAllAdmin() {
        List<Inquiry> list = new ArrayList<>();
        String sql = "SELECT i.*, p.title AS property_title, p.location AS property_location, p.city AS property_city, p.price AS property_price, " +
                "(SELECT image_url FROM property_images pi WHERE pi.property_id = p.property_id ORDER BY pi.is_primary DESC LIMIT 1) AS property_image_url, " +
                "c.name AS customer_name, c.email AS customer_email, c.phone AS customer_phone, " +
                "s.user_id AS seller_id, s.name AS seller_name " +
                "FROM inquiries i " +
                "JOIN properties p ON i.property_id = p.property_id " +
                "JOIN users c ON i.customer_id = c.user_id " +
                "JOIN users s ON p.user_id = s.user_id " +
                "ORDER BY i.created_at DESC";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                list.add(mapInquiry(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean replyInquiry(int inquiryId, String replyText) {
        String sql = "UPDATE inquiries SET seller_reply = ?, status = 'RESPONDED', replied_at = NOW() WHERE inquiry_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, replyText);
            ps.setInt(2, inquiryId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateStatus(int inquiryId, Inquiry.Status status) {
        String sql = "UPDATE inquiries SET status = ? WHERE inquiry_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, status.name());
            ps.setInt(2, inquiryId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    private Inquiry mapInquiry(ResultSet rs) throws SQLException {
        Inquiry inq = new Inquiry();
        inq.setInquiryId(rs.getInt("inquiry_id"));
        inq.setPropertyId(rs.getInt("property_id"));
        inq.setCustomerId(rs.getInt("customer_id"));
        inq.setMessage(rs.getString("message"));
        inq.setContactPhone(rs.getString("contact_phone"));
        inq.setPreferredVisitDate(rs.getDate("preferred_visit_date"));
        inq.setStatus(Inquiry.Status.valueOf(rs.getString("status")));
        inq.setSellerReply(rs.getString("seller_reply"));
        inq.setRepliedAt(rs.getTimestamp("replied_at"));
        inq.setCreatedAt(rs.getTimestamp("created_at"));
        try {
            inq.setPropertyTitle(rs.getString("property_title"));
            inq.setPropertyLocation(rs.getString("property_location"));
            inq.setPropertyCity(rs.getString("property_city"));
            inq.setPropertyPrice(rs.getString("property_price"));
            inq.setPropertyImageUrl(rs.getString("property_image_url"));
        } catch (Exception ignored) {}
        try {
            inq.setCustomerName(rs.getString("customer_name"));
            inq.setCustomerEmail(rs.getString("customer_email"));
            inq.setCustomerPhone(rs.getString("customer_phone"));
        } catch (Exception ignored) {}
        try {
            inq.setSellerId(rs.getInt("seller_id"));
            inq.setSellerName(rs.getString("seller_name"));
        } catch (Exception ignored) {}
        return inq;
    }
}
