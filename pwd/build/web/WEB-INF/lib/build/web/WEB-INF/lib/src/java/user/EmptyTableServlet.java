package user;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import business.User;

public class EmptyTableServlet extends HttpServlet
{
    protected void doGet(HttpServletRequest request, 
            HttpServletResponse response) 
            throws ServletException, IOException
    {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String emailAddress = request.getParameter("emailAddress");
        String userName = request.getParameter("userName");
        String passWord = request.getParameter("passWord");
        
        HttpSession session = request.getSession();
        
        // TODO: add code that gets the User object from the session and updates the database
        User user = (User) session.getAttribute("user");
        
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setEmailAddress(emailAddress);
        user.setUserName(userName);
        user.setPassWord(passWord);
        
        String url = "/user.jsp";
        RequestDispatcher dispatcher =
              getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }

}