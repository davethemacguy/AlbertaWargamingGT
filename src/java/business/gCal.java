/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package business;

import com.google.api.client.googleapis.auth.oauth2.GoogleCredential;
import com.google.api.client.googleapis.services.CommonGoogleClientRequestInitializer;
import com.google.api.client.googleapis.services.GoogleClientRequestInitializer;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson.JacksonFactory;
import com.google.api.client.util.DateTime;
import com.google.api.services.calendar.Calendar;
import com.google.api.services.calendar.CalendarScopes;
import com.google.api.services.calendar.model.Event;
import com.google.api.services.calendar.model.EventAttendee;
import com.google.api.services.calendar.model.EventDateTime;
import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.security.GeneralSecurityException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import user.CreateEventServlet;

/**
 *
 * @author Stephen
 */
public class gCal {
    
    private static final HttpTransport HTTP_TRANSPORT = new NetHttpTransport();
    private static final JsonFactory JSON_FACTORY = new JacksonFactory();
    private static com.google.api.services.calendar.Calendar service;
    
    
    public static Calendar getCalendar(){
     try {
            List<String> scopes = new ArrayList<String>();
            scopes.add(CalendarScopes.CALENDAR);
            String apiKey = "AIzaSyDhCeMUTGfG4wUza_oBox5YztI7ns2nZjo";
            //URL url = getClass().getResource("privatekey.p12");
            GoogleCredential credential = new GoogleCredential.Builder()
                    .setJsonFactory(JSON_FACTORY)
                    .setTransport(new NetHttpTransport())
                    .setServiceAccountId("22756670478-9ulg6ftpvp2hs0tqb7uusisjaqe46it3@developer.gserviceaccount.com")
                    .setServiceAccountScopes(scopes)
                    .setServiceAccountPrivateKeyFromP12File(new File("C:\\Users\\Stephen\\Documents\\Projects\\NetBeansProjects\\AlbertaWargamingGT\\web\\includes\\8ce7f3da5e2e606f90420c551ebd3866c7013813-privatekey.p12"))
                    .build();
            GoogleClientRequestInitializer keyInitializer
                    = new CommonGoogleClientRequestInitializer(apiKey);
            service = new Calendar.Builder(HTTP_TRANSPORT, JSON_FACTORY, null)
                    .setHttpRequestInitializer(credential)
                    .setGoogleClientRequestInitializer(keyInitializer)
                    .build();
            
            
            
        } catch (IOException ex) {
            Logger.getLogger(CreateEventServlet.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex.toString());
        } catch (GeneralSecurityException ex) {
            Logger.getLogger(CreateEventServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
     return service;
    }
}
