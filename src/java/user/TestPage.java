/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package user;

import business.Tournament;
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
public class TestPage extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        
            String tournament = "Onslaught (Fall)";
            String season = "2012-2013";
            String system = "40K";
            int count = TournamentResultsDB.selectTournamentParticipants(tournament, system, season);

            
            HttpSession session = request.getSession();
            session.setAttribute("tournament", tournament);
            session.setAttribute("season", season);
            session.setAttribute("system", system);
            session.setAttribute("count", count);
            
            String url = "/login/testPage.jsp";
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
