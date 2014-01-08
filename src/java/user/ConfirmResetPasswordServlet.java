package user;

import business.Encryption;
import business.User;
import data.ResetPasswordDB;
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

public class ConfirmResetPasswordServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException, UnsupportedEncodingException {

        String url = "/resetPasswordFailed.jsp";
        String password = request.getParameter("newPass");
        if(UserDB.selectUserName(request.getParameter("username")) != null)
        {
            User user = UserDB.selectUserName(request.getParameter("username"));
            Encryption crypto = new Encryption();

            try {
                crypto.setPassWordHash(1000, password, user.getCreationTime());
            } catch (NoSuchAlgorithmException ex) {
                Logger.getLogger(AddUserServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            user.setPassWord(crypto.getPassWordHash());
            if ("1".equals(ResetPasswordDB.selectByUserName(user.getUserName()).getResetable())) {
                UserDB.update(user);
                url = "/resetSuccess.jsp";
            }
        }

        RequestDispatcher dispatcher
                = getServletContext().getRequestDispatcher(url);

        dispatcher.forward(request, response);
    }
}
