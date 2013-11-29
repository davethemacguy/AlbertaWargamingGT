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

public class PopulateTournamentsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        
                

        
        ArrayList<Tournament> arrayOfTournaments = TournamentResultsDB.selectTournaments();
        ArrayList<Tournament> arrayOfSeasons = TournamentResultsDB.selectTournamentSeasons();
        ArrayList<Tournament> arrayOfSystems = TournamentResultsDB.selectSystem();
        
        HttpSession session = request.getSession();
        session.setAttribute("tournaments", arrayOfTournaments);
        session.setAttribute("seasons", arrayOfSeasons);
        session.setAttribute("systems", arrayOfSystems);
        String url = "/login/tournamentRankings.jsp";
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