/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

import business.Systems;
import business.Tournament;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
/*import java.util.Calendar;*/

/**
 *
 * @author Stephen
 */
public class TournamentDB {

    public static int add(Tournament tournament) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

       
        
        String query = "INSERT INTO linds14sr20det.Tournaments (tournamentSeason, tournamentName, tournamentDate, system, bestOverall, bestGeneral, bestPainted, bestSport) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";


        try {
            ps = connection.prepareStatement(query);

            ps.setString(1, tournament.getTournamentSeason());
            ps.setString(2, tournament.getTournamentName());
            ps.setString(3, tournament.getTournamentDate());
            ps.setString(4, tournament.getSystem());
            ps.setString(5, tournament.getBestOverall());
            ps.setString(6, tournament.getBestGeneral());
            ps.setString(7, tournament.getBestPainted());
            ps.setString(8, tournament.getBestSport());
            return ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        } finally {
            DBUtil.closePreparedStatement(ps);

            pool.freeConnection(connection);
        }
    }
    
    public static int newTournament(Tournament tournament) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

       
        
        String query = "INSERT INTO linds14sr20det.Tournaments (tournamentSeason, tournamentName, tournamentOrganizer, tournamentDate, system, tournamentCost, maxPlayers, minPlayers, playersPerTeam) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";


        try {
            ps = connection.prepareStatement(query);

            ps.setString(1, tournament.getTournamentSeason());
            ps.setString(2, tournament.getTournamentName());
            ps.setString(3, tournament.getTournamentOrganizer());
            ps.setString(4, tournament.getTournamentDate());
            ps.setString(5, tournament.getSystem());
            ps.setInt(6, tournament.getTournamentCost());
            ps.setInt(7, tournament.getMaxPlayers());
            ps.setInt(8, tournament.getMinPlayers());
            ps.setInt(9, tournament.getPlayersPerTeam());
            return ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        } finally {
            DBUtil.closePreparedStatement(ps);

            pool.freeConnection(connection);
        }
    }
    
    public static int addGT(Tournament tournament) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

       
        
        String query = "INSERT INTO linds14sr20det.GTTournaments (tournamentSeason, tournamentName, tournamentDate, system, bestOverall, bestGeneral, bestPainted, bestSport) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";


        try {
            ps = connection.prepareStatement(query);

            ps.setString(1, tournament.getTournamentSeason());
            ps.setString(2, tournament.getTournamentName());
            ps.setString(3, tournament.getTournamentDate());
            ps.setString(4, tournament.getSystem());
            ps.setString(5, tournament.getBestOverall());
            ps.setString(6, tournament.getBestGeneral());
            ps.setString(7, tournament.getBestPainted());
            ps.setString(8, tournament.getBestSport());
            return ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        } finally {
            DBUtil.closePreparedStatement(ps);

            pool.freeConnection(connection);
        }
    }
    
    public static int update(Tournament tournament) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        
        String query = "UPDATE Tournaments SET "
                + "tournamentDate = ?, "
                + "tournamentName = ?, "
                + "system = ?, "
                + "bestGeneral = ?, "
                + "bestOverall = ?, "
                + "bestPainted = ?, "
                + "bestSport = ?, "
                + "tournamentCost = ?, "
                + "maxPlayers = ?, "
                + "minPlayers = ?, "
                + "playersPerTeam = ?, "
                + "tournamentParticipants = ? "
                + "WHERE tournamentName = ?";
        
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, tournament.getTournamentDate());
            ps.setString(2, tournament.getTournamentName());
            ps.setString(3, tournament.getSystem());
            ps.setString(4, tournament.getBestGeneral());
            ps.setString(5, tournament.getBestOverall());
            ps.setString(6, tournament.getBestPainted());
            ps.setString(7, tournament.getBestSport());
            ps.setInt(8, tournament.getTournamentCost());
            ps.setInt(9, tournament.getMaxPlayers());
            ps.setInt(10, tournament.getMinPlayers());
            ps.setInt(11, tournament.getPlayersPerTeam());
            ps.setInt(12, tournament.getTournamentParticipants());
            ps.setString(13, tournament.getTournamentName());
            return ps.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        } finally {
            DBUtil.closePreparedStatement(ps);

            pool.freeConnection(connection);
        }
    }
    
    public static ArrayList<Tournament> getTournaments() {
        
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Tournament> tournamentList = new ArrayList<Tournament>();
        Tournament tournament = null;
        
        String query = "SELECT DISTINCT tournamentName FROM Tournaments";
        
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            
            
            while (rs.next()) {
                tournament = new Tournament();
                tournament.setTournamentName(rs.getString("tournamentName"));
              
                
                tournamentList.add(tournament);
            }
            return tournamentList;
            
            } catch (SQLException e) {
            return null;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }
    
    public static ArrayList<Tournament> getAllTournaments() {
        
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Tournament> allTournaments = new ArrayList<Tournament>();
        Tournament tournament = null;
        
        String query = "SELECT tournamentDate, tournamentName FROM Tournaments ORDER BY tournamentDate DESC";
        
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            
            
            while (rs.next()) {
                tournament = new Tournament();
                tournament.setTournamentName(rs.getString("tournamentName"));
                tournament.setTournamentDate(rs.getString("tournamentDate"));
              
                
                allTournaments.add(tournament);
            }
            return allTournaments;
            
            } catch (SQLException e) {
            return null;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }
    
    public static ArrayList<Tournament> getIndividualTournament(String tournamentName, String tournamentDate) {
        
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Tournament> allTournaments = new ArrayList<Tournament>();
        Tournament tournament = null;
        
        String query = "SELECT * FROM Tournaments WHERE tournamentName = '"+tournamentName+"' AND tournamentDate = '"+tournamentDate+"' ORDER BY tournamentDate DESC";
        
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            
            
            while (rs.next()) {
                tournament = new Tournament();
                tournament.setTournamentName(rs.getString("tournamentName"));
                tournament.setTournamentDate(rs.getString("tournamentDate"));
                tournament.setSystem(rs.getString("system"));
                tournament.setBestGeneral(rs.getString("bestGeneral"));
                tournament.setBestOverall(rs.getString("bestOverall"));
                tournament.setBestPainted(rs.getString("bestPainted"));
                tournament.setBestSport(rs.getString("bestSport"));
                tournament.setTournamentCost(rs.getInt("tournamentCost"));
                tournament.setMaxPlayers(rs.getInt("maxPlayers"));
                tournament.setMinPlayers(rs.getInt("minPlayers"));
                tournament.setTournamentParticipants(rs.getInt("tournamentParticipants"));
                
              
                
                allTournaments.add(tournament);
            }
            return allTournaments;
            
            } catch (SQLException e) {
            return null;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static ArrayList<Tournament> getMyTournaments(String userName) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Tournament> myTournaments = new ArrayList<Tournament>();
        Tournament tournament = null;
        
        String query = "SELECT * FROM Tournaments WHERE tournamentOrganizer = '"+userName+"' ORDER BY tournamentDate DESC";
        
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            
            
            while (rs.next()) {
                tournament = new Tournament();
                tournament.setTournamentName(rs.getString("tournamentName"));
                tournament.setTournamentDate(rs.getString("tournamentDate"));
                myTournaments.add(tournament);
            }
            return myTournaments;
            
            } catch (SQLException e) {
            return null;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }

        
    }
    
    public static ArrayList<Systems> getSystems() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Systems> Systems = new ArrayList<Systems>();
        Systems system = null;
        
        String query = "SELECT DISTINCT tournamentName FROM Tournaments";
        
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            
            
            while (rs.next()) {
                system = new Systems();
                system.setSystemName(rs.getString("systemName"));
              
                
                Systems.add(system);
            }
            return Systems;
            
            } catch (SQLException e) {
            return null;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }

        
    }
}
