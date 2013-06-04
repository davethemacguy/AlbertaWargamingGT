package user;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import business.User;
import data.UserDB;

public class UpdateSelfServlet extends HttpServlet
{
    protected void doGet(HttpServletRequest request, 
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