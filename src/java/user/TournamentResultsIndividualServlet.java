package user;

import business.SystemResults;
import data.TournamentResultsDB;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class TournamentResultsIndividualServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        
        String tournament = request.getParameter("tournament");
        
        ArrayList<SystemResults> arrayOfTournamentResults = TournamentResultsDB.selectTournamentResults(tournament);
        String tournamentInfo = TournamentResultsDB.selectTournamentInfo(tournament);

        HttpSession session = request.getSession();
        session.setAttribute("tournamentInfo", tournamentInfo);
        session.setAttribute("tournamentResults", arrayOfTournamentResults);
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