package user;

import business.User;
import data.UserDB;
import java.io.IOException;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class RetrievePasswordServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("usernameemail");
        User user = UserDB.selectUserName(username);
        HttpSession session = request.getSession();
        String status = "failed";
        String userEmail = "";

        if (user != null) {
            status = "success";
            userEmail = user.getEmailAddress();
            fireEmail(userEmail, username, user.getFirstName(), user.getPassWord());
        }
        session.setAttribute("status", status);
        session.setAttribute("email", userEmail);

        String url = "/passwordSent.jsp";
        RequestDispatcher dispatcher =
                getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }

    private void fireEmail(String to, String username, String firstName, String password) {
        
        String subject = " Login Credentials for albertawargaminggt.com";
        String body="Hey "+firstName+",\n\n"+
                "Your login info is:\n\n" +
                "username: " + username + "\n" +
                "password: " + password +
                "\n\nThanks for using the site!\n-AWGT Administration";
        
        String from = "awgtcircuit@gmail.com";
        String pass = "awgtc123";
        Properties props = System.getProperties();
        String host = "smtp.gmail.com";
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.user", from);
        props.put("mail.smtp.password", pass);
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");

        Session session = Session.getDefaultInstance(props);
        MimeMessage message = new MimeMessage(session);

        try {
            message.setFrom(new InternetAddress(from));
            InternetAddress[] toAddress = new InternetAddress[1];
            toAddress[0] = new InternetAddress(to);
            message.addRecipient(Message.RecipientType.TO, toAddress[0]);
            message.setSubject(subject);
            message.setText(body);
            Transport transport = session.getTransport("smtp");
            transport.connect(host, from, pass);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
        } catch (AddressException ae) {
        } catch (MessagingException me) {
        }
    }
}