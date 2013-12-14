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