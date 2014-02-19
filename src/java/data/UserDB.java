package data;

import business.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDB {

    public static int add(User user) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query
                = "INSERT INTO UserData (userName, firstName, lastName, emailAddress, userRole, passWord, userDelete, creationTime, cardID, cardVerified, isPrivate, blackFlagged, fullName) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, user.getUserName());
            ps.setString(2, user.getFirstName());
            ps.setString(3, user.getLastName());
            ps.setString(4, user.getEmailAddress());
            ps.setString(5, user.getUserRole());
            ps.setString(6, user.getPassWord());
            ps.setString(7, user.getUserDelete());
            ps.setLong(8, user.getCreationTime());
            ps.setString(9, user.getCardID());
            ps.setString(10, user.getCardVerified());
            ps.setString(11, user.getIsPrivate());
            ps.setString(12, user.getBlackFlagged());
            ps.setString(13, user.getFullName());

            return ps.executeUpdate();

        } catch (SQLException e) {
            return 0;
        } finally {
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static int update(User user) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query = "UPDATE UserData SET "
                + "firstName = ?, "
                + "lastName = ?, "
                + "emailAddress = ?, "
                + "passWord = ?, "
                + "userName = ?, "
                + "userRole = ?, "
                + "userDelete = ?, "
                + "cardID = ?, "
                + "cardVerified = ?, "
                + "isPrivate = ?, "
                + "blackFlagged = ?, "
                + "flagReason = ? "
                + "WHERE userID = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, user.getFirstName());
            ps.setString(2, user.getLastName());
            ps.setString(3, user.getEmailAddress());
            ps.setString(4, user.getPassWord());
            ps.setString(5, user.getUserName());
            ps.setString(6, user.getUserRole());
            ps.setString(7, user.getUserDelete());
            ps.setString(8, user.getCardID());
            ps.setString(9, user.getCardVerified());
            ps.setString(10, user.getIsPrivate());
            ps.setString(11, user.getBlackFlagged());
            ps.setString(12, user.getFlagReason());
            ps.setString(13, user.getUserID());

            return ps.executeUpdate();
        } catch (SQLException e) {
            return 0;
        } finally {
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static int delete(User user) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query = "UPDATE UserData SET "
                + "firstName = ?, "
                + "lastName = ?, "
                + "emailAddress = ?, "
                + "passWordHash = ?, "
                + "passWordSalt = ?, "
                + "userRole = ?, "
                + "userDelete = ? "
                + "WHERE userID = ? ";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, user.getFirstName());
            ps.setString(2, user.getLastName());
            ps.setString(3, user.getEmailAddress());
            ps.setString(4, user.getPassWord());
            ps.setString(5, user.getUserRole());
            ps.setString(6, user.getUserDelete());
            ps.setString(7, user.getUserID());

            return ps.executeUpdate();
        } catch (SQLException e) {
            return 0;
        } finally {
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static boolean emailExists(String emailAddress) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

        String query = "SELECT emailAddress FROM UserData "
                + "WHERE emailAddress = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, emailAddress);
            rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            return false;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static User selectUser(String userID) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

        String query = "SELECT * FROM UserData "
                + "WHERE userID = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, userID);
            rs = ps.executeQuery();
            
            User user = null;
            if (rs.next()) {
                user = new User();
                user.setUserName(rs.getString("userName"));
                user.setFirstName(rs.getString("firstName"));
                user.setLastName(rs.getString("lastName"));
                user.setEmailAddress(rs.getString("emailAddress"));
                user.setUserID(rs.getString("userID"));
                user.setUserRole(rs.getString("userRole"));
                user.setPassWord(rs.getString("passWord"));
                user.setUserDelete(rs.getString("userDelete"));
                user.setCardID(rs.getString("cardID"));
                user.setCardVerified(rs.getString("cardVerified"));
                user.setIsPrivate(rs.getString("isPrivate"));
                user.setBlackFlagged(rs.getString("blackFlagged"));
                user.setFlagReason(rs.getString("flagReason"));
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

    public static User selectUserName(String userName) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

        String query = "SELECT * FROM UserData "
                + "WHERE userName = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, userName);
            rs = ps.executeQuery();
            User user = null;
            if (rs.next()) {
                user = new User();
                user.setUserName(rs.getString("userName"));
                user.setFirstName(rs.getString("firstName"));
                user.setLastName(rs.getString("lastName"));
                user.setEmailAddress(rs.getString("emailAddress"));
                user.setUserID(rs.getString("userID"));
                user.setUserRole(rs.getString("userRole"));
                user.setPassWord(rs.getString("passWord"));
                user.setUserDelete(rs.getString("userDelete"));
                user.setFullName(rs.getString("fullName"));
                user.setCreationTime(rs.getLong("creationTime"));
                user.setCardID(rs.getString("cardID"));
                user.setCardVerified(rs.getString("cardVerified"));
                user.setIsPrivate(rs.getString("isPrivate"));
                user.setBlackFlagged(rs.getString("blackFlagged"));
                user.setFlagReason(rs.getString("flagReason"));
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

    public static ArrayList<User> selectActiveUsers() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<User> users = new ArrayList<User>();

        String query = "SELECT * FROM UserData WHERE userDelete = 'n' ORDER BY firstName ASC";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            User user = null;

            while (rs.next()) {
                user = new User();
                user.setUserName(rs.getString("userName"));
                user.setFirstName(rs.getString("firstName"));
                user.setLastName(rs.getString("lastName"));
                user.setFullName(rs.getString("fullName"));
                user.setEmailAddress(rs.getString("emailAddress"));
                user.setUserID(rs.getString("userID"));
                user.setPassWord(rs.getString("passWord"));
                user.setUserRole(rs.getString("userRole"));
                user.setUserDelete(rs.getString("userDelete"));
                user.setCreationTime(rs.getLong("creationTime"));
                user.setCardID(rs.getString("cardID"));
                user.setCardVerified(rs.getString("cardVerified"));
                user.setIsPrivate(rs.getString("isPrivate"));
                user.setBlackFlagged(rs.getString("blackFlagged"));
                user.setFlagReason(rs.getString("flagReason"));

                users.add(user);
            }

            return users;

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }
    
    public static ArrayList<User> selectFlaggedUsers() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<User> users = new ArrayList<User>();

        String query = "SELECT * FROM UserData "
                + "WHERE blackFlagged = 'y' ORDER BY firstName ASC";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            User user = null;

            while (rs.next()) {
                user = new User();
                user.setUserName(rs.getString("userName"));
                user.setFirstName(rs.getString("firstName"));
                user.setLastName(rs.getString("lastName"));
                user.setEmailAddress(rs.getString("emailAddress"));
                user.setUserID(rs.getString("userID"));
                user.setPassWord(rs.getString("passWord"));
                user.setUserRole(rs.getString("userRole"));
                user.setUserDelete(rs.getString("userDelete"));
                user.setCreationTime(rs.getLong("creationTime"));
                user.setCardID(rs.getString("cardID"));
                user.setCardVerified(rs.getString("cardVerified"));
                user.setIsPrivate(rs.getString("isPrivate"));
                user.setBlackFlagged(rs.getString("blackFlagged"));
                user.setFlagReason(rs.getString("flagReason"));
                user.setFullName(rs.getString("fullName"));
                user.setFlagCount(rs.getInt("flagCount"));

                users.add(user);
            }

            return users;

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static ArrayList<User> selectDeletedUsers() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<User> users = new ArrayList<User>();

        String query = "SELECT * FROM UserData "
                + "WHERE userDelete = 'y'";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            User user = null;

            while (rs.next()) {
                user = new User();
                user.setUserName(rs.getString("userName"));
                user.setFirstName(rs.getString("firstName"));
                user.setLastName(rs.getString("lastName"));
                user.setEmailAddress(rs.getString("emailAddress"));
                user.setUserID(rs.getString("userID"));
                user.setPassWord(rs.getString("passWord"));
                user.setUserRole(rs.getString("userRole"));
                user.setUserDelete(rs.getString("userDelete"));

                users.add(user);
            }

            return users;

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }
    
    public static ArrayList<User> selectTournamentParticipants() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<User> users = new ArrayList<User>();

        String query = "SELECT DISTINCT fullName, cardID FROM UserData ORDER BY fullName ASC";

        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            User user = null;

            while (rs.next()) {
                user = new User();
                user.setFullName(rs.getString("fullName"));
                user.setCardID(rs.getString("cardID"));
                users.add(user);
            }

            return users;

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static List<String> selectFirstNames() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

        List<String> firstNames = new ArrayList<String>();

        String query = "SELECT DISTINCT firstName FROM UserData ORDER BY firstName ASC";

        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                firstNames.add(rs.getString("firstName"));
            }
            return firstNames;

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }

    }

    public static ArrayList<User> selectLastNames() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<User> lastNames = new ArrayList<User>();

        String query = "SELECT DISTINCT lastName FROM UserData ORDER BY lastName ASC";

        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            User user = null;

            while (rs.next()) {
                user = new User();
                user.setLastName(rs.getString("lastName"));

                lastNames.add(user);
            }

            return lastNames;

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }

    }
    
    public static ArrayList<User> selectFullNames() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<User> fullNames = new ArrayList<User>();

        String query = "SELECT DISTINCT fullName FROM UserData ORDER BY fullName ASC";

        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            User user = null;

            while (rs.next()) {
                user = new User();
                user.setFullName(rs.getString("fullName"));

                fullNames.add(user);
            }

            return fullNames;

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }

    }

    public static boolean noUsers() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean isempty = true;

        String query = "SELECT COUNT(*) FROM UserData";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                if (rs.getInt(1) != 0) {
                    isempty = false;
                }
            }
            return isempty;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static ArrayList<User> returnAdmin() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<User> users = new ArrayList<User>();

        String query = "SELECT * FROM UserData "
                + "WHERE userRole = 'admin'";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            User user = null;

            while (rs.next()) {
                user = new User();
                user.setFirstName(rs.getString("firstName"));
                user.setLastName(rs.getString("lastName"));
                user.setEmailAddress(rs.getString("emailAddress"));
                user.setUserID(rs.getString("userID"));
                users.add(user);
            }
            return users;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static int getUserID(String userName) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        int userID = 0;

        String query = "SELECT userID FROM UserData "
                + "WHERE userName = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, userName);
            rs = ps.executeQuery();
            if (rs.next()) {
                userID = rs.getInt("userID");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
        return userID;

    }

    public static String getFullName(String currentUser) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

        String query = "SELECT firstName, lastName FROM UserData WHERE userName='" + currentUser + "'";

        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();

            if (rs.next()) {
                currentUser = rs.getString("firstName") + " " + rs.getString("lastName");
            }

            return currentUser;

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static User selectUserByEmail(String email) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

        String query = "SELECT * FROM UserData "
                + "WHERE emailAddress = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, email);
            rs = ps.executeQuery();
            User user = null;
            if (rs.next()) {
                user = new User();
                user.setUserName(rs.getString("userName"));
                user.setFirstName(rs.getString("firstName"));
                user.setLastName(rs.getString("lastName"));
                user.setEmailAddress(rs.getString("emailAddress"));
                user.setUserID(rs.getString("userID"));
                user.setUserRole(rs.getString("userRole"));
                user.setPassWord(rs.getString("passWord"));
                user.setUserDelete(rs.getString("userDelete"));
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
