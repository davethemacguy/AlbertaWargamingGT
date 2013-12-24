/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package user;

import business.Tournament;
import data.TournamentResultsDB;
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
public class TopPlayersServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

            String tournamentSeason = request.getParameter("tournamentSeason");
            String system = request.getParameter("system");
            
            ArrayList<Tournament> results = TournamentResultsDB.selectTopPlayers(tournamentSeason, system);
            

            
            HttpSession session = request.getSession();
            session.setAttribute("results", results);
            session.setAttribute("tournamentSeason", tournamentSeason);
            session.setAttribute("system", system);
            
            String url = "/login/topPlayers.jsp";
            
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
