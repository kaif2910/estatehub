package com.realestate.dao;

import com.realestate.model.User;
import com.realestate.model.VerificationDocument;
import com.realestate.model.VerificationRequest;
import com.realestate.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class VerificationDAO {

    public int createRequest(VerificationRequest req) {
        String sql = "INSERT INTO verification_requests (user_id, business_name, license_number, tax_id_or_pan, status) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, req.getUserId());
            ps.setString(2, req.getBusinessName());
            ps.setString(3, req.getLicenseNumber());
            ps.setString(4, req.getTaxIdOrPan());
            ps.setString(5, req.getStatus().name());

            int affected = ps.executeUpdate();
            if (affected > 0) {
                try (ResultSet rs = ps.getGeneratedKeys()) {
                    if (rs.next()) {
                        int reqId = rs.getInt(1);
                        req.setRequestId(reqId);
                        // Also update user verification_status to PENDING
                        new UserDAO().updateUserVerificationStatus(req.getUserId(), User.VerificationStatus.PENDING, null);
                        return reqId;
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    public boolean addDocument(VerificationDocument doc) {
        String sql = "INSERT INTO verification_documents (request_id, document_type, file_path, original_file_name, file_size_kb) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, doc.getRequestId());
            ps.setString(2, doc.getDocumentType().name());
            ps.setString(3, doc.getFilePath());
            ps.setString(4, doc.getOriginalFileName());
            ps.setInt(5, doc.getFileSizeKb());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public VerificationRequest findLatestByUserId(int userId) {
        String sql = "SELECT r.*, u.name AS user_name, u.email AS user_email, u.phone AS user_phone, u.role AS user_role " +
                "FROM verification_requests r " +
                "JOIN users u ON r.user_id = u.user_id " +
                "WHERE r.user_id = ? ORDER BY r.created_at DESC LIMIT 1";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    VerificationRequest req = mapRequest(rs);
                    req.setDocuments(getDocumentsForRequest(conn, req.getRequestId()));
                    return req;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<VerificationRequest> findAll(String statusFilter) {
        List<VerificationRequest> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT r.*, u.name AS user_name, u.email AS user_email, u.phone AS user_phone, u.role AS user_role " +
                "FROM verification_requests r " +
                "JOIN users u ON r.user_id = u.user_id WHERE 1=1 ");

        if (statusFilter != null && !statusFilter.isEmpty() && !"ALL".equalsIgnoreCase(statusFilter)) {
            sql.append(" AND r.status = ?");
        }
        sql.append(" ORDER BY r.created_at DESC");

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql.toString())) {
            if (statusFilter != null && !statusFilter.isEmpty() && !"ALL".equalsIgnoreCase(statusFilter)) {
                ps.setString(1, statusFilter);
            }
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    VerificationRequest req = mapRequest(rs);
                    req.setDocuments(getDocumentsForRequest(conn, req.getRequestId()));
                    list.add(req);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean reviewRequest(int requestId, VerificationRequest.Status status, String adminNotes, int adminUserId) {
        String sql = "UPDATE verification_requests SET status = ?, admin_notes = ?, reviewed_by = ?, reviewed_at = NOW() WHERE request_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, status.name());
            ps.setString(2, adminNotes);
            ps.setInt(3, adminUserId);
            ps.setInt(4, requestId);
            boolean ok = ps.executeUpdate() > 0;
            if (ok) {
                // Find userId
                String uSql = "SELECT user_id FROM verification_requests WHERE request_id = ?";
                try (PreparedStatement uPs = conn.prepareStatement(uSql)) {
                    uPs.setInt(1, requestId);
                    try (ResultSet uRs = uPs.executeQuery()) {
                        if (uRs.next()) {
                            int uid = uRs.getInt("user_id");
                            User.VerificationStatus uStatus = (status == VerificationRequest.Status.APPROVED) ?
                                    User.VerificationStatus.VERIFIED : User.VerificationStatus.REJECTED;
                            new UserDAO().updateUserVerificationStatus(uid, uStatus, adminNotes);
                        }
                    }
                }
            }
            return ok;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    private List<VerificationDocument> getDocumentsForRequest(Connection conn, int requestId) {
        List<VerificationDocument> docs = new ArrayList<>();
        String sql = "SELECT * FROM verification_documents WHERE request_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, requestId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    VerificationDocument d = new VerificationDocument();
                    d.setDocumentId(rs.getInt("document_id"));
                    d.setRequestId(rs.getInt("request_id"));
                    d.setDocumentType(VerificationDocument.DocumentType.valueOf(rs.getString("document_type")));
                    d.setFilePath(rs.getString("file_path"));
                    d.setOriginalFileName(rs.getString("original_file_name"));
                    d.setFileSizeKb(rs.getInt("file_size_kb"));
                    d.setCreatedAt(rs.getTimestamp("created_at"));
                    docs.add(d);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return docs;
    }

    private VerificationRequest mapRequest(ResultSet rs) throws SQLException {
        VerificationRequest r = new VerificationRequest();
        r.setRequestId(rs.getInt("request_id"));
        r.setUserId(rs.getInt("user_id"));
        r.setBusinessName(rs.getString("business_name"));
        r.setLicenseNumber(rs.getString("license_number"));
        r.setTaxIdOrPan(rs.getString("tax_id_or_pan"));
        r.setStatus(VerificationRequest.Status.valueOf(rs.getString("status")));
        r.setAdminNotes(rs.getString("admin_notes"));
        r.setReviewedBy((Integer) rs.getObject("reviewed_by"));
        r.setReviewedAt(rs.getTimestamp("reviewed_at"));
        r.setCreatedAt(rs.getTimestamp("created_at"));
        try {
            r.setUserName(rs.getString("user_name"));
            r.setUserEmail(rs.getString("user_email"));
            r.setUserPhone(rs.getString("user_phone"));
            r.setUserRole(User.Role.valueOf(rs.getString("user_role")));
        } catch (Exception ignored) {}
        return r;
    }
}
