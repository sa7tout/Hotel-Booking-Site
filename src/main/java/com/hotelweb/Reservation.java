package com.hotelweb;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import static com.hotelweb.Reservation.ReservationGenerator.generateUniqueReservationReference;

public class Reservation {
    private int reservationId;
    private String referenceNumber;
    private int roomNumber;
    private Date checkinDate;
    private Date checkoutDate;
    private int guestId;
    private int numberOfGuests;
    private String reservationStatus;

    public Reservation(int reservationId, String referenceNumber, int roomNumber, Date checkinDate, Date checkoutDate,
                       int guestId, int numberOfGuests, String reservationStatus) {
        this.reservationId = reservationId;
        this.referenceNumber = referenceNumber;
        this.roomNumber = roomNumber;
        this.checkinDate = checkinDate;
        this.checkoutDate = checkoutDate;
        this.guestId = guestId;
        this.numberOfGuests = numberOfGuests;
        this.reservationStatus = reservationStatus;
    }

    public Reservation() {
        this.reservationId = 0; // Set a default value
        this.referenceNumber = generateUniqueReservationReference();
        // Initialize other properties as needed
    }

    public int getReservationId() {
        return reservationId;
    }

    public void setReservationId(int reservationId) {
        this.reservationId = reservationId;
    }

    public String getReferenceNumber() {
        return referenceNumber;
    }

    public void setReferenceNumber(String referenceNumber) {
        this.referenceNumber = referenceNumber;
    }

    public int getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(int roomNumber) {
        this.roomNumber = roomNumber;
    }

    public Date getCheckinDate() {
        return checkinDate;
    }

    public void setCheckinDate(Date checkinDate) {
        this.checkinDate = checkinDate;
    }

    public Date getCheckoutDate() {
        return checkoutDate;
    }

    public void setCheckoutDate(Date checkoutDate) {
        this.checkoutDate = checkoutDate;
    }

    public int getGuestId() {
        return guestId;
    }

    public void setGuestId(int guestId) {
        this.guestId = guestId;
    }

    public int getNumberOfGuests() {
        return numberOfGuests;
    }

    public void setNumberOfGuests(int numberOfGuests) {
        this.numberOfGuests = numberOfGuests;
    }

    public String getReservationStatus() {
        return reservationStatus;
    }

    public void setReservationStatus(String reservationStatus) {
        this.reservationStatus = reservationStatus;
    }

    public static class ReservationGenerator {
        private static int counter = 0;
        private static Map<String, Boolean> referenceNumberMap = new HashMap<>();

        public static String generateUniqueReservationReference() {
            // Use timestamp and a counter to generate a unique reference number
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
            String timestamp = dateFormat.format(new Date(System.currentTimeMillis()));
            String referenceNumber = "RES" + timestamp + counter;

            // Ensure uniqueness using the HashMap
            while (referenceNumberMap.containsKey(referenceNumber)) {
                counter++;
                referenceNumber = "RES" + timestamp + counter;
            }

            // Mark the generated reference number as used
            referenceNumberMap.put(referenceNumber, true);
            counter++;

            return referenceNumber;
        }
    }
}
