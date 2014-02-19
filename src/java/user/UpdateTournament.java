/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package user;

import business.Tournament;
import data.TournamentDB;
import java.io.IOException;
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
public class UpdateTournament extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
    
    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        
            
            String date = request.getParameter("tournamentDate");
            String name = request.getParameter("tournamentName");
            String system = request.getParameter("system");
            String bestGeneral = request.getParameter("bestGeneral");
            String bestOverall = request.getParameter("bestOverall");
            String bestPainted = request.getParameter("bestPainted");
            String bestSport = request.getParameter("bestSport");
            int tournamentCost = Integer.parseInt(request.getParameter("tournamentCost"));
            int maxPlayers = Integer.parseInt(request.getParameter("maxPlayers"));
            int minPlayers = Integer.parseInt(request.getParameter("minPlayers"));
            int playersPerTeam = Integer.parseInt(request.getParameter("playersPerTeam"));
            int tournamentParticipants = Integer.parseInt(request.getParameter("tournamentParticipants"));
            String url = "/login/indexProtected.jsp";
            
            HttpSession session = request.getSession();

            Tournament tournament = new Tournament();
            tournament.setTournamentDate(date);
            tournament.setTournamentName(name);
            tournament.setSystem(system);
            tournament.setBestGeneral(bestGeneral);
            tournament.setBestOverall(bestOverall);
            tournament.setBestPainted(bestPainted);
            tournament.setBestSport(bestSport);
            tournament.setTournamentCost(tournamentCost);
            tournament.setMaxPlayers(maxPlayers);
            tournament.setMinPlayers(minPlayers);
            tournament.setPlayersPerTeam(playersPerTeam);
            tournament.setTournamentParticipants(tournamentParticipants);
            
            TournamentDB.update(tournament);
            
            RequestDispatcher dispatcher =
              getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
        
    } 
}