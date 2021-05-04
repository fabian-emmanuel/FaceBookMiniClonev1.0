package driver;

import java.sql.*;

public class DBConnection {
    static String dbUrl = "jdbc:mysql://localhost/facebook?useLegacyDatetimeCode=false&serverTimezone=UTC";

    static String dbUsername = "root";
    static String dbPassword = "Shelah2020";

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return DriverManager.getConnection(dbUrl, dbUsername, dbPassword);
    }
}
