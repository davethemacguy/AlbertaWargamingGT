package business;

import java.io.Serializable;

public class ResetPassword implements Serializable
{
    private String id;
    private String userName;
    private long time;
    private String resetable;

    
    public ResetPassword()
    {
        userName ="";
        time = 0;
        id = "";
        resetable = "false";
    }
    
    public String getID() {
        return id;
    }

    public long getTime() {
        return time;
    }
    public String getUserName() {
        return userName;
    }
    public String getResetable() {
        return resetable;
    }

    public void setID(String id) {
        this.id = id;
    }

    public void setTime(long time) {
        this.time = time;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
    public void setResetable(String resetable) {
        this.resetable = resetable;
    }
}
