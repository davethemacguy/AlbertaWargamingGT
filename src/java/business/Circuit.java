/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package business;

import java.io.Serializable;

/**
 *
 * @author localadmin
 */
public class Circuit implements Serializable
{
    private int circuitID;
    private String circuitName;
    private boolean isPublic;
    
    public Circuit()
    {
        circuitID = 0;
        circuitName = "";
        isPublic = true;
    }
    
    public Circuit(int cid, String cn, boolean pub)
    {
        circuitID = cid;
        circuitName = cn;
        isPublic = pub;
    }
    
    public int getCircuitID() {
        return circuitID;
    }
    
    public String getCircuitName() {
        return circuitName;
    }
    
    public boolean getIsPublic() {
        return isPublic;
    }
    
    public void setCircuitID(int circuitID) {
        this.circuitID=circuitID;
    }
    
    public void setCircuitName(String circuitName) {
        this.circuitName=circuitName;
    }
    
    public void setIsPublic(boolean isPublic) {
        this.isPublic=isPublic;
    }
}
