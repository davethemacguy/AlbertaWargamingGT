package user;

import business.Army;
import data.TournamentResultsDB;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ArmyRankingDataServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        
        String dataSelection = request.getParameter("dataSelection");
        
        ArrayList<Army> army40K = new ArrayList<Army>();
        ArrayList<Army> armyFantasy = new ArrayList<Army>();
        ArrayList<Army> armyWarmaHordes = new ArrayList<Army>();
        
        if(dataSelection.equals("Total Performance")){
            army40K = TournamentResultsDB.selectArmyPerformance40K();
            armyFantasy = TournamentResultsDB.selectArmyPerformanceFantasy();
            armyWarmaHordes = TournamentResultsDB.selectArmyPerformanceWarmaHordes();
        }else if(dataSelection.equals("Average Performance")){
            army40K = TournamentResultsDB.selectArmyAveragePerformance40K();
            armyFantasy = TournamentResultsDB.selectArmyAveragePerformanceFantasy();
            armyWarmaHordes = TournamentResultsDB.selectArmyAveragePerformanceWarmaHordes();
        }else if(dataSelection.equals("Popularity")){
            army40K = TournamentResultsDB.selectArmyPopularity40K();
            armyFantasy = TournamentResultsDB.selectArmyPopularityFantasy();
            armyWarmaHordes = TournamentResultsDB.selectArmyPopularityWarmaHordes();
        }
        
        HttpSession session = request.getSession();
        session.setAttribute("armyData40K", army40K);
        session.setAttribute("armyDataFantasy", armyFantasy);
        session.setAttribute("armyDataWarmaHordes", armyWarmaHordes);
        session.setAttribute("dataSelectionType", dataSelection);
        String url = "/login/armyRankings.jsp";
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