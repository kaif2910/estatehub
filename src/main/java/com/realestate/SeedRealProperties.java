package com.realestate;

import com.realestate.util.DBConnection;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class SeedRealProperties {
    public static void main(String[] args) {
        System.out.println("Updating database with real high-resolution property images and authentic listings...");

        try (Connection conn = DBConnection.getConnection()) {
            
            // 1. Clear old local /uploads relative paths for Property 30002
            try (PreparedStatement deleteImages = conn.prepareStatement("DELETE FROM property_images WHERE property_id = 30002")) {
                int deleted = deleteImages.executeUpdate();
                System.out.println("Cleared " + deleted + " broken local image paths for Property 30002.");
            }

            // 2. Insert clean HTTPS CDN photos for Property 30002 (Siws College Commercial Space)
            String[] siwsImages = {
                "https://images.unsplash.com/photo-1541829070764-84a7d30dd3f3?auto=format&fit=crop&w=1200&q=80",
                "https://images.unsplash.com/photo-1497366216548-37526070297c?auto=format&fit=crop&w=1200&q=80",
                "https://images.unsplash.com/photo-1497215728101-856f4ea42174?auto=format&fit=crop&w=1200&q=80"
            };

            for (int i = 0; i < siwsImages.length; i++) {
                try (PreparedStatement insertImg = conn.prepareStatement(
                        "INSERT INTO property_images (property_id, image_url, file_name, is_primary) VALUES (?, ?, ?, ?)")) {
                    insertImg.setInt(1, 30002);
                    insertImg.setString(2, siwsImages[i]);
                    insertImg.setString(3, "siws_photo_" + (i + 1) + ".jpg");
                    insertImg.setBoolean(4, i == 0);
                    insertImg.executeUpdate();
                }
            }
            System.out.println("Inserted " + siwsImages.length + " real photos for Siws College Commercial Space.");

            // 3. Add Property Listing 2: Lodha World Towers Luxury 3BHK
            int lodhaId = 0;
            try (PreparedStatement checkProp = conn.prepareStatement("SELECT property_id FROM properties WHERE title LIKE '%Lodha World Towers%'")) {
                ResultSet rs = checkProp.executeQuery();
                if (rs.next()) {
                    lodhaId = rs.getInt("property_id");
                }
            }

            if (lodhaId == 0) {
                String sqlLodha = "INSERT INTO properties (user_id, category_id, title, description, price, location, city, state, purpose, area_sqft, bedrooms, bathrooms, furnishing, availability, property_status, verification_status) "
                                + "VALUES (30002, 1, 'Lodha World Towers Luxury 3BHK Sky Villa', 'Ultra-premium 3BHK residence in Lower Parel with panoramic sea views, Italian marble flooring, and world-class amenities.', 35000000.00, 'Lower Parel, South Mumbai', 'Mumbai', 'Maharashtra', 'SALE', 1650.00, 3, 3, 'SEMI_FURNISHED', 'IMMEDIATE', 'AVAILABLE', 'VERIFIED')";
                try (PreparedStatement insertProp = conn.prepareStatement(sqlLodha, Statement.RETURN_GENERATED_KEYS)) {
                    insertProp.executeUpdate();
                    ResultSet keys = insertProp.getGeneratedKeys();
                    if (keys.next()) lodhaId = keys.getInt(1);
                }
            }

            if (lodhaId > 0) {
                try (PreparedStatement del = conn.prepareStatement("DELETE FROM property_images WHERE property_id = ?")) {
                    del.setInt(1, lodhaId);
                    del.executeUpdate();
                }
                String[] lodhaPhotos = {
                    "https://images.unsplash.com/photo-1545324418-cc1a3fa10c00?auto=format&fit=crop&w=1200&q=80",
                    "https://images.unsplash.com/photo-1600585154340-be6161a56a0c?auto=format&fit=crop&w=1200&q=80",
                    "https://images.unsplash.com/photo-1600566753376-12c8ab7fb75b?auto=format&fit=crop&w=1200&q=80"
                };
                for (int i = 0; i < lodhaPhotos.length; i++) {
                    try (PreparedStatement insertImg = conn.prepareStatement(
                            "INSERT INTO property_images (property_id, image_url, file_name, is_primary) VALUES (?, ?, ?, ?)")) {
                        insertImg.setInt(1, lodhaId);
                        insertImg.setString(2, lodhaPhotos[i]);
                        insertImg.setString(3, "lodha_photo_" + (i + 1) + ".jpg");
                        insertImg.setBoolean(4, i == 0);
                        insertImg.executeUpdate();
                    }
                }
                System.out.println("Inserted Lodha World Towers Listing (ID: " + lodhaId + ") with " + lodhaPhotos.length + " photos.");
            }

            // 4. Add Property Listing 3: Oberoi Garden City 2BHK Apartment
            int oberoiId = 0;
            try (PreparedStatement checkProp = conn.prepareStatement("SELECT property_id FROM properties WHERE title LIKE '%Oberoi Garden City%'")) {
                ResultSet rs = checkProp.executeQuery();
                if (rs.next()) {
                    oberoiId = rs.getInt("property_id");
                }
            }

            if (oberoiId == 0) {
                String sqlOberoi = "INSERT INTO properties (user_id, category_id, title, description, price, location, city, state, purpose, area_sqft, bedrooms, bathrooms, furnishing, availability, property_status, verification_status) "
                                 + "VALUES (30002, 1, 'Oberoi Garden City Premium 2BHK', 'Spacious 2BHK flat in Goregaon East overlooking lush green Aarey colony, walking distance to Metro Station.', 21500000.00, 'Goregaon East, Western Suburbs', 'Mumbai', 'Maharashtra', 'SALE', 1050.00, 2, 2, 'FULLY_FURNISHED', 'IMMEDIATE', 'AVAILABLE', 'VERIFIED')";
                try (PreparedStatement insertProp = conn.prepareStatement(sqlOberoi, Statement.RETURN_GENERATED_KEYS)) {
                    insertProp.executeUpdate();
                    ResultSet keys = insertProp.getGeneratedKeys();
                    if (keys.next()) oberoiId = keys.getInt(1);
                }
            }

            if (oberoiId > 0) {
                try (PreparedStatement del = conn.prepareStatement("DELETE FROM property_images WHERE property_id = ?")) {
                    del.setInt(1, oberoiId);
                    del.executeUpdate();
                }
                String[] oberoiPhotos = {
                    "https://images.unsplash.com/photo-1512917774080-9991f1c4c750?auto=format&fit=crop&w=1200&q=80",
                    "https://images.unsplash.com/photo-1613490493576-7fde63acd811?auto=format&fit=crop&w=1200&q=80"
                };
                for (int i = 0; i < oberoiPhotos.length; i++) {
                    try (PreparedStatement insertImg = conn.prepareStatement(
                            "INSERT INTO property_images (property_id, image_url, file_name, is_primary) VALUES (?, ?, ?, ?)")) {
                        insertImg.setInt(1, oberoiId);
                        insertImg.setString(2, oberoiPhotos[i]);
                        insertImg.setString(3, "oberoi_photo_" + (i + 1) + ".jpg");
                        insertImg.setBoolean(4, i == 0);
                        insertImg.executeUpdate();
                    }
                }
                System.out.println("Inserted Oberoi Garden City Listing (ID: " + oberoiId + ") with " + oberoiPhotos.length + " photos.");
            }

            System.out.println("SUCCESS: All properties updated with authentic real estate images!");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
