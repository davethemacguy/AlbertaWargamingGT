package user;

import business.Encryption;
import data.UserDB;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginRedirectServlet extends HttpServlet {

    protected static String mAuthURL = "/j_security_check";

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException, UnsupportedEncodingException {

        Encryption crypto = new Encryption();

        String userName = request.getParameter("j_username");
        String passWord = request.getParameter("j_password");
        try {
            System.out.println(UserDB.selectUserName(userName));
            System.out.println(passWord);
            crypto.setPassWordHash(1000, passWord, UserDB.selectUserName(userName).getCreationTime());
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(AddUserServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        String contextUrl = request.getContextPath();
        String req = contextUrl + mAuthURL
                + "?j_username=" + userName
                + "&j_password=" + crypto.getPassWordHash();
        response.sendRedirect(response.encodeRedirectURL(req));
    }
}