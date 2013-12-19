/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package user;

import business.Tournament;
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

/**
 *
 * @author localadmin
 */
public class TestPage extends HttpServlet {
    
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        
            String userName ="davethemacguy";
            
            String fullName = UserDB.getFullName(userName);
            
            HttpSession session = request.getSession();
            session.setAttribute("userName", userName);
            session.setAttribute("fullName", fullName);
            
            String url = "/login/testPage.jsp";
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
