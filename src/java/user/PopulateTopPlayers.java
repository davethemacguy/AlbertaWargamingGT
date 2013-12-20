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

            String season = request.getParameter("tournamentSeason");
            
            ArrayList<Tournament> results = TournamentResultsDB.selectTopPlayers(season);
            ArrayList<Tournament> seasons = TournamentResultsDB.selectTournamentSeasons();
            ArrayList<Tournament> systems = TournamentResultsDB.selectSystem();
            String currentSeason = TournamentResultsDB.returnCurrentSeason();

            
            HttpSession session = request.getSession();
            session.setAttribute("results", results);
            session.setAttribute("seasons", seasons);
            session.setAttribute("currentSeason", currentSeason);
            
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