package com.hotelweb;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RoomController")
public class RoomController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get the room type from the clicked button
        String roomType = request.getParameter("roomType");

        // Store the room type in the session for later retrieval
        request.getSession().setAttribute("selectedRoomType", roomType);

        // Determine the appropriate JSP page based on the room type
        String nextPage;
        switch (roomType) {
            case "Standard":
                nextPage = "room1-overview.jsp";
                break;
            case "Deluxe":
                nextPage = "room2-overview.jsp";
                break;
            case "Suite":
                nextPage = "room3-overview.jsp";
                break;
            case "StandardBookingRoom":
                nextPage = "bookingstep1.jsp";
                break;
            case "DeluxeBookingRoom":
                nextPage = "bookingstep1.jsp";
                break;
            case "SuiteBookingRoom":
                nextPage = "bookingstep1.jsp";
                break;

            default:
                nextPage = "404.jsp"; // You can handle other cases as needed
        }

        // Redirect to the next page
        response.sendRedirect(nextPage);
    }
}

