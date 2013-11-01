package user;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import java.util.ArrayList;
import business.User;
import data.UserDB;

public class DisplayUsersServlet extends HttpServlet
{

    protected void doGet(HttpServletRequest request, 
            HttpServletResponse response) 
            throws ServletException, IOException
    {
        ArrayList<User> arrayOfUsers = UserDB.selectActiveUsers();
        
        HttpSession session = request.getSession();
        session.setAttribute("users", arrayOfUsers);
        
        String url = "/login/admin/users.jsp";
        RequestDispatcher dispatcher =
              getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
    
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) 
            throws ServletException, IOException
    {
        doGet(request, response);
    }    
}