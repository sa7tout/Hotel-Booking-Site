package com.hotelweb;

import java.io.IOException;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ContactServlet")
public class ContactServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Obtain form data
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String subject = request.getParameter("subject");
        String messageBody = request.getParameter("message");

        // Sender's Gmail credentials
        String senderEmail = "vagohotelpalms@gmail.com"; // Replace with your Gmail address
        String senderPassword = "mkflznjjdgtozsyh"; // Replace with your App Password


        // Recipient's email address
        String recipientEmail = "younesqassid@outlook.com"; // Replace with the recipient's email address

        // Setup mail server properties
        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");

        // Create a session with the Gmail server
        Session session = Session.getInstance(properties, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(senderEmail, senderPassword);
            }
        });

        try {
            // Create a MimeMessage object
            Message message = new MimeMessage(session);

            // Set sender and recipient addresses
            message.setFrom(new InternetAddress(senderEmail));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(senderEmail));

            // Set email subject and content
            message.setSubject(subject);
            message.setText("Name: " + name + "\nEmail: " + email + "\n\nMessage:\n" + messageBody);

            // Send the message
            Transport.send(message);

            // Redirect to a thank you page or display a success message
            response.sendRedirect("index.jsp"); // Replace with your thank you page
        } catch (MessagingException e) {
            e.printStackTrace();
            // Redirect to an error page or display an error message
            response.sendRedirect("404.jsp"); // Replace with your error page
        }
    }
}
