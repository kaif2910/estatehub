package com.realestate;
import com.realestate.util.DBConnection;
import java.sql.Connection;
import java.sql.Statement;
public class AlterDB {
    public static void main(String[] args) throws Exception {
        System.out.println("Connecting to DB...");
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement()) {
            System.out.println("Connected. Altering table...");
            try {
                stmt.execute("ALTER TABLE users ADD COLUMN reset_token VARCHAR(255) NULL DEFAULT NULL;");
                stmt.execute("ALTER TABLE users ADD COLUMN reset_token_expires BIGINT NULL DEFAULT NULL;");
            } catch (Exception e) {
                System.out.println("Could not alter: " + e.getMessage());
            }
            System.out.println("Done.");
        }
    }
}
