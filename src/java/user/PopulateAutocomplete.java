/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package user;


import business.User;
import com.google.gson.Gson;
import data.UserDB;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
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


public class PopulateAutocomplete extends HttpServlet {

    public PopulateAutocomplete() {
        super();
    }

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
    
    PrintWriter out = response.getWriter();
    
    try {
        ArrayList firstNames = UserDB.selectFirstNames();
        Gson gson = new Gson();
        String listOfFirstNames = gson.toJson(firstNames);
        out.println("{\"FirstNames\":"+listOfFirstNames+"}");  
        }
    catch (Exception ex) {
        out.println("Error: " +ex.getMessage());
    }
    finally {
        out.close();
    }
}
}
    
    
    
    
    
    
   /* protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException { 
        
            ArrayList<User> arrayOfFirstNames = UserDB.selectFirstNames();
            ArrayList<User> arrayOfLastNames = UserDB.selectLastNames();
            ArrayList testFirstNames = arrayOfFirstNames;
            ArrayList testLastNames = arrayOfLastNames;
            
            Gson gson = new Gson();
            String realFirstNames = gson.toJson(testFirstNames);
            out.println("{\"FirstNames\":"+realFirstNames+"}");
            
            HttpSession session = request.getSession();
            session.setAttribute("firstNames", arrayOfFirstNames);
            session.setAttribute("lastNames", arrayOfLastNames);
            
            String url = "/login/TO/testUpload.jsp";
        
            RequestDispatcher dispatcher =
                getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    } */
    
    
    
