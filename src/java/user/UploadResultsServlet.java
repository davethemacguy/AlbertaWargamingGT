/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

import business.Tournament;
import business.TournamentResults;
import data.TournamentDB;
import data.TournamentResultsDB;
import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Stephen
 */
public class UploadResultsServlet extends HttpServlet {
 
    
    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Map paramsFromForm = request.getParameterMap();
        Iterator parameterIterator = paramsFromForm.keySet().iterator();

       
        
        // Calculate current season based on if the current month is before or after July.
                
        Calendar currentDate = Calendar.getInstance();
        int seasonStart=7;
        int currentMonth = currentDate.get(Calendar.MONTH);
        int currentYear = currentDate.get(Calendar.YEAR);
        int startYear;
        int endYear;
        
        if (currentMonth > seasonStart) {
            startYear = currentYear;
            endYear = currentYear+1;
        }   else    {
            startYear = currentYear-1;
            endYear = currentYear;
        }
            
        String tournamentSeason = null;
        tournamentSeason = ""+startYear+"-"+endYear;
            
        
        
        
        /*
         * 40K results read in
         */
        if (!request.getParameter("bestGeneralFortyK").equals("")) {
            Tournament tournament = new Tournament();
            tournament.setTournamentSeason(tournamentSeason);
            tournament.setTournamentName(request.getParameter("tournamentName"));
            tournament.setTournamentDate(request.getParameter("tournamentDate"));
            tournament.setSystem("40K");
            tournament.setBestOverall(request.getParameter("bestOverallFortyK"));
            tournament.setBestGeneral(request.getParameter("bestGeneralFortyK"));
            tournament.setBestPainted(request.getParameter("bestPaintedFortyK"));
            tournament.setBestSport(request.getParameter("bestSportFortyK"));
            TournamentDB.add(tournament);

            int num40k;
            Map<String, String> fortyKFirstNames = new HashMap<String, String>();
            Map<String, String> fortyKLastNames = new HashMap<String, String>();
            Map<String, String> fortyKArmies = new HashMap<String, String>();
            Map<String, String> fortyKScores = new HashMap<String, String>();
            Map<String, String> fortyKOptOut = new HashMap<String, String>();

            while (parameterIterator.hasNext()) {
                String key = (String) parameterIterator.next();
                String value = ((String[]) paramsFromForm.get(key))[0];

                if (key.contains("FortyK")) {
                    if (key.contains("firstName")) {
                        fortyKFirstNames.put(key, value);
                    }
                    if (key.contains("lastName")) {
                        fortyKLastNames.put(key, value);
                    }
                    if (key.contains("army")) {
                        fortyKArmies.put(key, value);
                    }
                    if (key.contains("score")) {
                        fortyKScores.put(key, value);
                    }
                    if (key.contains("optOut")) {
                        fortyKOptOut.put(key, value);
                    }
                }
            }

            num40k = fortyKFirstNames.size();

            for (int j = 1; j <= num40k; j++) {
                TournamentResults fortyKResults = new TournamentResults();
                String playerNameFirst = null;
                String jString = Integer.toString(j);

                for (String string : fortyKFirstNames.keySet()) {
                    if (string.substring(string.indexOf("K") + 1).equals(jString)) {
                        playerNameFirst = fortyKFirstNames.get(string);
                    }
                }
                for (String string : fortyKLastNames.keySet()) {
                    if (string.substring(string.indexOf("K") + 1).equals(jString)) {
                        fortyKResults.setPlayerName(playerNameFirst + " " + fortyKLastNames.get(string));
                    }
                }
                for (String string : fortyKArmies.keySet()) {
                    if (string.substring(string.indexOf("K") + 1).equals(jString)) {
                        fortyKResults.setArmy(fortyKArmies.get(string));
                    }
                }
                for (String string : fortyKScores.keySet()) {
                    if (string.substring(string.indexOf("K") + 1).equals(jString)) {
                        fortyKResults.setScore(fortyKScores.get(string));
                    }
                }
                for (String string : fortyKOptOut.keySet()) {
                    if (string.substring(string.indexOf("K") + 1).equals(jString)) {
                        fortyKResults.setOptOut(fortyKOptOut.get(string));
                    }
                }
                fortyKResults.setTournamentSeason(tournamentSeason);
                fortyKResults.setSystem("40K");
                fortyKResults.setTournamentName(request.getParameter("tournamentName"));
                fortyKResults.setTournamentDate(request.getParameter("tournamentDate"));
                TournamentResultsDB.add(fortyKResults);
            }
        }

