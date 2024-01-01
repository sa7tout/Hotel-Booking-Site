package com.hotelweb;

import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class DbConnection {

    private static Connection connection;

    private DbConnection() {
        // Private constructor to prevent instantiation
    }

    public static Connection getConnection() {
        if (connection == null) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/vagohotel";
                String username = "root";
                String password = "";
                connection = DriverManager.getConnection(url, username, password);
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
            }
        }
        return connection;
    }

    public static boolean emailAlreadyExists(Connection connection, String email) {
        String query = "SELECT COUNT(*) AS count FROM guests WHERE email = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, email);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    int count = resultSet.getInt("count");
                    return count > 0;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static void addGuest(Connection connection, Guest guest) {
        String query = "INSERT INTO guests (first_name, last_name, email, password) VALUES (?, ?, ?, ?)";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, guest.getFirstName());
            preparedStatement.setString(2, guest.getLastName());
            preparedStatement.setString(3, guest.getEmail());
            preparedStatement.setString(4, guest.getPassword());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static List<Guest> getAllGuests(Connection connection) {
        List<Guest> guestList = new ArrayList<>();
        String query = "SELECT * FROM guests";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    int guestID = resultSet.getInt("guest_id");
                    String firstName = resultSet.getString("first_name");
                    String lastName = resultSet.getString("last_name");
                    String email = resultSet.getString("email");
                    String password = resultSet.getString("password");

                    Guest guest = new Guest(firstName, lastName, email, password);
                    guestList.add(guest);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return guestList;
    }

    public static void closeConnection() {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                connection = null;
            }
        }
    }
}
