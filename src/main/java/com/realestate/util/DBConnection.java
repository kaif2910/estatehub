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

    // Default fallback: Live TiDB Cloud Database
    private static String dbUrl = "jdbc:mysql://gateway01.ap-southeast-1.prod.aws.tidbcloud.com:4000/estatehub?useSSL=true&allowPublicKeyRetrieval=true&serverTimezone=UTC&characterEncoding=UTF-8";
    private static String dbUser = "rC8wYYwdB6os4Fw.root";
    private static String dbPass = "KGMay56GUi5JLsgo";

    static {
        try {
            Dotenv dotenv = null;
<<<<<<< Updated upstream
            try {
                dotenv = Dotenv.configure().ignoreIfMissing().load();
            } catch (Exception e) {
                LOGGER.log(Level.INFO, "No local .env file found, proceeding with env/config");
=======
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
                    // Try to find .env by traversing up from user.dir
                    java.io.File currentDir = new java.io.File(System.getProperty("user.dir")).getAbsoluteFile();
                    while (currentDir != null) {
                        java.io.File envFile = new java.io.File(currentDir, ".env");
                        if (envFile.exists()) {
                            dotenv = Dotenv.configure().directory(currentDir.getAbsolutePath()).ignoreIfMissing().load();
                            break;
                        }
                        currentDir = currentDir.getParentFile();
                    }
                    if (dotenv == null) {
                        dotenv = Dotenv.configure().ignoreIfMissing().load();
                    }
                    if (dotenv.get("DB_URL") != null) {
                        dbUrl = dotenv.get("DB_URL");
                        dbUser = dotenv.get("DB_USER");
                        dbPass = dotenv.get("DB_PASS");
                    }
                } catch (Exception e) {
                    LOGGER.log(Level.INFO, "No local .env file found, proceeding with defaults");
                }
>>>>>>> Stashed changes
            }

            // 1. Helper to fetch non-empty value from Env Vars -> Dotenv -> config.properties
            String envUrl = getEnvValue("DB_URL", "DATABASE_URL", "MYSQL_URL", dotenv);
            String envUser = getEnvValue("DB_USER", "MYSQLUSER", "DB_USERNAME", dotenv);
            String envPass = getEnvValue("DB_PASS", "DB_PASSWORD", "MYSQLPASSWORD", dotenv);

            if (envUrl != null && !envUrl.trim().isEmpty()) {
                dbUrl = formatJdbcUrl(envUrl.trim());
            }
            if (envUser != null && !envUser.trim().isEmpty()) {
                dbUser = envUser.trim();
            }
            if (envPass != null) {
                dbPass = envPass.trim();
            }

            // Load driver
            try (InputStream input = DBConnection.class.getClassLoader().getResourceAsStream("config.properties")) {
                if (input != null) {
                    properties.load(input);
                    String driver = properties.getProperty("DB_DRIVER");
                    if (driver != null && !driver.trim().isEmpty()) {
                        Class.forName(driver.trim());
                    } else {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                    }
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

    private static String getEnvValue(String k1, String k2, String k3, Dotenv dotenv) {
        String val = getSingleEnv(k1, dotenv);
        if (val == null) val = getSingleEnv(k2, dotenv);
        if (val == null) val = getSingleEnv(k3, dotenv);
        return val;
    }

    private static String getSingleEnv(String key, Dotenv dotenv) {
        if (key == null) return null;
        String val = System.getenv(key);
        if (val != null && !val.trim().isEmpty()) {
            return val;
        }
        if (dotenv != null) {
            try {
                val = dotenv.get(key);
                if (val != null && !val.trim().isEmpty()) {
                    return val;
                }
            } catch (Exception ignored) {}
        }
        return null;
    }

    private static String formatJdbcUrl(String rawUrl) {
        if (rawUrl.startsWith("mysql://")) {
            return "jdbc:" + rawUrl;
        }
        return rawUrl;
    }

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException ignored) {}
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
