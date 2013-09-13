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

public class CircuitStandingsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        ArrayList<SystemResults> arrayOf40K = TournamentResultsDB.select40K();
        ArrayList<SystemResults> arrayOfFantasy = TournamentResultsDB.selectFantasy();
        ArrayList<SystemResults> arrayOfWarmaHordes = TournamentResultsDB.selectWarmaHordes();

        HttpSession session = request.getSession();
        session.setAttribute("results40K", arrayOf40K);
        session.setAttribute("resultsFantasy", arrayOfFantasy);
        session.setAttribute("resultsWarmaHordes", arrayOfWarmaHordes);
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