        /*
         * Fantasy results read in
         */
        if (!request.getParameter("bestGeneralFantasy").equals("")) {
            Iterator parameterIterator1 = paramsFromForm.keySet().iterator();
            Tournament tournament = new Tournament();
            tournament.setTournamentSeason(tournamentSeason);
            tournament.setTournamentName(request.getParameter("tournamentName"));
            tournament.setTournamentDate(request.getParameter("tournamentDate"));
            tournament.setSystem("Fantasy");
            tournament.setBestOverall(request.getParameter("bestOverallFantasy"));
            tournament.setBestGeneral(request.getParameter("bestGeneralFantasy"));
            tournament.setBestPainted(request.getParameter("bestPaintedFantasy"));
            tournament.setBestSport(request.getParameter("bestSportFantasy"));
            TournamentDB.add(tournament);


            int numFantasy;
            Map<String, String> fantasyFirstNames = new HashMap<String, String>();
            Map<String, String> fantasyLastNames = new HashMap<String, String>();
            Map<String, String> fantasyArmies = new HashMap<String, String>();
            Map<String, String> fantasyScores = new HashMap<String, String>();
            Map<String, String> fantasyOptOut = new HashMap<String, String>();

            while (parameterIterator1.hasNext()) {
                String key = (String) parameterIterator1.next();
                String value = ((String[]) paramsFromForm.get(key))[0];


                if (key.contains("Fantasy")) {
                    if (key.contains("firstName")) {
                        fantasyFirstNames.put(key, value);
                    }
                    if (key.contains("lastName")) {
                        fantasyLastNames.put(key, value);
                    }
                    if (key.contains("army")) {
                        fantasyArmies.put(key, value);
                    }
                    if (key.contains("score")) {
                        fantasyScores.put(key, value);
                    }
                    if (key.contains("optOut")) {
                        fantasyOptOut.put(key, value);
                    }
                }
            }

            numFantasy = fantasyFirstNames.size();

            for (int j = 1; j <= numFantasy; j++) {
                TournamentResults fantasyResults = new TournamentResults();
                String playerNameFirst = null;
                String jString = Integer.toString(j);

                for (String string : fantasyFirstNames.keySet()) {
                    if (string.substring(string.lastIndexOf("y") + 1).equals(jString)) {
                        playerNameFirst = fantasyFirstNames.get(string);
                    }
                }
                for (String string : fantasyLastNames.keySet()) {
                    if (string.substring(string.lastIndexOf("y") + 1).equals(jString)) {
                        fantasyResults.setPlayerName(playerNameFirst + " " + fantasyLastNames.get(string));
                    }
                }
                for (String string : fantasyArmies.keySet()) {
                    if (string.substring(string.lastIndexOf("y") + 1).equals(jString)) {
                        fantasyResults.setArmy(fantasyArmies.get(string));
                    }
                }
                for (String string : fantasyScores.keySet()) {
                    if (string.substring(string.lastIndexOf("y") + 1).equals(jString)) {
                        fantasyResults.setScore(fantasyScores.get(string));
                    }
                }
                for (String string : fantasyOptOut.keySet()) {
                    if (string.substring(string.lastIndexOf("y") + 1).equals(jString)) {
                        fantasyResults.setOptOut(fantasyOptOut.get(string));
                    }
                }

                fantasyResults.setTournamentSeason(tournamentSeason);
                fantasyResults.setSystem("Fantasy");
                fantasyResults.setTournamentName(request.getParameter("tournamentName"));
                fantasyResults.setTournamentDate(request.getParameter("tournamentDate"));
                TournamentResultsDB.add(fantasyResults);
            }
        }
        /*
         * Waramahordes results read in
         */
        if (!request.getParameter("bestGeneralWarmaHordes").equals("")) {
            Iterator parameterIterator2 = paramsFromForm.keySet().iterator();
            Tournament tournament = new Tournament();
            tournament.setTournamentSeason(tournamentSeason);
            tournament.setTournamentName(request.getParameter("tournamentName"));
            tournament.setTournamentDate(request.getParameter("tournamentDate"));
            tournament.setSystem("WarmaHordes");
            tournament.setBestOverall(request.getParameter("bestOverallWarmaHordes"));
            tournament.setBestGeneral(request.getParameter("bestGeneralWarmaHordes"));
            tournament.setBestPainted(request.getParameter("bestPaintedWarmaHordes"));
            tournament.setBestSport(request.getParameter("bestSportWarmaHordes"));
            TournamentDB.add(tournament);

            int numWarmaHordes;
            Map<String, String> warmaHordesFirstNames = new HashMap<String, String>();
            Map<String, String> warmaHordesLastNames = new HashMap<String, String>();
            Map<String, String> warmaHordesArmies = new HashMap<String, String>();
            Map<String, String> warmaHordesScores = new HashMap<String, String>();
            Map<String, String> warmaHordesOptOut = new HashMap<String, String>();

            while (parameterIterator2.hasNext()) {
                String key = (String) parameterIterator2.next();
                String value = ((String[]) paramsFromForm.get(key))[0];

                if (key.contains("WarmaHordes")) {
                    if (key.contains("firstName")) {
                        warmaHordesFirstNames.put(key, value);
                    }
                    if (key.contains("lastName")) {
                        warmaHordesLastNames.put(key, value);
                    }
                    if (key.contains("army")) {
                        warmaHordesArmies.put(key, value);
                    }
                    if (key.contains("score")) {
                        warmaHordesScores.put(key, value);
                    }
                    if (key.contains("optOut")) {
                        warmaHordesOptOut.put(key, value);
                    }
                }
            }

            numWarmaHordes = warmaHordesFirstNames.size();
            for (int j = 1; j <= numWarmaHordes; j++) {
                TournamentResults warmaHordesResults = new TournamentResults();
                String playerNameFirst = null;
                String jString = Integer.toString(j);
                
                for (String string : warmaHordesFirstNames.keySet()) {
                    if (string.substring(string.lastIndexOf("s") + 1).equals(jString)) {
                        playerNameFirst = warmaHordesFirstNames.get(string);
                    }
                }
                for (String string : warmaHordesLastNames.keySet()) {
                    if (string.substring(string.lastIndexOf("s") + 1).equals(jString)) {
                        warmaHordesResults.setPlayerName(playerNameFirst + " " + warmaHordesLastNames.get(string));
                    }
                }
                for (String string : warmaHordesArmies.keySet()) {
                    if (string.substring(string.lastIndexOf("s") + 1).equals(jString)) {
                        warmaHordesResults.setArmy(warmaHordesArmies.get(string));
                    }
                }
                for (String string : warmaHordesScores.keySet()) {
                    if (string.substring(string.lastIndexOf("s") + 1).equals(jString)) {
                        warmaHordesResults.setScore(warmaHordesScores.get(string));
                    }
                }
                for (String string : warmaHordesOptOut.keySet()) {
                    if (string.substring(string.lastIndexOf("s") + 1).equals(jString)) {
                        warmaHordesResults.setOptOut(warmaHordesOptOut.get(string));
                    }
                }
                warmaHordesResults.setTournamentSeason(tournamentSeason);
                warmaHordesResults.setSystem("WarmaHordes");
                warmaHordesResults.setTournamentName(request.getParameter("tournamentName"));
                warmaHordesResults.setTournamentDate(request.getParameter("tournamentDate"));
                TournamentResultsDB.add(warmaHordesResults);
            }
        }
        
