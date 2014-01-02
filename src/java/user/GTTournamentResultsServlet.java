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

public class GTTournamentResultsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        
        String tournamentSeason = request.getParameter("tournamentSeason");
        String system = request.getParameter("system");
        
        ArrayList<SystemResults> arrayOfTournamentResults = TournamentResultsDB.selectGTTournamentResults(tournamentSeason, system);

   

        HttpSession session = request.getSession();
        session.setAttribute("gtTournamentResults", arrayOfTournamentResults);

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