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

public class UpdateUserServlet extends HttpServlet
{

    @Override
    protected void doPost(HttpServletRequest request, 
            HttpServletResponse response) 
            throws ServletException, IOException
    {
        String userName = request.getParameter("userName");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String emailAddress = request.getParameter("emailAddress");
        String passWord = request.getParameter("passWord");
        String userID = request.getParameter("userID");
        String userRole = request.getParameter("userRole");
        String userDelete = request.getParameter("userDelete");
        String url = "/login/indexProtected.jsp";

        HttpSession session = request.getSession();
        
        User user = (User) session.getAttribute("user");
        user.setUserName(userName);
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setEmailAddress(emailAddress);
        user.setPassWord(passWord);
        user.setUserID(userID);
        user.setUserRole(userRole);
        user.setCreationTime(user.getCreationTime());
        user.setUserDelete(userDelete);
      
        UserDB.update(user);     
        
        
        RequestDispatcher dispatcher =
              getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
        
    }
}