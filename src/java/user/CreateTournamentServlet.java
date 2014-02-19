/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package user;

import business.Tournament;
import business.User;
import data.TournamentDB;
import data.UserDB;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Calendar;
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
public class CreateTournamentServlet extends HttpServlet {
    
  

    
    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException, UnsupportedEncodingException {
        
            String userName = request.getRemoteUser();
            Tournament newTournament = new Tournament();
            
            /* Calcualte curren season */
            Calendar currentDate = Calendar.getInstance();
            int seasonStart=7;
            int currentMonth = currentDate.get(Calendar.MONTH);
            int currentYear = currentDate.get(Calendar.YEAR);
            int startYear;
            int endYear;
        
        if (currentMonth > seasonStart) {
            startYear = currentYear;
            endYear = currentYear+1;
        }   else    {
            startYear = currentYear-1;
            endYear = currentYear;
        }
            
        String tournamentSeason = null;
        tournamentSeason = ""+startYear+"-"+endYear;
            
            String date = request.getParameter("tournamentDate");
            String name = request.getParameter("tournamentName");
            String system = request.getParameter("system");
            int cost = Integer.parseInt(request.getParameter("tournamentCost"));
            int max = Integer.parseInt(request.getParameter("maxPlayers"));
            int min = Integer.parseInt(request.getParameter("minPlayers"));
            int players = Integer.parseInt(request.getParameter("playersPerTeam"));
            
            newTournament.setTournamentDate(date);
            newTournament.setTournamentOrganizer(userName);
            newTournament.setTournamentSeason(tournamentSeason);
            newTournament.setTournamentName(name);
            newTournament.setSystem(system);
            newTournament.setTournamentCost(cost);
            newTournament.setMaxPlayers(max);
            newTournament.setMinPlayers(min);
            newTournament.setPlayersPerTeam(players);
            
            TournamentDB.newTournament(newTournament);
    
            String url = "/login/indexProtected.jsp";
    RequestDispatcher dispatcher =
                getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
}
}

