package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import static driver.DBConnection.*;

public class UserTableDao {
    String mySql  = "CREATE TABLE IF NOT EXISTS users (" +
            "userId INTEGER PRIMARY KEY  AUTO_INCREMENT,"+
            "firstName Varchar(50) NOT NULL," +
            "lastName Varchar(50) NOT NULL,"+
            "email VARCHAR(100) NOT NULL," +
            "password VARCHAR(100) NOT NULL," +
            "gender VARCHAR(10) NOT NULL," +
            "dateOfBirth date not null, " +
            "address VARCHAR(200) NOT NULL," +
            "lastLoginDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP," +
            "dateCreated DATETIME DEFAULT CURRENT_TIMESTAMP);";

    public void createUserTable() throws SQLException {
        try (Connection connection = getConnection()) {
            PreparedStatement statement = connection.prepareStatement(mySql);
            statement.executeQuery();
            System.out.println("Table Created For Users");
        }

    }
}
