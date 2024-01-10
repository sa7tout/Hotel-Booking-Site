package com.hotelweb;
import java.sql.Connection;
import java.sql.Date;
import java.util.List;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

public class RoomStatusUpdater {

    public static void scheduleRoomStatusUpdateJob() {
        ScheduledExecutorService scheduler = Executors.newScheduledThreadPool(1);

        // Schedule the job to run every day at a specific time (e.g., midnight)
        scheduler.scheduleAtFixedRate(RoomStatusUpdater::updateRoomStatus, calculateInitialDelay(), 1, TimeUnit.DAYS);

        // Simulate a manual trigger of the updateRoomStatus method
        //RoomStatusUpdater.updateRoomStatus();
    }

    private static long calculateInitialDelay() {
        // Calculate the initial delay until the next midnight
        long now = System.currentTimeMillis();
        long oneDayInMillis = TimeUnit.DAYS.toMillis(1);
        long midnight = now - (now % oneDayInMillis) + oneDayInMillis;
        return midnight - now;
    }

    private static void updateRoomStatus() {
        Connection connection = null;

        try {
            connection = DbConnection.getConnection();

            // Retrieve all reservations with check-in dates today
            List<Reservation> reservations = DbConnection.getReservationsByCheckinDate(connection, new Date(System.currentTimeMillis()));

            // Update room statuses based on reservations
            for (Reservation reservation : reservations) {
                int roomNumber = reservation.getRoomNumber();
                // Set room status to "Booked" for the reservation period
                DbConnection.updateRoomAvailabilityStatus(connection, roomNumber, "Booked");
            }

            // Retrieve all reservations with check-out dates today
            List<Reservation> checkOutReservations = DbConnection.getReservationsByCheckoutDate(connection, new Date(System.currentTimeMillis()));

            // Update room statuses based on check-out reservations
            for (Reservation reservation : checkOutReservations) {
                int roomNumber = reservation.getRoomNumber();
                // Set room status to "Available" after check-out
                DbConnection.updateRoomAvailabilityStatus(connection, roomNumber, "Available");
            }

            // Optionally, you can log or print a message indicating that the room statuses have been updated.
            System.out.println("Room statuses updated successfully.");
        } finally {
            DbConnection.closeConnection();
        }
    }
}
