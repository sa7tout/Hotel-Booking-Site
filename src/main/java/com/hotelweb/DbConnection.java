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

    // Add this method to your DbConnection class
    public static Guest getGuestById(Connection connection, int guestId) {
        String query = "SELECT * FROM guests WHERE guest_id = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, guestId);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    String firstName = resultSet.getString("first_name");
                    String lastName = resultSet.getString("last_name");
                    String email = resultSet.getString("email");
                    String password = resultSet.getString("password");

                    return new Guest(firstName, lastName, email, password);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null; // Return null or handle appropriately if the guest is not found
    }


    public static int getGuestIdByEmail(Connection connection, String email) {
        String query = "SELECT guest_id FROM guests WHERE email = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, email);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    return resultSet.getInt("guest_id");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0; // Return 0 or handle appropriately if the guest ID is not found
    }

    public static List<Room> getAllRooms(Connection connection) {
        List<Room> roomList = new ArrayList<>();
        String query = "SELECT * FROM rooms";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    int roomNumber = resultSet.getInt("room_number");
                    String roomType = resultSet.getString("room_type");
                    int capacity = resultSet.getInt("capacity");
                    String amenitiesString = resultSet.getString("amenities");
                    List<String> amenities = Arrays.asList(amenitiesString.split(","));
                    String availabilityStatus = resultSet.getString("availability_status");
                    double pricePerNight = resultSet.getDouble("price_per_night");
                    int guestId = resultSet.getInt("guest_id");

                    Room room = new Room(roomNumber, roomType, capacity, amenities, availabilityStatus, pricePerNight, guestId);
                    roomList.add(room);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return roomList;
    }

    public static List<Reservation> getReservationsByRoom(Connection connection, int roomNumber) {
        List<Reservation> reservationList = new ArrayList<>();
        String query = "SELECT * FROM reservations WHERE room_number = ?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, roomNumber);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    int reservationId = resultSet.getInt("reservation_id");
                    String referenceNumber = resultSet.getString("reference_number");
                    int guestId = resultSet.getInt("guest_id");
                    int numberOfGuests = resultSet.getInt("number_of_guests");
                    Date checkinDate = resultSet.getDate("checkin_date");
                    Date checkoutDate = resultSet.getDate("checkout_date");
                    String reservationStatus = resultSet.getString("reservation_status");

                    Reservation reservation = new Reservation();
                    reservation.setReservationId(reservationId);
                    reservation.setReferenceNumber(referenceNumber);
                    reservation.setRoomNumber(roomNumber);
                    reservation.setGuestId(guestId);
                    reservation.setNumberOfGuests(numberOfGuests);
                    reservation.setCheckinDate(checkinDate);
                    reservation.setCheckoutDate(checkoutDate);
                    reservation.setReservationStatus(reservationStatus);

                    reservationList.add(reservation);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return reservationList;
    }

    public static List<Reservation> getAllReservations(Connection connection) {
        List<Reservation> reservationList = new ArrayList<>();
        String query = "SELECT * FROM reservations";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    int reservationId = resultSet.getInt("reservation_id");
                    String referenceNumber = resultSet.getString("reference_number");
                    int roomNumber = resultSet.getInt("room_number");
                    Date checkinDate = resultSet.getDate("checkin_date");
                    Date checkoutDate = resultSet.getDate("checkout_date");
                    int guestId = resultSet.getInt("guest_id");
                    int numberOfGuests = resultSet.getInt("number_of_guests");
                    String reservationStatus = resultSet.getString("reservation_status");

                    Reservation reservation = new Reservation(reservationId, referenceNumber, roomNumber, checkinDate,
                            checkoutDate, guestId, numberOfGuests, reservationStatus);
                    reservationList.add(reservation);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return reservationList;
    }

    public static void addReservation(Connection connection, Reservation reservation) {
        String query = "INSERT INTO reservations (reference_number, room_number, checkin_date, checkout_date, guest_id, number_of_guests, reservation_status) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
            preparedStatement.setString(1, reservation.getReferenceNumber());
            preparedStatement.setInt(2, reservation.getRoomNumber());
            preparedStatement.setDate(3, reservation.getCheckinDate());
            preparedStatement.setDate(4, reservation.getCheckoutDate());
            preparedStatement.setInt(5, reservation.getGuestId());
            preparedStatement.setInt(6, reservation.getNumberOfGuests());
            preparedStatement.setString(7, reservation.getReservationStatus());

            preparedStatement.executeUpdate();

            // Retrieve the auto-generated key (reservation ID)
            try (ResultSet generatedKeys = preparedStatement.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    reservation.setReservationId(generatedKeys.getInt(1));
                } else {
                    throw new SQLException("Failed to retrieve auto-generated key for reservation");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void updateReservation(Connection connection, Reservation reservation) {
        String updateQuery = "UPDATE reservations SET reference_number=?, room_number=?, checkin_date=?, " +
                "checkout_date=?, guest_id=?, number_of_guests=?, reservation_status=? WHERE reservation_id=?";

        try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
            preparedStatement.setString(1, reservation.getReferenceNumber());
            preparedStatement.setInt(2, reservation.getRoomNumber());
            preparedStatement.setDate(3, reservation.getCheckinDate());
            preparedStatement.setDate(4, reservation.getCheckoutDate());
            preparedStatement.setInt(5, reservation.getGuestId());
            preparedStatement.setInt(6, reservation.getNumberOfGuests());
            preparedStatement.setString(7, reservation.getReservationStatus());
            preparedStatement.setInt(8, reservation.getReservationId());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
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
