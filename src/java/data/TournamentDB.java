/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

import business.Tournament;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Stephen
 */
public class TournamentDB {

    public static int add(Tournament tournament) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query = "INSERT INTO linds14sr20det.Tournaments (tournamentName, tournamentDate, system, bestOverall, bestGeneral, bestPainted, bestSport) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";


        try {
            ps = connection.prepareStatement(query);

            ps.setString(1, tournament.getTournamentName());
            ps.setString(2, tournament.getTournamentDate());
            ps.setString(3, tournament.getSystem());
            ps.setString(4, tournament.getBestOverall());
            ps.setString(5, tournament.getBestGeneral());
            ps.setString(6, tournament.getBestPainted());
            ps.setString(7, tournament.getBestSport());
            return ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        } finally {
            DBUtil.closePreparedStatement(ps);

            pool.freeConnection(connection);
        }
    }
}
