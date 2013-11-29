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
        String selectedSeason = request.getParameter("fk_tournamentSeason");
        
        ArrayList<Army> army40K = new ArrayList<Army>();
        ArrayList<Army> armyFantasy = new ArrayList<Army>();
        ArrayList<Army> armyWarmaHordes = new ArrayList<Army>();
        
        if(dataSelection.equals("Total Performance")){
            army40K = TournamentResultsDB.selectArmyPerformance40K(selectedSeason);
            armyFantasy = TournamentResultsDB.selectArmyPerformanceFantasy(selectedSeason);
            armyWarmaHordes = TournamentResultsDB.selectArmyPerformanceWarmaHordes(selectedSeason);
        }else if(dataSelection.equals("Average Performance")){
            army40K = TournamentResultsDB.selectArmyAveragePerformance40K(selectedSeason);
            armyFantasy = TournamentResultsDB.selectArmyAveragePerformanceFantasy(selectedSeason);
            armyWarmaHordes = TournamentResultsDB.selectArmyAveragePerformanceWarmaHordes(selectedSeason);
        }else if(dataSelection.equals("Popularity")){
            army40K = TournamentResultsDB.selectArmyPopularity40K(selectedSeason);
            armyFantasy = TournamentResultsDB.selectArmyPopularityFantasy(selectedSeason);
            armyWarmaHordes = TournamentResultsDB.selectArmyPopularityWarmaHordes(selectedSeason);
        }
        
        HttpSession session = request.getSession();
        session.setAttribute("armyData40K", army40K);
        session.setAttribute("armyDataFantasy", armyFantasy);
        session.setAttribute("armyDataWarmaHordes", armyWarmaHordes);
        session.setAttribute("dataSelectionType", dataSelection);
        session.setAttribute("tournamentSeason", selectedSeason);
        

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