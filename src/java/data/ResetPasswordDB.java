package data;

import business.ResetPassword;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ResetPasswordDB {

    public static int add(ResetPassword user) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query =
                "INSERT INTO ResetPassword (id, time, username, resetable) "
                + "VALUES (?, ?, ?, ?)";


        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, user.getID());
            ps.setLong(2, user.getTime());
            ps.setString(3, user.getUserName());
            ps.setString(4, user.getResetable());
           
            
            return ps.executeUpdate();

        } catch (SQLException e) {
            return 0;
        } finally {
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static ResetPassword selectReset(String userID) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

        String query = "SELECT * FROM ResetPassword "
                + "WHERE id = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, userID);
            rs = ps.executeQuery();
            ResetPassword user = null;
            if (rs.next()) {
                user = new ResetPassword();
                user.setUserName(rs.getString("userName"));
                user.setID(rs.getString("id"));
                user.setTime(rs.getLong("time"));
                user.setResetable(rs.getString("resetable"));
            }
            return user;
        } catch (SQLException e) {
            return null;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }
    
    public static int allowReset(ResetPassword user) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query = "UPDATE ResetPassword SET resetable=true WHERE id=?";


        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, user.getID());           
            
            return ps.executeUpdate();

        } catch (SQLException e) {
            return 0;
        } finally {
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static ResetPassword selectByUserName(String userName) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

        String query = "SELECT * FROM ResetPassword "
                + "WHERE username = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, userName);
            rs = ps.executeQuery();
            ResetPassword user = null;
            if (rs.next()) {
                user = new ResetPassword();
                user.setUserName(rs.getString("userName"));
                user.setID(rs.getString("id"));
                user.setTime(rs.getLong("time"));
                user.setResetable(rs.getString("resetable"));
            }
            return user;
        } catch (SQLException e) {
            return null;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }
}
    
    
    
    
    
    
    
    
    
