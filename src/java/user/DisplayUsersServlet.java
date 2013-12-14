package user;

import business.User;
import data.UserDB;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class DisplayUsersServlet extends HttpServlet
{

    @Override
    protected void doPost(HttpServletRequest request, 
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
    
    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) 
            throws ServletException, IOException
    {
        doPost(request, response);
    }    
}