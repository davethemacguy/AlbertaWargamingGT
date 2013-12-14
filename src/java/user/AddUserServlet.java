package user;

import business.Encryption;
import business.User;
import data.UserDB;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddUserServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException, UnsupportedEncodingException {
        
        Encryption crypto = new Encryption();
        
        User user = new User();
        String userName = request.getParameter("userName");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String emailAddress = request.getParameter("emailAddress");
        String passWord = request.getParameter("passWord");
        String userRole = request.getParameter("userRole");
        String userDelete = request.getParameter("userDelete");
        long epoch = System.currentTimeMillis()/1000;
        
        try {
            crypto.setPassWordHash(1000, passWord, epoch);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(AddUserServlet.class.getName()).log(Level.SEVERE, null, ex);
        }   

        user.setUserName(userName);
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setEmailAddress(emailAddress);
        user.setUserRole(userRole);
        user.setPassWord(crypto.getPassWordHash());
        user.setUserDelete(userDelete);
        user.setCreationTime(epoch);

        int i = UserDB.add(user);

        String url = "/index.jsp";
        if (i == 0) {
            url = "/requestAWGAccessFailed.jsp";
        }
        RequestDispatcher dispatcher =
                getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
}