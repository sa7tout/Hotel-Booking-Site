package com.hotelweb;

import com.itextpdf.io.font.FontConstants;
import com.itextpdf.io.image.ImageDataFactory;
import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.geom.PageSize;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Image;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.property.TextAlignment;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class InvoiceGenerator {

    public static void generateInvoicePDF(Guest guest, Reservation reservation, Booking booking, String folderPath, String fileName) throws IOException {
        String filePath = folderPath + "\\" + fileName;

        try (OutputStream fileOutputStream = new FileOutputStream(filePath)) {
            PdfWriter writer = new PdfWriter(fileOutputStream);
            PdfDocument pdf = new PdfDocument(writer);
            Document document = new Document(pdf, PageSize.A4);

            // Add hotel logo
            String logoPath = "C:\\Users\\sa7toute\\IdeaProjects\\hotelweb\\src\\main\\webapp\\assets\\images\\vagologo.png";
            Image logo = new Image(ImageDataFactory.create(logoPath));
            document.add(logo);

            // Add receipt title
            PdfFont titleFont = PdfFontFactory.createFont(FontConstants.HELVETICA_BOLD);
            Paragraph title = new Paragraph("Hotel Booking Receipt")
                    .setFont(titleFont)
                    .setFontSize(20)
                    .setTextAlignment(TextAlignment.CENTER);
            document.add(title);

            // Add content to the PDF
            document.add(new Paragraph("Invoice Content:")
                    .setTextAlignment(TextAlignment.LEFT));
            document.add(new Paragraph("Guest Information:")
                    .setTextAlignment(TextAlignment.LEFT)
                    .add("First Name: " + guest.getFirstName() + "\n")
                    .add("Last Name: " + guest.getLastName() + "\n")
                    .add("Email: " + guest.getEmail() + "\n"));
            document.add(new Paragraph("Reservation Details:")
                    .setTextAlignment(TextAlignment.LEFT)
                    .add("Reservation No.: " + reservation.getReferenceNumber() + "\n")
                    .add("Order Date: " + getCurrentDateTime() + "\n")); // Use the current date and time
            document.add(new Paragraph("Payment Details:")
                    .setTextAlignment(TextAlignment.LEFT)
                    .add("Transaction Time: " + getCurrentDateTime() + "\n") // Use the current date and time
                    .add("Amount: $" + booking.getTotalPrice() + "\n")
                    .add("Paypal: guest.paypal@email.com\n")
                    .add("Reservation Type: " + booking.getSelectedRoomType() + "\n"));

            // Close the document
            document.close();
        }
    }

    private static String getCurrentDateTime() {
        LocalDateTime currentDateTime = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        return currentDateTime.format(formatter);
    }
}
