import java.sql.*;

public class TestDbConnect {
    public static void main(String[] args) {
        String dbUrl = "jdbc:mysql://gateway01.ap-southeast-1.prod.aws.tidbcloud.com:4000/estatehub?useSSL=true&allowPublicKeyRetrieval=true&serverTimezone=UTC&characterEncoding=UTF-8";
        String dbUser = "rC8wYYwdB6os4Fw.root";
        String dbPass = "KGMay56GUi5JLsgo";

        System.out.println("Connecting to TiDB at " + dbUrl);
        try (Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPass)) {
            System.out.println("SUCCESSFULLY CONNECTED TO TIDB!");
            try (Statement stmt = conn.createStatement()) {
                ResultSet rs = stmt.executeQuery("SHOW TABLES;");
                System.out.println("--- TABLES ---");
                while (rs.next()) {
                    System.out.println("Table: " + rs.getString(1));
                }
                
                System.out.println("--- USERS ---");
                ResultSet usersRs = stmt.executeQuery("SELECT user_id, name, email, role, status, email_verified FROM users;");
                while (usersRs.next()) {
                    System.out.println("ID: " + usersRs.getInt("user_id") + 
                                       " | Name: " + usersRs.getString("name") + 
                                       " | Email: " + usersRs.getString("email") + 
                                       " | Role: " + usersRs.getString("role") + 
                                       " | Status: " + usersRs.getString("status") + 
                                       " | Verified: " + usersRs.getBoolean("email_verified"));
                }
            }
        } catch (Exception e) {
            System.err.println("FAILED TO CONNECT / QUERY:");
            e.printStackTrace();
        }
    }
}
