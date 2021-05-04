package dao;

import models.User;

import java.sql.*;

import static driver.DBConnection.*;

public class UserDao {

    // MySql Queries!
    String creatUserInMySql = "INSERT INTO users" +
            " (firstName, lastName, email, password, gender, dateOfBirth) VALUES " +
            " (?, ?, ?, ?, ?, ?)";

    String getUserByEmailFromMySql = "SELECT * FROM users WHERE email = ?; ";


    public boolean createUser(User newUser) throws SQLException {
        System.out.println("User : " + creatUserInMySql);
        Connection connection = getConnection();
            User userAlreadyExist = getUserByEmail(newUser.getEmail());
            if (userAlreadyExist != null){
                System.out.println("An account is already linked to this email address");
                return false;
            }
            PreparedStatement statement = connection.prepareStatement(creatUserInMySql);
            statement.setString(1, newUser.getFirstName());
            statement.setString(2, newUser.getLastName());
            statement.setString(3, newUser.getEmail());
            statement.setString(4, newUser.getPassword());
            statement.setString(5, newUser.getGender());
            statement.setDate(6, newUser.getDateOfBirth());
            System.out.println(statement);
            statement.executeUpdate();
        System.out.println("Account created successfully!");
        return true;
    }


    public User getUserByEmail(String userEmail) throws SQLException {
        User user = null;
        Connection connection = getConnection();
        PreparedStatement statement = connection.prepareStatement(getUserByEmailFromMySql);
        statement.setString(1, userEmail);
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()){
            int userId = resultSet.getInt("userId");
            String firstName = resultSet.getString("firstName");
            String lastName = resultSet.getString("lastName");
            String email = resultSet.getString("email");
            String password = resultSet.getString("password");
            String gender = resultSet.getString("gender");
            Date dateOfBirth = resultSet.getDate("dateOfBirth");
           // String status = resultSet.getString("status");
            Timestamp lastLogin = resultSet.getTimestamp("lastLogin");
            Timestamp dateCreated = resultSet.getTimestamp("dateCreated");
            user = new User(userId, firstName, lastName, email, password, gender, dateOfBirth, lastLogin, dateCreated);
        }
        return user;
    }
}
