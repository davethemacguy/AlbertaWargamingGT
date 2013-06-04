/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package business;

import java.io.Serializable;

/**
 *
 * @author Stephen
 */
public class Tournament implements Serializable {

    String tournamentName;
    String tournamentDate;
    String system;
    String bestOverall;
    String bestGeneral;
    String bestPainted;
    String bestSport;

    public Tournament(String tournamentName, String tournamentDate, String system, String bestOverall, String bestGeneral, String bestPainted, String bestSport) {
        this.tournamentName = tournamentName;
        this.tournamentDate = tournamentDate;
        this.system = system;
        this.bestOverall = bestOverall;
        this.bestGeneral = bestGeneral;
        this.bestPainted = bestPainted;
        this.bestSport = bestSport;
    }

    public Tournament() {
        this.tournamentName = null;
        this.tournamentDate = null;
        this.system = null;
        this.bestOverall = null;
        this.bestGeneral = null;
        this.bestPainted = null;
        this.bestSport = null;
    }

    public String getBestGeneral() {
        return bestGeneral;
    }

    public String getBestOverall() {
        return bestOverall;
    }

    public String getBestPainted() {
        return bestPainted;
    }

    public String getBestSport() {
        return bestSport;
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

    public void setBestGeneral(String bestGeneral) {
        this.bestGeneral = bestGeneral;
    }

    public void setBestOverall(String bestOverall) {
        this.bestOverall = bestOverall;
    }

    public void setBestPainted(String bestPainted) {
        this.bestPainted = bestPainted;
    }

    public void setBestSport(String bestSport) {
        this.bestSport = bestSport;
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
