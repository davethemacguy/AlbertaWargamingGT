

package business;

public class Encryption {
    String attemptedPassword;
    byte passWordHash;
    byte passWordSalt;
    
    public Encryption() {
        this.attemptedPassword = null;
        this.passWordSalt = 0;
        this.passWordHash = 0;
    }
    
    public String getAttemptedPassword() {
        return attemptedPassword;
    }
    
    public byte getPassWordHash() {
        return passWordHash;
    }
    
    public byte getPassWordSalt() {
        return passWordSalt;
    }
    
    public void setAttemptedPassword(String attemptedPassword) {
        this.attemptedPassword = attemptedPassword;
    }
    
    public void setPassWordHash() {
        this.passWordHash = passWordHash;
    }
    
    public void setPassWordSalt() {
        this.passWordSalt = passWordSalt;
    }
}

