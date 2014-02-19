/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package user;

import business.Systems;
import business.Tournament;
import business.User;
import data.TournamentDB;
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
public class PopulateCreateTournamentServlet 
    extends HttpServlet {

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        
            ArrayList<User> arrayOfUsers = UserDB.selectTournamentParticipants();
            ArrayList<Tournament> tournamentList = TournamentDB.getTournaments();
            ArrayList<Systems> systemList = TournamentDB.getSystems();
            
            HttpSession session = request.getSession();
            session.setAttribute("activeUsers", arrayOfUsers);
            session.setAttribute("tournaments", tournamentList);
            session.setAttribute("systems", systemList);

            String url = "/login/TO/createTournament.jsp";
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
