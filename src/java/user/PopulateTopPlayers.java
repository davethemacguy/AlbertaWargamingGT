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

public class PopulateTopPlayers extends HttpServlet {

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

            String currentSeason = TournamentResultsDB.returnCurrentSeason();
            ArrayList<Tournament> seasons = TournamentResultsDB.selectTournamentSeasons();
            ArrayList<Tournament> systems = TournamentResultsDB.selectSystem();
            
            String season = request.getParameter("season");
            String system = request.getParameter("system");
            
            ArrayList<Tournament> results = TournamentResultsDB.selectTopPlayers(season, system);
            

            
            HttpSession session = request.getSession();
            session.setAttribute("seasons", seasons);
            session.setAttribute("currentSeason", currentSeason);
            session.setAttribute("systems", systems);
            session.setAttribute("results", results);
            
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