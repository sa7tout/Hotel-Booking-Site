package com.hotelweb;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CheckoutServlet")
public class CheckoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Booking booking = (Booking) session.getAttribute("booking");

        if (booking != null) {
            Connection connection = null;

            try {
                connection = DbConnection.getConnection();
                int roomNumber = booking.getRoomNumber();
                String userEmail = (String) session.getAttribute("userId");
                int guestId = DbConnection.getGuestIdByEmail(connection, userEmail);
                // Create a Guest object and add it to the session
                Guest guest = DbConnection.getGuestById(connection, guestId);
                session.setAttribute("guest", guest);
                // Create a Reservation object
                Reservation reservation = new Reservation();
                reservation.setReferenceNumber(Reservation.ReservationGenerator.generateUniqueReservationReference());
                reservation.setRoomNumber(roomNumber);
                reservation.setGuestId(guestId);
                reservation.setNumberOfGuests(Integer.parseInt(booking.getNumGuests()));

                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                try {
                    reservation.setCheckinDate(new Date(sdf.parse(booking.getCheckInDate()).getTime()));
                    reservation.setCheckoutDate(new Date(sdf.parse(booking.getCheckOutDate()).getTime()));
                } catch (ParseException e) {
                    e.printStackTrace();
                }

                reservation.setReservationStatus("Confirmed");

                // Add the reservation to the database
                DbConnection.addReservation(connection, reservation);

                // Add the reservation to the session
                session.setAttribute("reservation", reservation);

                // Redirect to a success page or display a success message
                response.getWriter().write("success");
            } finally {
                DbConnection.closeConnection();
            }
        } else {
            // Redirect to an error page or display an error message
            response.getWriter().write("error");
        }
    }

}
