package user;

import business.Encryption;
import business.ResetPassword;
import business.User;
import data.ResetPasswordDB;
import data.UserDB;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
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
            throws ServletException, IOException, UnsupportedEncodingException {
        String email = request.getParameter("email");
        User user = UserDB.selectUserByEmail(email);
        HttpSession session = request.getSession();
        String status = "failed";
        if (user != null) {
            status = "success";
            try {
                fireEmail(email, user.getUserName(), user.getFirstName(), user.getPassWord(), request);
            } catch (NoSuchAlgorithmException ex) {
                Logger.getLogger(RetrievePasswordServlet.class.getName()).log(Level.SEVERE, null, ex);
            } catch (Exception ex) {
                Logger.getLogger(RetrievePasswordServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        session.setAttribute("status", status);
        session.setAttribute("email", email);

        String url = "/passwordSent.jsp";
        RequestDispatcher dispatcher
                = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }

    private void fireEmail(String to, String username, String firstName, String password, HttpServletRequest request) throws NoSuchAlgorithmException, UnsupportedEncodingException, Exception {

        Encryption crypto = new Encryption();
        long time = System.currentTimeMillis();
        crypto.setPassWordHash(1000, password, time);

        String from = "passwordreset@albertawargaminggt.com";
        String subject = " Login Credentials for albertawargaminggt.com";
        String body = "Hey " + firstName + ",\n\n"
                + "Your username is: " + username + "\n\n"
                + "Click the link below to reset your password:\n\n"
                + "http://www.albertawargaminggt.com"
                + request.getContextPath() + "/ResetPassword?ID=" + crypto.getPassWordHash()
                + "&t=" + time + "&u=" + username
                + "\n\nThanks for using the site!\n-AWGT Administration";
        
        sendMail(to, from, subject, body);

        ResetPassword rp = new ResetPassword();
        crypto.setPassWordHash(1000, crypto.getPassWordHash(), time);
        rp.setID(crypto.getPassWordHash());
        rp.setTime(time);
        rp.setUserName(username);
        ResetPasswordDB.add(rp);
    }

    public static void sendMail(String to, String from, String subject,
            String content) throws Exception {

        System.out.println("testing");
        String host = "s98.eatj.com";
        //String host = "localhost"; 
        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        SMTPAuthenticator auth = new SMTPAuthenticator();

        Session session = Session.getDefaultInstance(props, auth);

        Message msg = new MimeMessage(session);
        msg.setFrom(new InternetAddress(from));
        InternetAddress[] address = {new InternetAddress(to)};
        msg.setRecipients(Message.RecipientType.TO, address);
        msg.setSubject(subject);
        msg.setSentDate(new Date());
        msg.setText(content);

        Transport.send(msg);
    }

    private static class SMTPAuthenticator extends javax.mail.Authenticator {

        @Override
        public PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication("passwordreset@albertawargaminggt.com", "Password1234!");
        }
    }

}
