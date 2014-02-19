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

    String tournamentSeason;
    String tournamentName;
    String tournamentDate;
    String tournamentOrganizer;
    int tournamentID;
    String system;
    String bestOverall;
    String bestGeneral;
    String bestPainted;
    String bestSport;
    int tournamentCost;
    int maxPlayers;
    int minPlayers;
    int playersPerTeam;
    int tournamentParticipants;
    
    
    public Tournament(String tournamentSeason, String tournamentName, String tournamentDate, String tournamentOrganizer, int tournamentID, String system, String bestOverall, 
            String bestGeneral, String bestPainted, String bestSport, int tournamentCost, int maxPlayers, int minPlayers, int playersPerTeam, int tournamentParticipants) {
        this.tournamentSeason = tournamentSeason;
 	this.tournamentName = tournamentName;
        this.tournamentDate = tournamentDate;
        this.tournamentOrganizer = tournamentOrganizer;
        this.tournamentID = tournamentID;
        this.system = system;
        this.bestOverall = bestOverall;
        this.bestGeneral = bestGeneral;
        this.bestPainted = bestPainted;
        this.bestSport = bestSport;
        this.tournamentCost = tournamentCost;
        this.maxPlayers = maxPlayers;
        this.minPlayers = minPlayers;
        this.playersPerTeam = playersPerTeam;
        this.tournamentParticipants = tournamentParticipants;
    }

    public Tournament() {
	this.tournamentSeason = null;
        this.tournamentName = null;
        this.tournamentDate = null;
        this.tournamentOrganizer = null;
        this.tournamentID = 0;
        this.system = null;
        this.bestOverall = null;
        this.bestGeneral = null;
        this.bestPainted = null;
        this.bestSport = null;
        this.tournamentCost = 0;
        this.maxPlayers = 0;
        this.minPlayers = 0;
        this.tournamentParticipants = 0;
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

    public String getTournamentSeason() {
	return tournamentSeason;
    }
    
    public String getTournamentOrganizer() {
        return tournamentOrganizer;
    }
    
    public int getTournamentOrganizerID() {
        return tournamentID;
    }
    
    public int getTournamentCost() {
        return tournamentCost;
    }
    
    public int getMaxPlayers() {
        return maxPlayers;
    }

    public int getMinPlayers() {
        return minPlayers;
    }
    
    public int getTournamentParticipants() {
        return tournamentParticipants;
    }
    
    public int getPlayersPerTeam() {
        return playersPerTeam;
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

    public void setTournamentSeason(String tournamentSeason) {
	this.tournamentSeason = tournamentSeason;
    }

    public void setTournamentDate(String tournamentDate) {
        this.tournamentDate = tournamentDate;
    }

    public void setTournamentName(String tournamentName) {
        this.tournamentName = tournamentName;
    }
    
    public void setTournamentOrganizer(String tournamentOrganizer) {
        this.tournamentOrganizer = tournamentOrganizer;
    }
    
    public void setTournamentID(int tournamentID) {
        this.tournamentID = tournamentID;
    }

    public void setTournamentCost(int tournamentCost) {
        this.tournamentCost = tournamentCost;
    }
    
    public void setMaxPlayers(int maxPlayers) {
        this.maxPlayers = maxPlayers;
    }
    
    public void setMinPlayers(int minPlayers) {
        this.minPlayers = minPlayers;
    }
    
    public void setTournamentParticipants(int tournamentParticipants) {
        this.tournamentParticipants = tournamentParticipants;
    }
    
    public void setPlayersPerTeam(int playersPerTeam) {
        this.playersPerTeam = playersPerTeam;
    }
}
