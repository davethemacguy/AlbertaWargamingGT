/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package business;

/**
 *
 * @author Stephen
 */
public class TournamentResults {
    String tournamentName;
    String tournamentDate;
    String system;
    String playerName;
    String score;
    String army;
    String optOut;
    
    public TournamentResults(String tournamentName, String tournamentDate, String system, String playerName, String army, String score, String optOut){
        this.tournamentName = tournamentName;
        this.tournamentDate = tournamentDate;
        this.system = system;
        this.playerName = playerName;
        this.score = score;
        this.army = army;
        this.optOut = optOut;
    }
    
    public TournamentResults(){
        this.tournamentName = null;
        this.tournamentDate = null;
        this.system = null;
        this.playerName = null;
        this.score = null;
        this.army = null;
        this.optOut = "1";
    }
    
    public void clearTournamentResults(){
        this.tournamentName = null;
        this.tournamentDate = null;
        this.system = null;
        this.playerName = null;
        this.score = null;
        this.army = null;
        this.optOut = null;
    }

    public String getOptOut() {
        return optOut;
    }

    public String getArmy() {
        return army;
    }

    public String getPlayerName() {
        return playerName;
    }

    public String getScore() {
        return score;
    }

    public String getSystem() {
        return system;
    }

    public String getTournamentDate() {
        return tournamentDate;
    }

    public String getTournamentName() {
        return tournamentName;
    }

    public void setOptOut(String optOut) {
        this.optOut = optOut;
    }
    
    public void setArmy(String army) {
        this.army = army;
    }

    public void setPlayerName(String playerName) {
        this.playerName = playerName;
    }

    public void setScore(String score) {
        this.score = score;
    }

    public void setSystem(String system) {
        this.system = system;
    }

    public void setTournamentDate(String tournamentDate) {
        this.tournamentDate = tournamentDate;
    }

    public void setTournamentName(String tournamentName) {
        this.tournamentName = tournamentName;
    }
    
}
