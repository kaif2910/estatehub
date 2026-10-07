package com.realestate;

import com.realestate.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class UpdateProperties {
    public static void main(String[] args) {
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement("UPDATE properties SET verification_status = 'VERIFIED' WHERE verification_status = 'PENDING'")) {
            int rowsAffected = ps.executeUpdate();
            System.out.println("Successfully updated " + rowsAffected + " properties to VERIFIED status.");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
