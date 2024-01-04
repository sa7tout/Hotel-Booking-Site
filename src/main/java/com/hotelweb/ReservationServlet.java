package com.hotelweb;

import java.io.IOException;
import java.sql.Connection;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/ReservationServlet")
public class ReservationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Retrieve booking details from the request parameters
        String selectedRoomType = request.getParameter("selectedRoomType");
        String checkInDate = request.getParameter("checkInDate");
        String checkOutDate = request.getParameter("checkOutDate");
        String numGuests = request.getParameter("numGuests");

        // Create a Booking object
        Booking booking = new Booking(selectedRoomType, checkInDate, checkOutDate, numGuests);

        // Find an available room for the specified room type and dates
        Room availableRoom = findAvailableRoom(selectedRoomType, checkInDate, checkOutDate);

        if (availableRoom != null) {
            booking.setRoomNumber(availableRoom.getRoomNumber());
            HttpSession session = request.getSession();
            session.setAttribute("booking", booking);

            response.getWriter().write("success");
        } else {
            // No available room found, handle accordingly (redirect to an error page or display a message)
            response.getWriter().write("noAvailableRoom");
        }
    }

    private Room findAvailableRoom(String selectedRoomType, String checkInDate, String checkOutDate) {
        Connection connection = null;
        try {
            connection = DbConnection.getConnection();
            List<Room> rooms = DbConnection.getAllRooms(connection);

            for (Room room : rooms) {
                if (room.getRoomType().equals(selectedRoomType)) {
                    if (room.getAvailabilityStatus().equals("Available") &&
                            isRoomAvailable(room.getRoomNumber(), checkInDate, checkOutDate)) {
                        return room;
                    }
                }
            }
        } finally {
            DbConnection.closeConnection();
        }
        return null; // No available room found
    }


    private boolean isRoomAvailable(int roomNumber, String checkInDate, String checkOutDate) {
        Connection connection = null;
        try {
            connection = DbConnection.getConnection();
            List<Reservation> reservations = DbConnection.getReservationsByRoom(connection, roomNumber);

            for (Reservation reservation : reservations) {
                if (isOverlap(reservation.getCheckinDate(), reservation.getCheckoutDate(), checkInDate, checkOutDate)) {
                    return false; // Room is not available during the specified dates
                }
            }
        } finally {
            DbConnection.closeConnection();
        }
        return true; // Room is available
    }

    private boolean isOverlap(Date start1, Date end1, String start2, String end2) {
        // Convert String dates to Date objects
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date startDate2 = null;
        Date endDate2 = null;
        try {
            startDate2 = sdf.parse(start2);
            endDate2 = sdf.parse(end2);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        // Check for date overlap
        return !(end1.before(startDate2) || start1.after(endDate2));
    }
}



