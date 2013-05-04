/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package business;

import java.io.Serializable;

public class Permissions implements Serializable
{
    
    private String userName;
    private String userRole;
   
    
    public Permissions()
    {
        userName ="";
        userRole = "";

    }
    
    public Permissions(String uname, String ur)
    {
        userName = uname;
        userRole = ur;
    }
    
    public void setUserName(String u)
    {
        userName = u;
    }
    public String getUserName()    
    {
        return userName;
    }
    public String getUserRole()
    {
        return userRole;
    }
    
    public void setUserRole(String ur)
    {
        userRole = ur;
    }
}