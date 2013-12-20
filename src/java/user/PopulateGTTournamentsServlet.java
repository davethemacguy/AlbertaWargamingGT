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

public class PopulateGTTournamentsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        
                

        
        ArrayList<Tournament> arrayOfSeasons = TournamentResultsDB.selectGTTournamentSeasons();
        ArrayList<Tournament> arrayOfSystems = TournamentResultsDB.selectGTSystem();
        String currentSeason = TournamentResultsDB.returnCurrentSeason();
        
        HttpSession session = request.getSession();
        session.setAttribute("seasons", arrayOfSeasons);
        session.setAttribute("systems", arrayOfSystems);
        session.setAttribute("currentSeason", currentSeason);
        
        String url = "/login/gtTournamentRankings.jsp";
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