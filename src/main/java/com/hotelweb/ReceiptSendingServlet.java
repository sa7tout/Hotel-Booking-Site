package com.hotelweb;

import org.xhtmlrenderer.pdf.ITextRenderer;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Properties;

@WebServlet("/ReceiptSendingServlet")
public class ReceiptSendingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Retrieve guest's email from the session
        HttpSession session = request.getSession();
        String guestEmail = (String) session.getAttribute("userId");

        // Generate receipt content from your JSP file
        String jspContent = generateReceiptContent();

        // Generate PDF from JSP content
        byte[] pdfBytes = generateReceiptPDF(jspContent);

        // Sender's Gmail credentials
        String senderEmail = "vagohotelpalms@gmail.com"; // Replace with your Gmail address
        String senderPassword = "mkflznjjdgtozsyh"; // Replace with your App Password

        // Recipient's email address
        String recipientEmail = guestEmail; // Use the guest's email from the session

        // Setup mail server properties
        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");

        // Create a session with the Gmail server
        Session mailSession = Session.getInstance(properties, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(senderEmail, senderPassword);
            }
        });

        try {
            // Create a MimeMessage object
            Message message = new MimeMessage(mailSession);

            // Set sender and recipient addresses
            message.setFrom(new InternetAddress(senderEmail));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(recipientEmail));

            // Set email subject
            message.setSubject("Your Receipt");

            // Create the email body text
            String emailBody = "Thank you for your reservation. Please find your receipt attached.";

            // Create a multipart message
            Multipart multipart = new MimeMultipart();

            // Create text part
            MimeBodyPart textPart = new MimeBodyPart();
            textPart.setText(emailBody);

            // Attach text part to multipart
            multipart.addBodyPart(textPart);

            // Create PDF attachment
            MimeBodyPart pdfAttachment = new MimeBodyPart();
            pdfAttachment.setContent(pdfBytes, "application/pdf");
            pdfAttachment.setFileName("Receipt.pdf");

            // Attach PDF to multipart
            multipart.addBodyPart(pdfAttachment);

            // Set content to the message
            message.setContent(multipart);

            // Send the message
            Transport.send(message);


        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    // Method to generate receipt content from your JSP file
    private String generateReceiptContent() {
        // Implement your logic to read and generate content from the JSP file
        // For simplicity, let's assume you have the content as a string
        return "This is the receipt content from your JSP file.";
    }

    // Method to generate PDF from HTML content using Flying Saucer and iText
    private byte[] generateReceiptPDF(String jspContent) throws IOException {
        // Create a new document
        ITextRenderer renderer = new ITextRenderer();
        ByteArrayOutputStream pdfOutputStream = new ByteArrayOutputStream();

        try {
            // Set HTML content for rendering
            renderer.setDocumentFromString(jspContent);

            // You can set the base URL if your HTML references external resources (e.g., images, stylesheets)
            // renderer.getSharedContext().setBaseURL("http://your-base-url.com");

            // Layout and render the PDF
            renderer.layout();
            renderer.createPDF(pdfOutputStream);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close resources
            pdfOutputStream.close();
        }

        return pdfOutputStream.toByteArray();
    }
}
