/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

import business.Tournament;
import business.TournamentResults;
import business.gCal;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import com.google.api.client.util.DateTime;
import com.google.api.services.calendar.Calendar;
import com.google.api.services.calendar.model.Event;
import com.google.api.services.calendar.model.EventAttendee;
import com.google.api.services.calendar.model.EventDateTime;
import data.TournamentDB;
import data.TournamentResultsDB;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 *
 * @author localadmin
 */
public class CreateEventServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Event event = new Event();
        event.setSummary(request.getParameter("eventName"));
        event.setLocation(request.getParameter("eventLoc"));
        EventDateTime edt = new EventDateTime();
        edt.setDate(new DateTime(request.getParameter("startEventDate")));
        event.setStart(edt);
        EventDateTime edt1 = new EventDateTime();
        edt1.setDate(new DateTime(request.getParameter("endEventDate")));
        event.setEnd(edt1);
        EventAttendee person = new EventAttendee();
        person.setEmail(request.getParameter("corresEmail"));
        List<EventAttendee> attendees = new ArrayList<EventAttendee>();
        event.setAttendees(attendees);
        Calendar calendar = gCal.getCalendar();
        calendar.events().insert("feafg25dpp9p4tikvejq5u9ef8@group.calendar.google.com", event).execute();

        Map paramsFromForm = request.getParameterMap();
        Iterator parameterIterator = paramsFromForm.keySet().iterator();

                /****NEED TO WRITE TO DB CORRECTLY STARTING WITH THIS FUNCTION***/

//        java.util.Calendar currentDate = java.util.Calendar.getInstance();
//        int seasonStart=7;
//        int currentMonth = currentDate.get(java.util.Calendar.MONTH);
//        int currentYear = currentDate.get(java.util.Calendar.YEAR);
//        int startYear;
//        int endYear;
//        
//        
//        
//        
//        if (currentMonth > seasonStart) {
//            startYear = currentYear;
//            endYear = currentYear+1;
//        }   else    {
//            startYear = currentYear-1;
//            endYear = currentYear;
//        }
//            
//        String tournamentSeason = null;
//        tournamentSeason = ""+startYear+"-"+endYear;
//        
//        int numSystem;
//        Map<String, String> nameSystem = new HashMap<String, String>();
//        Map<String, String> gameSystem = new HashMap<String, String>();
//        Map<String, String> roundsSystem = new HashMap<String, String>();
//        Map<String, String> startDateSystem = new HashMap<String, String>();
//        Map<String, String> endDateSystem = new HashMap<String, String>();
//        Map<String, String> costSystem = new HashMap<String, String>();
//        Map<String, String> scenariosSystem = new HashMap<String, String>();
//
//        while (parameterIterator.hasNext()) {
//            String key = (String) parameterIterator.next();
//            String value = ((String[]) paramsFromForm.get(key))[0];
//
//            if (key.contains("System")) {
//                if (key.contains("name")) {
//                    nameSystem.put(key, value);
//                }
//                if (key.contains("game")) {
//                    gameSystem.put(key, value);
//                }
//                if (key.contains("rounds")) {
//                    roundsSystem.put(key, value);
//                }
//                if (key.contains("startDate")) {
//                    startDateSystem.put(key, value);
//                }
//                if (key.contains("endDate")) {
//                    endDateSystem.put(key, value);
//                }
//                if (key.contains("cost")) {
//                    costSystem.put(key, value);
//                }
//                if (key.contains("scenarios")) {
//                    scenariosSystem.put(key, value);
//                }
//            }
//        }
//
//        numSystem = nameSystem.size();
//        for (int j = 1; j <= numSystem; j++) {
//            TournamentResults tournamentStub = new TournamentResults();
//            String jString = Integer.toString(j);
//
//            for (String string : nameSystem.keySet()) {
//                if (string.substring(string.lastIndexOf("m") + 1).equals(jString)) {
//                    tournamentStub.setTournamentName(string);
//                }
//            }
//            for (String string : gameSystem.keySet()) {
//                if (string.substring(string.lastIndexOf("m") + 1).equals(jString)) {
//                    tournamentStub.setSystem(string);
//                }
//            }
//            for (String string : roundsSystem.keySet()) {
//                if (string.substring(string.lastIndexOf("m") + 1).equals(jString)) {
//                    tournamentStub.setRounds(string);
//                }
//            }
//            for (String string : startDateSystem.keySet()) {
//                if (string.substring(string.lastIndexOf("m") + 1).equals(jString)) {
//                    tournamentStub.setScore(startDateSystem.get(string));
//                }
//            }
//            for (String string : endDateSystem.keySet()) {
//                if (string.substring(string.lastIndexOf("m") + 1).equals(jString)) {
//                    tournamentStub.setOptOut(endDateSystem.get(string));
//                }
//            }
//            for (String string : costSystem.keySet()) {
//                if (string.substring(string.lastIndexOf("m") + 1).equals(jString)) {
//                    tournamentStub.setOptOut(endDateSystem.get(string));
//                }
//            }
//            for (String string : endDateSystem.keySet()) {
//                if (string.substring(string.lastIndexOf("m") + 1).equals(jString)) {
//                    tournamentStub.setOptOut(endDateSystem.get(string));
//                }
//            }
//            tournamentStub.setTournamentSeason(tournamentSeason);
//            tournamentStub.setSystem("WarmaHordes");
//            tournamentStub.setTournamentName(request.getParameter("tournamentName"));
//            tournamentStub.setTournamentDate(request.getParameter("tournamentDate"));
//            TournamentResultsDB.add(tournamentStub);
//        }

        String url = "/login/indexProtected.jsp";
        RequestDispatcher dispatcher
                = getServletContext().getRequestDispatcher(url);

        dispatcher.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
