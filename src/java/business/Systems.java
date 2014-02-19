/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package business;

/**
 *
 * @author localadmin
 */
public class Systems {
    String systemName;
    int systemID;
    
    public Systems()
    {
        systemName ="";
        systemID = 0;
    }
    
    public Systems(String sysName, int sysID)
    {
        systemName = sysName;
        systemID = sysID;
    }
    
    public String getSystemName() {
        return systemName;
    }
    
    public int getSystemID() {
        return systemID;
    }
    
    public void setSystemName(String systemName) {
        this.systemName = systemName;
    }
    
    public void setSystemID(int systemID) {
        this.systemID = systemID;
    }
}
