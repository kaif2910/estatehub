package com.realestate;

import com.realestate.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CheckUser {
    public static void main(String[] args) {
        String email = "kaif282907@gmail.com";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement("SELECT * FROM users WHERE email = ?")) {
            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    System.out.println("User found:");
                    System.out.println("Role: " + rs.getString("role"));
                    System.out.println("Password Hash: " + rs.getString("password"));
                } else {
                    System.out.println("User NOT found in database.");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
