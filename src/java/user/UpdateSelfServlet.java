package user;

import business.User;
import data.UserDB;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UpdateSelfServlet extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest request, 
            HttpServletResponse response) 
            throws ServletException, IOException
    {
        String userName = request.getRemoteUser();
        User user = UserDB.selectUserName(userName);

        HttpSession session = request.getSession();
        session.setAttribute("user", user);

        String url = "/login/updateSelf.jsp";
        RequestDispatcher dispatcher =
              getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }

}