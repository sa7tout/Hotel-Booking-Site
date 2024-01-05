package com.hotelweb;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import java.util.Properties;

public class ReceiptSender {

    public static void sendInvoiceEmail(Guest guest, Reservation reservation, Booking booking, String invoiceFilePath) {
        // Retrieve guest's email
        String guestEmail = guest.getEmail();

        // Sender's Gmail credentials
        String senderEmail = "vagohotelpalms@gmail.com"; // Replace with your Gmail address
        String senderPassword = "mkflznjjdgtozsyh"; // Replace with your App Password

        // Recipient's email address
        String recipientEmail = guestEmail;

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
            message.setSubject("Booking Invoice");

            // Create the email body text
            String emailBody = "Thank you for your reservation. Please find your invoice attached.";

            // Create a multipart message
            Multipart multipart = new MimeMultipart();

            // Create text part
            MimeBodyPart textPart = new MimeBodyPart();
            textPart.setText(emailBody);

            // Attach text part to multipart
            multipart.addBodyPart(textPart);

            // Attach PDF invoice
            MimeBodyPart pdfAttachment = new MimeBodyPart();
            pdfAttachment.attachFile(invoiceFilePath);  // Set the file path to your pre-generated PDF
            multipart.addBodyPart(pdfAttachment);

            // Set content to the message
            message.setContent(multipart);

            // Send the message
            Transport.send(message);

            System.out.println("Invoice email sent successfully");
        } catch (MessagingException e) {
            e.printStackTrace();
            System.err.println("Error sending invoice email");
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println("Error attaching PDF file");
        }
    }
}
