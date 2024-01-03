package com.hotelweb;

import java.io.IOException;
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

        // Store Booking object in the session
        HttpSession session = request.getSession();
        session.setAttribute("booking", booking);



    }
}

