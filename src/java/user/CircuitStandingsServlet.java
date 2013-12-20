package user;

import business.SystemResults;
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

public class CircuitStandingsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        
        
        
        String fk_tournamentSeason = request.getParameter("fk_tournamentSeason");

        
        ArrayList<Tournament> arrayOfSeasons = TournamentResultsDB.selectTournamentSeasons();
        ArrayList<SystemResults> arrayOf40K = TournamentResultsDB.select40K(fk_tournamentSeason);
        ArrayList<SystemResults> arrayOfFantasy = TournamentResultsDB.selectFantasy(fk_tournamentSeason);
        ArrayList<SystemResults> arrayOfWarmaHordes = TournamentResultsDB.selectWarmaHordes(fk_tournamentSeason);
        String currentSeason = TournamentResultsDB.returnCurrentSeason();

       
        
        HttpSession session = request.getSession();
        session.setAttribute("fk_tournamentSeason", fk_tournamentSeason);
        session.setAttribute("seasons", arrayOfSeasons);
        session.setAttribute("results40K", arrayOf40K);
        session.setAttribute("resultsFantasy", arrayOfFantasy);
        session.setAttribute("resultsWarmaHordes", arrayOfWarmaHordes);
        session.setAttribute("currentSeason", currentSeason);
        String url = "/login/rankings.jsp";
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