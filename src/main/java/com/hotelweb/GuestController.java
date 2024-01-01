package com.hotelweb;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "GuestController", urlPatterns = "/guestController")
public class GuestController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Existing code for handling GET requests
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Check if the user is logged in
        Boolean isLoggedIn = (Boolean) request.getSession().getAttribute("isLoggedIn");
        String userId = (String) request.getSession().getAttribute("userId");

        if (isLoggedIn != null && isLoggedIn) {
            // User is logged in
            // Inform in the JSP that the user is logged in
            request.setAttribute("isLoggedIn", true);
            request.getRequestDispatcher("your-jsp-file.jsp").forward(request, response);
        } else {
            // User is not logged in
            // Handle the case when the user is not logged in
            response.sendRedirect("index.jsp?error=notLoggedIn");
        }
    }
}
