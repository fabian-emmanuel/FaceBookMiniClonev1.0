package models;

import java.sql.Date;
import java.sql.Timestamp;

public class User {
    private int userId;
    private String firstName;
    private  String lastName;
    private String email;
    private  String password;
    private String gender;
    private Date dateOfBirth;
    //private String status;
    private Timestamp dateCreated;
    private Timestamp lastLogin;

    public User(int userId, String firstName, String lastName, String email, String password, String gender, Date dateOfBirth, Timestamp dateCreated, Timestamp lastLogin) {
        this.userId = userId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.dateOfBirth = dateOfBirth;
        //this.status = status;
        this.dateCreated = dateCreated;
        this.lastLogin = lastLogin;
    }

    public User(String firstName, String lastName, String email, String password, String gender, Date dateOfBirth) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.dateOfBirth = dateOfBirth;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

   /* public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
*/
    public Timestamp getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Timestamp dateCreated) {
        this.dateCreated = dateCreated;
    }

    public Timestamp getLastLogin() {
        return lastLogin;
    }

    public void setLastLogin(Timestamp lastLogin) {
        this.lastLogin = lastLogin;
    }

    @Override
    public String toString() {
        return "User{" +
                "userId=" + userId +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", gender='" + gender + '\'' +
                ", dateOfBirth='" + dateOfBirth + '\'' +
              //  ", status='" + status + '\'' +
                ", dateCreated=" + dateCreated +
                ", lastLogin=" + lastLogin +
                '}';
    }
}
