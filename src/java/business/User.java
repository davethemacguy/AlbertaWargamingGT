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
    private String fullName;
    private long creationTime;
    private String cardID;
    private String cardVerified;
    private String isPrivate;
    private String blackFlagged;
    private String flagReason;
    private int flagCount;
    
    public User()
    {
        userName ="";
        firstName = "";
        lastName = "";
        fullName = "";
        emailAddress = "";
        userID = "";
        passWord="";
        userRole = "";
        userDelete = "";
        fullName = "";
        creationTime = 0;
        cardID = "";
        cardVerified = "";
        isPrivate = "";
        blackFlagged = "";
        flagReason = "";
        flagCount = 0;

    }
    
    public User(String uname, String first, String last, String full, String email, 
            String id, String pw, String ur, String ud, long ct, String cid, String cv, String prv, String bf, String fr, int fc)
    {
        userName = uname;
        firstName = first;
        lastName = last;
        fullName = full;
        emailAddress = email;
        userID = id;
        userRole = ur;
        passWord = pw;
        userDelete = ud;
        creationTime = ct;
        cardID = cid;
        cardVerified = cv;
        isPrivate = prv;
        blackFlagged = bf;
        flagReason = fr;
        flagCount = fc;
        
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
    
    public String getFullName() {
        return fullName;
    }
    
    public long getCreationTime() {
        return creationTime;
    }
    
    public String getCardID() {
        return cardID;
    }
    
    public String getCardVerified() {
        return cardVerified;
    }

    public String getIsPrivate() {
        return isPrivate;
    }
    
    public String getBlackFlagged() {
        return blackFlagged;
    }
    
    public String getFlagReason() {
        return flagReason;
    }
    
    public int getFlagCount() {
        return flagCount;
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
    
    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public void setCreationTime(long epoch) {
        this.creationTime = epoch;
    }
    
    public void setCardID(String cardID) {
        this.cardID = cardID;
    }
    
    public void setCardVerified(String cardVerified) {
        this.cardVerified = cardVerified;
    }
    
    public void setIsPrivate(String isPrivate) {
        this.isPrivate = isPrivate;
    }
    
    public void setBlackFlagged(String blackFlagged) {
        this.blackFlagged = blackFlagged;
    }
    
    public void setFlagReason(String flagReason) {
        this.flagReason = flagReason;
    }
    
    public void setFlagCount(int flagCount) {
        this.flagCount = flagCount;
    }
}
