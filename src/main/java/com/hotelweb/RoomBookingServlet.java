package com.hotelweb;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/RoomBookingServlet")
public class RoomBookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get the parameters from the AJAX request
        String checkInDate = request.getParameter("checkInDate");
        String checkOutDate = request.getParameter("checkOutDate");
        String numGuests = request.getParameter("numGuests");

        // Store the parameters in the session for later retrieval
        HttpSession session = request.getSession();
        session.setAttribute("checkInDate", checkInDate);
        session.setAttribute("checkOutDate", checkOutDate);
        session.setAttribute("numGuests", numGuests);

        // Send a success response to the AJAX request
        response.getWriter().write("Success");
    }
}
