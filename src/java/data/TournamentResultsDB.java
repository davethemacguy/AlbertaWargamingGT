/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

import business.Army;
import business.SystemResults;
import business.Tournament;
import business.TournamentResults;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Stephen
 */
public class TournamentResultsDB {

    public static int add(TournamentResults tournament) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query = "INSERT INTO TournamentResults (fk_tournamentName, fk_tournamentDate, playerName, score, army, fk_system, optOut) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";


        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, tournament.getTournamentName());
            ps.setString(2, tournament.getTournamentDate());
            ps.setString(3, tournament.getPlayerName());
            ps.setString(4, tournament.getScore());
            ps.setString(5, tournament.getArmy());
            ps.setString(6, tournament.getSystem());
            ps.setString(7, tournament.getOptOut());
            return ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        } finally {
            DBUtil.closePreparedStatement(ps);

            pool.freeConnection(connection);
        }
    }

    public static ArrayList<SystemResults> select40K() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<SystemResults> results = new ArrayList<SystemResults>();

        String query = "SELECT playerName, finalScore, IF(invite>0, 'yes', 'no') AS invite, IF(optOut=0, 'yes', 'no') AS optOut FROM (SELECT playerName, SUM(optOut) AS optOut, SUM(scoreFinal+overAll) AS finalScore, SUM(overAll) AS invite FROM (SELECT *, IF(test.playerName=Tournaments.bestOverall, 10, 0) AS overAll, IF(test.playerName=Tournaments.bestSport OR test.playerName=Tournaments.bestPainted OR test.playerName=Tournaments.bestGeneral, test.score+5, test.score) AS scoreFinal FROM Tournaments INNER JOIN (SELECT * FROM TournamentResults WHERE fk_system = '40K') AS test ON test.fk_system = Tournaments.system AND test.fk_tournamentName=Tournaments.tournamentName AND test.fk_tournamentDate=Tournaments.tournamentDate) AS test1 GROUP BY playerName) AS finalTable ORDER BY invite DESC, finalScore DESC;";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            SystemResults user = null;

            while (rs.next()) {

                user = new SystemResults();
                user.setPlayerName(rs.getString("playerName"));
                user.setScore(rs.getString("finalScore"));
                user.setInvite(rs.getString("invite"));
                user.setOptOut(rs.getString("optOut"));
                results.add(user);
            }

            return results;

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static ArrayList<SystemResults> selectFantasy() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<SystemResults> results = new ArrayList<SystemResults>();

        String query = "SELECT playerName, finalScore, IF(invite>0, 'yes', 'no') AS invite, IF(optOut=0, 'yes', 'no') AS optOut FROM (SELECT playerName, SUM(optOut) AS optOut, SUM(scoreFinal+overAll) AS finalScore, SUM(overAll) AS invite FROM (SELECT *, IF(test.playerName=Tournaments.bestOverall, 10, 0) AS overAll, IF(test.playerName=Tournaments.bestSport OR test.playerName=Tournaments.bestPainted OR test.playerName=Tournaments.bestGeneral, test.score+5, test.score) AS scoreFinal FROM Tournaments INNER JOIN (SELECT * FROM TournamentResults WHERE fk_system = 'Fantasy') AS test ON test.fk_system =Tournaments.system AND test.fk_tournamentName=Tournaments.tournamentName AND test.fk_tournamentDate=Tournaments.tournamentDate) AS test1 GROUP BY playerName) AS finalTable ORDER BY invite DESC, finalScore DESC;";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            SystemResults user = null;

            while (rs.next()) {

                user = new SystemResults();
                user.setPlayerName(rs.getString("playerName"));
                user.setScore(rs.getString("finalScore"));
                user.setInvite(rs.getString("invite"));
                user.setOptOut(rs.getString("optOut"));
                results.add(user);
            }

            return results;

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static ArrayList<SystemResults> selectWarmaHordes() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<SystemResults> results = new ArrayList<SystemResults>();

        String query = "SELECT playerName, finalScore, IF(invite>0, 'yes', 'no') AS invite, IF(optOut=0, 'yes', 'no') AS optOut FROM (SELECT playerName, SUM(optOut) AS optOut, SUM(scoreFinal+overAll) AS finalScore, SUM(overAll) AS invite FROM (SELECT *, IF(test.playerName=Tournaments.bestOverall, 10, 0) AS overAll, IF(test.playerName=Tournaments.bestSport OR test.playerName=Tournaments.bestPainted OR test.playerName=Tournaments.bestGeneral, test.score+5, test.score) AS scoreFinal FROM Tournaments INNER JOIN (SELECT * FROM TournamentResults WHERE fk_system = 'WarmaHordes') AS test ON test.fk_system =Tournaments.system AND test.fk_tournamentName=Tournaments.tournamentName AND test.fk_tournamentDate=Tournaments.tournamentDate) AS test1 GROUP BY playerName) AS finalTable ORDER BY invite DESC, finalScore DESC;";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            SystemResults user = null;

            while (rs.next()) {

                user = new SystemResults();
                user.setPlayerName(rs.getString("playerName"));
                user.setScore(rs.getString("finalScore"));
                user.setInvite(rs.getString("invite"));
                user.setOptOut(rs.getString("optOut"));
                results.add(user);
            }

            return results;

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static ArrayList<SystemResults> selectTournamentResults(String tournament) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<SystemResults> results = new ArrayList<SystemResults>();
        String query = "SELECT playerName, army, optOut, CASE WHEN Tournaments.bestOverall = TournamentResults.playerName THEN 'Best Overall' WHEN Tournaments.bestPainted = TournamentResults.playerName THEN 'Best Painted' WHEN Tournaments.bestGeneral = TournamentResults.playerName THEN 'Best General' WHEN Tournaments.bestSport = TournamentResults.playerName THEN 'Best Sport' ElSE '' END AS awards, score FROM TournamentResults INNER JOIN (SELECT * FROM Tournaments WHERE "
                + tournament
                + ") AS Tournaments ON TournamentResults.fk_tournamentName = Tournaments.tournamentName AND TournamentResults.fk_tournamentDate = Tournaments.tournamentDate AND TournamentResults.fk_system = Tournaments.system ORDER BY score DESC";
        System.out.println(query);
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            SystemResults user = null;

            while (rs.next()) {

                user = new SystemResults();
                user.setPlayerName(rs.getString("playerName"));
                user.setScore(rs.getString("score"));
                user.setArmy(rs.getString("army"));
                user.setOptOut(rs.getString("optOut"));
                user.setAwards(rs.getString("awards"));
                results.add(user);
            }

            return results;

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static ArrayList<Tournament> selectTournaments() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Tournament> tournaments = new ArrayList<Tournament>();

        String query = "SELECT * from Tournaments";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {

                Tournament event = new Tournament();
                event.setTournamentName(rs.getString("tournamentName"));
                event.setSystem(rs.getString("system"));
                event.setTournamentDate(rs.getString("tournamentDate"));
                tournaments.add(event);
            }

            return tournaments;

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static String selectTournamentInfo(String tournament) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String tournamentInfo = null;

        String query = "SELECT * from Tournaments WHERE " + tournament;
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                tournamentInfo = rs.getString("tournamentName") + ", " + rs.getString("system") + ", " + rs.getString("tournamentDate");
            }

            return tournamentInfo;

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static ArrayList<Army> selectArmyPerformance40K() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Army> results = new ArrayList<Army>();

        String query = "SELECT army, SUM(score)AS score FROM TournamentResults WHERE fk_system='40K' GROUP BY army ORDER BY score DESC";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                Army army = new Army();
                army.setArmyName(rs.getString("army"));
                army.setScore(rs.getString("score"));
                results.add(army);
            }

            return results;

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static ArrayList<Army> selectArmyAveragePerformance40K() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Army> results = new ArrayList<Army>();

        String query = "SELECT army, AVG(score)AS score FROM TournamentResults WHERE fk_system='40K' GROUP BY army ORDER BY score DESC";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                Army army = new Army();
                army.setArmyName(rs.getString("army"));
                army.setScore(rs.getString("score"));
                results.add(army);
            }

            return results;

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static ArrayList<Army> selectArmyPopularity40K() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Army> results = new ArrayList<Army>();

        String query = "SELECT army, COUNT(*)AS score FROM TournamentResults WHERE fk_system='40K' GROUP BY army ORDER BY score DESC";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                Army army = new Army();
                army.setArmyName(rs.getString("army"));
                army.setScore(rs.getString("score"));
                results.add(army);
            }

            return results;

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }
    
    
    public static ArrayList<Army> selectArmyPerformanceFantasy() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Army> results = new ArrayList<Army>();

        String query = "SELECT army, SUM(score)AS score FROM TournamentResults WHERE fk_system='Fantasy' GROUP BY army ORDER BY score DESC";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                Army army = new Army();
                army.setArmyName(rs.getString("army"));
                army.setScore(rs.getString("score"));
                results.add(army);
            }

            return results;

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static ArrayList<Army> selectArmyAveragePerformanceFantasy() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Army> results = new ArrayList<Army>();

        String query = "SELECT army, AVG(score)AS score FROM TournamentResults WHERE fk_system='Fantasy' GROUP BY army ORDER BY score DESC";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                Army army = new Army();
                army.setArmyName(rs.getString("army"));
                army.setScore(rs.getString("score"));
                results.add(army);
            }

            return results;

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static ArrayList<Army> selectArmyPopularityFantasy() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Army> results = new ArrayList<Army>();

        String query = "SELECT army, COUNT(*)AS score FROM TournamentResults WHERE fk_system='Fantasy' GROUP BY army ORDER BY score DESC";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                Army army = new Army();
                army.setArmyName(rs.getString("army"));
                army.setScore(rs.getString("score"));
                results.add(army);
            }

            return results;

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }
    
    
    public static ArrayList<Army> selectArmyPerformanceWarmaHordes() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Army> results = new ArrayList<Army>();

        String query = "SELECT army, SUM(score)AS score FROM TournamentResults WHERE fk_system='WarmaHordes' GROUP BY army ORDER BY score DESC";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                Army army = new Army();
                army.setArmyName(rs.getString("army"));
                army.setScore(rs.getString("score"));
                results.add(army);
            }

            return results;

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static ArrayList<Army> selectArmyAveragePerformanceWarmaHordes() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Army> results = new ArrayList<Army>();

        String query = "SELECT army, AVG(score)AS score FROM TournamentResults WHERE fk_system='WarmaHordes' GROUP BY army ORDER BY score DESC";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                Army army = new Army();
                army.setArmyName(rs.getString("army"));
                army.setScore(rs.getString("score"));
                results.add(army);
            }

            return results;

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static ArrayList<Army> selectArmyPopularityWarmaHordes() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Army> results = new ArrayList<Army>();

        String query = "SELECT army, COUNT(*)AS score FROM TournamentResults WHERE fk_system='WarmaHordes' GROUP BY army ORDER BY score DESC";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                Army army = new Army();
                army.setArmyName(rs.getString("army"));
                army.setScore(rs.getString("score"));
                results.add(army);
            }

            return results;

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }
}