package com.hotelweb;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.UUID;
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
        boolean rememberMe = request.getParameter("rememberMe") != null; // Check if Remember Me is selected

        // Your authentication logic here
        if (authenticateUser(userId, password)) {
            // Successful login
            // Set the "isLoggedIn" attribute in the session
            HttpSession session = request.getSession();
            session.setAttribute("isLoggedIn", true);

            // Store additional user information in the session
            session.setAttribute("userId", userId); // You can add more user-related attributes as needed


            // Check if Remember Me is selected
            if (rememberMe) {
                // Generate a unique token
                String rememberMeToken = generateRememberMeToken();


                // Set a persistent cookie with the token
                Cookie rememberMeCookie = new Cookie("rememberMeToken", rememberMeToken);
                rememberMeCookie.setMaxAge(30 * 24 * 60 * 60); // 30 days expiration
                response.addCookie(rememberMeCookie);


                // Associate the token with the user in the database
                associateTokenWithUser(userId, rememberMeToken, response);

            }

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
                            boolean isAuthenticated = storedPassword.equals(password);


                            return isAuthenticated;
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
    private String generateRememberMeToken() {
        // Using the java.util.UUID class to generate a unique token
        return UUID.randomUUID().toString();
    }

    // Method to associate the token with the user in the database
    private void associateTokenWithUser(String userId, String rememberMeToken, HttpServletResponse response) {
        try {
            Connection connection = DbConnection.getConnection();

            // Assuming there's a UserTokenDAO class to handle database operations
            UserTokenDAO userTokenDAO = new UserTokenDAO(connection);

            // Store the association in the database
            userTokenDAO.associateTokenWithUser(userId, rememberMeToken);

            // Set a persistent cookie with the token
            Cookie rememberMeCookie = new Cookie("rememberMeToken", rememberMeToken);
            rememberMeCookie.setMaxAge(30 * 24 * 60 * 60); // 30 days expiration
            response.addCookie(rememberMeCookie);

        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception according to your needs
        } finally {
            DbConnection.closeConnection();
        }
    }





}



