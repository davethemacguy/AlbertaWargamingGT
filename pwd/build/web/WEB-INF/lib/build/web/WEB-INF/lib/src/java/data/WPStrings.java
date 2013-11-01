package data;

import java.sql.*;

public class WPStrings {

    public static int update(String stringID, String text) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query = "UPDATE webPageStrings SET "
                + "text = ? "
                + "WHERE stringId = ? ";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, text);
            ps.setString(2, stringID);



            return ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        } finally {
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static String selectString(String stringID) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

        String query = "SELECT * FROM webPageStrings "
                + "WHERE stringId = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, stringID);
            rs = ps.executeQuery();
            String text = null;

            if (rs.next()) {
                text = rs.getString("text");
            }
            return text;
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