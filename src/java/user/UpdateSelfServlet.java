package user;

import business.TournamentResults;
import business.User;
import data.TournamentResultsDB;
import data.UserDB;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UpdateSelfServlet extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, 
            HttpServletResponse response) 
            throws ServletException, IOException
    {
        String userName = request.getRemoteUser();
        User user = UserDB.selectUserName(userName);
        String playerName = UserDB.getFullName(userName);
        ArrayList<TournamentResults> results = TournamentResultsDB.selectIndividualTournamentResults(playerName);

        HttpSession session = request.getSession();
        session.setAttribute("user", user);
        session.setAttribute("fullName", playerName);
        session.setAttribute("userName", userName);
        session.setAttribute("results", results);

        String url = "/login/updateSelf.jsp";
        RequestDispatcher dispatcher =
              getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }

}