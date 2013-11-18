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
        
        HttpSession session = request.getSession();
        
        String userName = request.getRemoteUser();
        int userID = UserDB.getUserID(userName);
        String fullName = UserDB.getFullName(userName);
        
        ArrayList<SystemResults> userResults = TournamentResultsDB.selectIndividualTournamentResults(fullName);
        
        
        
        session.setAttribute("user", userName);
        session.setAttribute("userID", userID);
        session.setAttribute("fullName", fullName);
        session.setAttribute("results", userResults);
        
        
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