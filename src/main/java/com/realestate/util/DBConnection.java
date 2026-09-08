package com.realestate.util;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import io.github.cdimascio.dotenv.Dotenv;

public class DBConnection {
    private static final Logger LOGGER = Logger.getLogger(DBConnection.class.getName());
    private static Properties properties = new Properties();

    private static String dbUrl = "jdbc:mysql://localhost:3306/real_estate_marketplace?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC&characterEncoding=UTF-8";
    private static String dbUser = "root";
    private static String dbPass = "root";

    static {
        try {
            Dotenv dotenv = null;
            // 1. Try standard OS Environment Variables first (Railway, Render, etc.)
            String envUrl = System.getenv("DB_URL");
            String envUser = System.getenv("DB_USER");
            String envPass = System.getenv("DB_PASS");

            if (envUrl != null && !envUrl.isEmpty()) {
                dbUrl = envUrl;
                dbUser = envUser;
                dbPass = envPass;
            } else {
                // 2. Try Dotenv for local development without hardcoding Windows paths
                try {
                    dotenv = Dotenv.configure().ignoreIfMissing().load();
                    if (dotenv.get("DB_URL") != null) {
                        dbUrl = dotenv.get("DB_URL");
                        dbUser = dotenv.get("DB_USER");
                        dbPass = dotenv.get("DB_PASS");
                    }
                } catch (Exception e) {
                    LOGGER.log(Level.INFO, "No local .env file found, proceeding with defaults");
                }
            }
            
            // Fallback to config.properties if not in env
            try (InputStream input = DBConnection.class.getClassLoader().getResourceAsStream("config.properties")) {
                if (input != null) {
                    properties.load(input);
                    if (System.getenv("DB_URL") == null && (dotenv == null || dotenv.get("DB_URL") == null)) {
                        dbUrl = properties.getProperty("DB_URL", dbUrl);
                    }
                    if (System.getenv("DB_USER") == null && (dotenv == null || dotenv.get("DB_USER") == null)) {
                        dbUser = properties.getProperty("DB_USER", dbUser);
                    }
                    if (System.getenv("DB_PASS") == null && (dotenv == null || dotenv.get("DB_PASS") == null)) {
                        dbPass = properties.getProperty("DB_PASS", dbPass);
                    }
                    String driver = properties.getProperty("DB_DRIVER", "com.mysql.cj.jdbc.Driver");
                    Class.forName(driver);
                } else {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                }
            }
        } catch (Exception e) {
            LOGGER.log(Level.WARNING, "Error initializing DB driver or properties", e);
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException ignored) {}
        }
    }
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(dbUrl, dbUser, dbPass);
    }

    public static void closeQuietly(AutoCloseable resource) {
        if (resource != null) {
            try {
                resource.close();
            } catch (Exception ignored) {}
        }
    }
}
