/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package business;

/**
 *
 * @author Stephen
 */
public class Army {
    String armyName;
    String score;
    
    public Army(){
        this.armyName = null;
        this.score = null;
    }

    public String getArmyName() {
        return armyName;
    }

    public String getScore() {
        return score;
    }

    public void setArmyName(String armyName) {
        this.armyName = armyName;
    }

    public void setScore(String score) {
        this.score = score;
    }
}
