package com.realestate;
import com.realestate.util.DBConnection;
import java.io.File;
import java.nio.file.Files;
import java.sql.Connection;
import java.sql.Statement;
public class SeedRunner {
    public static void main(String[] args) throws Exception {
        System.out.println("Connecting to DB...");
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement()) {
            System.out.println("Connected. Reading seed.sql...");
            String sql = new String(Files.readAllBytes(new File("seed.sql").toPath()));
            String[] stmts = sql.split(";");
            for (String s : stmts) {
                if (s.trim().isEmpty()) continue;
                try {
                    stmt.execute(s.trim());
                } catch (Exception e) {
                    System.out.println("Error on: " + s.substring(0, Math.min(s.length(), 50)) + "... -> " + e.getMessage());
                }
            }
            System.out.println("Done seeding.");
        }
    }
}
