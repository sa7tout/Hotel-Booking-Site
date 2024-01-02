package com.hotelweb;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "RegisterServlet", urlPatterns = "/createaccount")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String first_name = request.getParameter("first_name");
        String last_name = request.getParameter("last_name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        PrintWriter out = response.getWriter();

        try {
            Connection con = DbConnection.getConnection();

            // Check if email already exists
            if (DbConnection.emailAlreadyExists(con, email)) {
                out.print("Email already exists. Please choose another.");
                return;
            }

            // Proceed with the database operation
            PreparedStatement pst = con.prepareStatement("INSERT INTO guests(first_name, last_name, email, password) VALUES (?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS);

            pst.setString(1, first_name);
            pst.setString(2, last_name);
            pst.setString(3, email);
            pst.setString(4, password);

            int rowCount = pst.executeUpdate();

            if (rowCount > 0) {

                out.print("success");
            } else {
                // Debugging statement
                System.out.println("Failed to add guest for email: " + email);

                out.print("Failed to create an account. Please try again.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Exception: " + e.getMessage());
            out.print("An error occurred during registration. Please try again.");
        } finally {
            DbConnection.closeConnection();
            out.close();
        }
    }


}
