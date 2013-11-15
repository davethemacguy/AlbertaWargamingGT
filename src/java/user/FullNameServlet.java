package user;

import business.SystemResults;
import business.TournamentResults;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import java.util.ArrayList;
import business.User;
import data.TournamentResultsDB;
import data.UserDB;

public class FullNameServlet extends HttpServlet
{

    protected void doGet(HttpServletRequest request, 
            HttpServletResponse response) 
            throws ServletException, IOException
    {
        String userName = request.getRemoteUser();
        String currentUser = userName;
        User userInfo = UserDB.selectUserName(userName);
        
        
        /* String playerName = UserDB.getFullName(currentUser); */
        String playerName ="David Rowland";
        
        ArrayList<SystemResults> userResults = TournamentResultsDB.selectIndividualTournamentResults(playerName);
        
        HttpSession session = request.getSession();
       
        session.setAttribute("currentUser", currentUser);
        session.setAttribute("userName", userName);
        session.setAttribute("user", userInfo);
        session.setAttribute("playerName", playerName);
        session.setAttribute("results", userResults);
        
        /* session.setAttribute("results", userResults); */
        
        
        String url = "/login/fullName.jsp";
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