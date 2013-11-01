package business;

import java.io.Serializable;

public class User implements Serializable
{
    private String firstName;
    private String lastName;
    private String emailAddress;
    private String userID;
    private String userName;
    private String userRole;
    private String passWord;
    private String userDelete;
    
    public User()
    {
        userName ="";
        firstName = "";
        lastName = "";
        emailAddress = "";
        userID = "";
        passWord="";
        userRole = "";
        userDelete = "";

    }
    
    public User(String uname, String first, String last, String email, 
            String id, String pw, String ur, String ud)
    {
        userName = uname;
        firstName = first;
        lastName = last;
        emailAddress = email;
        userID = id;
        userRole = ur;
        passWord = pw;
        userDelete = ud;
    }

    public String getEmailAddress() {
        return emailAddress;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getUserDelete() {
        return userDelete;
    }

    public String getUserID() {
        return userID;
    }

    public String getUserName() {
        return userName;
    }

    public String getUserRole() {
        return userRole;
    }
    
    public String getPassWord() {
        return passWord;
    }

    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public void setUserDelete(String userDelete) {
        this.userDelete = userDelete;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setUserRole(String userRole) {
        this.userRole = userRole;
    }
    
    
    
}
