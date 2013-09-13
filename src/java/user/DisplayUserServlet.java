package user;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import business.User;
import data.UserDB;

public class DisplayUserServlet extends HttpServlet
{
    protected void doGet(HttpServletRequest request, 
            HttpServletResponse response) 
            throws ServletException, IOException
    {
        String userID = request.getParameter("userID");
        User user = UserDB.selectUser(userID);
        
        HttpSession session = request.getSession();
        session.setAttribute("user", user);
        
        String url = "/login/admin/user.jsp";
        RequestDispatcher dispatcher =
              getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }

}