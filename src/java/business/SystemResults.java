/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package business;

/**
 *
 * @author Stephen
 */
public class SystemResults {

    String playerName;
    String score;
    String invite;
    String optOut;
    String awards;
    String army;

    public SystemResults() {
        this.playerName = null;
        this.score = null;
        this.invite = null;
        this.optOut = null;
        this.awards = null;
        this.army = null;
    }

    public void setArmy(String army) {
        this.army = army;
    }

    public void setAwards(String awards) {
        this.awards = awards;
    }

    public String getArmy() {
        return army;
    }

    public String getAwards() {
        return awards;
    }

    public String getOptOut() {
        return optOut;
    }

    public String getPlayerName() {
        return playerName;
    }

    public String getScore() {
        return score;
    }

    public String getInvite() {
        return invite;
    }

    public void setOptOut(String optOut) {
        if (optOut.equals("yes")) {
            this.playerName = "Classified";
        }
        this.optOut = optOut;
    }

    public void setPlayerName(String playerName) {
        this.playerName = playerName;
    }

    public void setScore(String score) {
        this.score = score;
    }

    public void setInvite(String invite) {
        this.invite = invite;
    }
}
