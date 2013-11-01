package user;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import business.User;
import data.UserDB;

public class DeleteUserServlet extends HttpServlet
{

    protected void doGet(HttpServletRequest request, 
            HttpServletResponse response) 
            throws ServletException, IOException
    {
        String userID = request.getParameter("userID");
        User user = UserDB.selectUser(userID);
        user.setUserRole("deleted");
        user.setUserDelete("y");
        
        UserDB.delete(user);
        
        
        String url = "/login/admin/displayUsers";
        RequestDispatcher dispatcher =
              getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
}