        /*
         * Infinity results read in
         */
        if (!request.getParameter("bestGeneralInfinity").equals("")) {
            Iterator parameterIterator1 = paramsFromForm.keySet().iterator();
            Tournament tournament = new Tournament();
            tournament.setTournamentSeason(tournamentSeason);
            tournament.setTournamentName(request.getParameter("tournamentName"));
            tournament.setTournamentDate(request.getParameter("tournamentDate"));
            tournament.setSystem("Infinity");
            tournament.setBestOverall(request.getParameter("bestOverallInfinity"));
            tournament.setBestGeneral(request.getParameter("bestGeneralInfinity"));
            tournament.setBestPainted(request.getParameter("bestPaintedInfinity"));
            tournament.setBestSport(request.getParameter("bestSportInfinity"));
            TournamentDB.add(tournament);


            int numInfinity;
            Map<String, String> infinityFirstNames = new HashMap<String, String>();
            Map<String, String> infinityLastNames = new HashMap<String, String>();
            Map<String, String> infinityArmies = new HashMap<String, String>();
            Map<String, String> infinityScores = new HashMap<String, String>();
            Map<String, String> infinityOptOut = new HashMap<String, String>();

            while (parameterIterator1.hasNext()) {
                String key = (String) parameterIterator1.next();
                String value = ((String[]) paramsFromForm.get(key))[0];


                if (key.contains("Infinity")) {
                    if (key.contains("firstName")) {
                        infinityFirstNames.put(key, value);
                    }
                    if (key.contains("lastName")) {
                        infinityLastNames.put(key, value);
                    }
                    if (key.contains("army")) {
                        infinityArmies.put(key, value);
                    }
                    if (key.contains("score")) {
                        infinityScores.put(key, value);
                    }
                    if (key.contains("optOut")) {
                        infinityOptOut.put(key, value);
                    }
                }
            }

            numInfinity = infinityFirstNames.size();

            for (int j = 1; j <= numInfinity; j++) {
                TournamentResults infinityResults = new TournamentResults();
                String playerNameFirst = null;
                String jString = Integer.toString(j);

                for (String string : infinityFirstNames.keySet()) {
                    if (string.substring(string.lastIndexOf("y") + 1).equals(jString)) {
                        playerNameFirst = infinityFirstNames.get(string);
                    }
                }
                for (String string : infinityLastNames.keySet()) {
                    if (string.substring(string.lastIndexOf("y") + 1).equals(jString)) {
                        infinityResults.setPlayerName(playerNameFirst + " " + infinityLastNames.get(string));
                    }
                }
                for (String string : infinityArmies.keySet()) {
                    if (string.substring(string.lastIndexOf("y") + 1).equals(jString)) {
                        infinityResults.setArmy(infinityArmies.get(string));
                    }
                }
                for (String string : infinityScores.keySet()) {
                    if (string.substring(string.lastIndexOf("y") + 1).equals(jString)) {
                        infinityResults.setScore(infinityScores.get(string));
                    }
                }
                for (String string : infinityOptOut.keySet()) {
                    if (string.substring(string.lastIndexOf("y") + 1).equals(jString)) {
                        infinityResults.setOptOut(infinityOptOut.get(string));
                    }
                }

                infinityResults.setTournamentSeason(tournamentSeason);
                infinityResults.setSystem("Infinity");
                infinityResults.setTournamentName(request.getParameter("tournamentName"));
                infinityResults.setTournamentDate(request.getParameter("tournamentDate"));
                TournamentResultsDB.add(infinityResults);
            }
        }
        
