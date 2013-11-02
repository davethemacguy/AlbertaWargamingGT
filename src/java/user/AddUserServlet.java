package user;


import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import business.User;
import data.UserDB;


public class AddUserServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        String userName = request.getParameter("userName");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String emailAddress = request.getParameter("emailAddress");
        String passWord = request.getParameter("passWord");
        String userRole = request.getParameter("userRole");
        String userDelete = request.getParameter("userDelete");
     

                
        User user = new User();

        user.setUserName(userName);
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setEmailAddress(emailAddress);
        user.setUserRole(userRole);
        user.setPassWord(passWord);
        user.setUserDelete(userDelete);

        int i = UserDB.add(user);

        String url = "/index.jsp";
        if (i == 0) {
            url = "/requestAWGAccessFailed.jsp";
        }
        RequestDispatcher dispatcher =
                getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
}