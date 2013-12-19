/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package user;

import business.SystemResults;
import business.TournamentResults;
import business.User;
import data.TournamentResultsDB;
import data.UserDB;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author localadmin
 */
public class PopulateIndividualResults extends HttpServlet {
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

            String playerName = request.getParameter("playerName");
            String remoteUser = request.getRemoteUser();
            
            String fullName =UserDB.getFullName(remoteUser);
            ArrayList<TournamentResults> arrayOfUserTournamentResults = TournamentResultsDB.selectIndividualTournamentResults(playerName);
            ArrayList<User> activeUsers = UserDB.selectTournamentParticipants();
            
            HttpSession session = request.getSession();
            session.setAttribute("results", arrayOfUserTournamentResults);
            session.setAttribute("activeUsers", activeUsers);
            session.setAttribute("playerName", playerName);
            session.setAttribute("remoteUser", remoteUser);
            session.setAttribute("fullName", fullName);
            
            String url = "/login/individualResults.jsp";
            
            
            
            RequestDispatcher dispatcher =
                getServletContext().getRequestDispatcher(url);
            dispatcher.forward(request, response);
            }
    
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}