        /*
         * Xwing results read in
         */
        if (!request.getParameter("bestGeneralXwing").equals("")) {
            Iterator parameterIterator1 = paramsFromForm.keySet().iterator();
            Tournament tournament = new Tournament();
            tournament.setTournamentSeason(tournamentSeason);
            tournament.setTournamentName(request.getParameter("tournamentName"));
            tournament.setTournamentDate(request.getParameter("tournamentDate"));
            tournament.setSystem("Xwing");
            tournament.setBestOverall(request.getParameter("bestOverallXwing"));
            tournament.setBestGeneral(request.getParameter("bestGeneralXwing"));
            tournament.setBestPainted(request.getParameter("bestPaintedXwing"));
            tournament.setBestSport(request.getParameter("bestSportXwing"));
            TournamentDB.add(tournament);


            int numXwing;
            Map<String, String> xwingFirstNames = new HashMap<String, String>();
            Map<String, String> xwingLastNames = new HashMap<String, String>();
            Map<String, String> xwingArmies = new HashMap<String, String>();
            Map<String, String> xwingScores = new HashMap<String, String>();
            Map<String, String> xwingOptOut = new HashMap<String, String>();

            while (parameterIterator1.hasNext()) {
                String key = (String) parameterIterator1.next();
                String value = ((String[]) paramsFromForm.get(key))[0];


                if (key.contains("Xwing")) {
                    if (key.contains("firstName")) {
                        xwingFirstNames.put(key, value);
                    }
                    if (key.contains("lastName")) {
                        xwingLastNames.put(key, value);
                    }
                    if (key.contains("army")) {
                        xwingArmies.put(key, value);
                    }
                    if (key.contains("score")) {
                        xwingScores.put(key, value);
                    }
                    if (key.contains("optOut")) {
                        xwingOptOut.put(key, value);
                    }
                }
            }

            numXwing = xwingFirstNames.size();

            for (int j = 1; j <= numXwing; j++) {
                TournamentResults xwingResults = new TournamentResults();
                String playerNameFirst = null;
                String jString = Integer.toString(j);

                for (String string : xwingFirstNames.keySet()) {
                    if (string.substring(string.lastIndexOf("y") + 1).equals(jString)) {
                        playerNameFirst = xwingFirstNames.get(string);
                    }
                }
                for (String string : xwingLastNames.keySet()) {
                    if (string.substring(string.lastIndexOf("y") + 1).equals(jString)) {
                        xwingResults.setPlayerName(playerNameFirst + " " + xwingLastNames.get(string));
                    }
                }
                for (String string : xwingArmies.keySet()) {
                    if (string.substring(string.lastIndexOf("y") + 1).equals(jString)) {
                        xwingResults.setArmy(xwingArmies.get(string));
                    }
                }
                for (String string : xwingScores.keySet()) {
                    if (string.substring(string.lastIndexOf("y") + 1).equals(jString)) {
                        xwingResults.setScore(xwingScores.get(string));
                    }
                }
                for (String string : xwingOptOut.keySet()) {
                    if (string.substring(string.lastIndexOf("y") + 1).equals(jString)) {
                        xwingResults.setOptOut(xwingOptOut.get(string));
                    }
                }

                xwingResults.setTournamentSeason(tournamentSeason);
                xwingResults.setSystem("Xwing");
                xwingResults.setTournamentName(request.getParameter("tournamentName"));
                xwingResults.setTournamentDate(request.getParameter("tournamentDate"));
                TournamentResultsDB.add(xwingResults);
            }
        }

        response.sendRedirect("/AlbertaWargaming/login/indexProtected.jsp");
    }
}
