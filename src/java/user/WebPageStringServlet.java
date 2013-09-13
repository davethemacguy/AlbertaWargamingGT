package user;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import data.WPStrings;

public class WebPageStringServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        String stringId = request.getParameter("stringId");
        String text = WPStrings.selectString(stringId);
        session.setAttribute("text", text);
              
    }
}