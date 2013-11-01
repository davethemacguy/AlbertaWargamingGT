package user;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import data.WPStrings;

public class UpdateWebsiteStringServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        String stringId = request.getParameter("stringId");
        String text = request.getParameter("text");
        WPStrings.update(stringId, text);

        response.sendRedirect("/AlbertaWargaming/login/indexProtected.jsp");
        

    }
}