package com.hotelweb;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "LoginServlet", urlPatterns = "/loginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userId = request.getParameter("loginUserId").trim();
        String password = request.getParameter("loginPassword").trim();

        // Your authentication logic here
        if (authenticateUser(userId, password)) {
            // Successful login
            // Set the "isLoggedIn" attribute in the session
            HttpSession session = request.getSession();
            session.setAttribute("isLoggedIn", true);

            // Store additional user information in the session
            session.setAttribute("userId", userId); // You can add more user-related attributes as needed

            response.getWriter().write("success");
        } else {
            // Failed login
            response.getWriter().write("failure");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirect to the login page if accessed via GET
        response.sendRedirect("index.jsp");
    }

    // Your authentication logic goes here
    private boolean authenticateUser(String userId, String password) {
        try {
            Connection connection = DbConnection.getConnection();

            // Check if authentication is successful
            if (DbConnection.emailAlreadyExists(connection, userId)) {
                // Now, check if the provided password matches the one in the database
                String query = "SELECT password FROM guests WHERE email = ?";
                try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                    preparedStatement.setString(1, userId);
                    try (ResultSet resultSet = preparedStatement.executeQuery()) {
                        if (resultSet.next()) {
                            String storedPassword = resultSet.getString("password");
                            // Return true if the password matches
                            return storedPassword.equals(password);
                        }
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Print the stack trace for debugging
        } finally {
            DbConnection.closeConnection();
        }

        // Return false if authentication fails
        return false;
    }



}



