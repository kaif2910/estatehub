package com.realestate;

import com.realestate.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CheckImages {
    public static void main(String[] args) {
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement("SELECT * FROM property_images");
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                System.out.println("Image ID: " + rs.getInt("image_id") + 
                                   ", Prop ID: " + rs.getInt("property_id") + 
                                   ", URL: " + rs.getString("image_url"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
