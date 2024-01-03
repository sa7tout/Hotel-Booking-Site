package com.hotelweb;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.TimeUnit;

public class Booking {
    private String selectedRoomType;
    private String checkInDate;
    private String checkOutDate;
    private String numGuests;
    private long nights;
    private double pricePerNight;
    private double totalPrice;
    private double totalPriceWithTax;

    private String userId;

    // Constructor
    public Booking(String selectedRoomType, String checkInDate, String checkOutDate, String numGuests) {
        this.selectedRoomType = selectedRoomType;
        this.checkInDate = checkInDate;
        this.checkOutDate = checkOutDate;
        this.numGuests = numGuests;
        calculateNights();
        setPricePerNight();
        calculateTotalPrice();
        calculateTotalPriceWithTax();
    }

    // Getters and Setters

    public String getSelectedRoomType() {
        return selectedRoomType;
    }

    public void setSelectedRoomType(String selectedRoomType) {
        this.selectedRoomType = selectedRoomType;
    }

    public String getCheckInDate() {
        return checkInDate;
    }

    public void setCheckInDate(String checkInDate) {
        this.checkInDate = checkInDate;
    }

    public String getCheckOutDate() {
        return checkOutDate;
    }

    public void setCheckOutDate(String checkOutDate) {
        this.checkOutDate = checkOutDate;
    }

    public String getNumGuests() {
        return numGuests;
    }

    public void setNumGuests(String numGuests) {
        this.numGuests = numGuests;
    }

    public long getNights() {
        return nights;
    }

    public double getPricePerNight() {
        return pricePerNight;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public double getTotalPriceWithTax() {
        return totalPriceWithTax;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    // Additional methods
    private void calculateNights() {
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date startDate = sdf.parse(checkInDate);
            Date endDate = sdf.parse(checkOutDate);
            nights = TimeUnit.DAYS.convert(endDate.getTime() - startDate.getTime(), TimeUnit.MILLISECONDS);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void setPricePerNight() {
        switch (selectedRoomType) {
            case "StandardBookingRoom":
            case "Standard":
                pricePerNight = 100;
                break;
            case "DeluxeBookingRoom":
            case "Deluxe":
                pricePerNight = 150;
                break;
            case "SuiteBookingRoom":
            case "Suite":
                pricePerNight = 200;
                break;
            default:
                pricePerNight = 0; // Default price
                break;
        }
    }

    private void calculateTotalPrice() {
        totalPrice = pricePerNight * Integer.parseInt(numGuests) * nights;
    }

    private void calculateTotalPriceWithTax() {
        totalPriceWithTax = totalPrice * 1.07;
    }
}
