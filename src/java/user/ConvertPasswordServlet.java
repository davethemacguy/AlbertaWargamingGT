package user;

import business.Encryption;
import business.User;
import data.UserDB;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ConvertPasswordServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        
        ArrayList<User> arrayOfUsers = UserDB.selectActiveUsers();
        for (Iterator<User> i = arrayOfUsers.iterator(); i.hasNext();) {
            User user = i.next();
            if (user.getUserName().equals(request.getRemoteUser())) {
                user = i.next();
            }
            String passWord = user.getPassWord();
            System.out.println(passWord);
            Encryption crypto = new Encryption();

            try {
                crypto.setPassWordHash(1000, passWord, user.getCreationTime());
            } catch (NoSuchAlgorithmException ex) {
                Logger.getLogger(AddUserServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            user.setPassWord(crypto.getPassWordHash());
            System.out.println(crypto.getPassWordHash());
            UserDB.update(user);
        }
        request.setAttribute("Users", arrayOfUsers);

        String url = "/login/admin/convertPasswords.jsp";
        RequestDispatcher dispatcher =
                getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}