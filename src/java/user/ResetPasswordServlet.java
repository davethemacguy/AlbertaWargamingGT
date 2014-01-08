package user;

import business.Encryption;
import business.ResetPassword;
import data.ResetPasswordDB;
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
import javax.servlet.http.HttpSession;

public class ResetPasswordServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException, UnsupportedEncodingException {

        String token = request.getParameter("ID");
        long t = Long.parseLong(request.getParameter("t"));
        HttpSession session = request.getSession();
        session.setAttribute("username", request.getParameter("u"));
        Encryption crypto = new Encryption();
        try {
            crypto.setPassWordHash(1000, token, t);
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(ResetPasswordServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        String url = "";
        ResetPassword rp = ResetPasswordDB.selectReset(crypto.getPassWordHash());

        if ("".equals(rp.getID()) || System.currentTimeMillis() - rp.getTime() > 600000) {
            url = "/resetPasswordFailed.jsp";
        } else {
            url = "/resetPassword.jsp";
            rp.setResetable("true");
            ResetPasswordDB.allowReset(rp);
        }
               
        RequestDispatcher dispatcher
                = getServletContext().getRequestDispatcher(url);

        dispatcher.forward(request, response);
    }
}
