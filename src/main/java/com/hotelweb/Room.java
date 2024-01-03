package com.hotelweb;

import java.sql.Date;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

public class Room {
    private int roomNumber;
    private String roomType;
    private int capacity;
    private String amenities;
    private String availabilityStatus;
    private double pricePerNight;
    private Integer guestId;

    public Room(int roomNumber, String roomType, int capacity, List<String> amenities,
                String availabilityStatus, double pricePerNight, Integer guestId) {
        this.roomNumber = roomNumber;
        this.roomType = roomType;
        this.capacity = capacity;
        this.amenities = String.join(", ", amenities);
        this.availabilityStatus = availabilityStatus;
        this.pricePerNight = pricePerNight;
        this.guestId = guestId;
    }

    public int getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(int roomNumber) {
        this.roomNumber = roomNumber;
    }

    public String getRoomType() {
        return roomType;
    }

    public void setRoomType(String roomType) {
        this.roomType = roomType;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public String getAmenities() {
        return amenities;
    }

    public void setAmenities(String amenities) {
        this.amenities = amenities;
    }

    public String getAvailabilityStatus() {
        return availabilityStatus;
    }

    public void setAvailabilityStatus(String availabilityStatus) {
        this.availabilityStatus = availabilityStatus;
    }

    public double getPricePerNight() {
        return pricePerNight;
    }

    public void setPricePerNight(double pricePerNight) {
        this.pricePerNight = pricePerNight;
    }

    public Integer getGuestId() {
        return guestId;
    }

    public void setGuestId(Integer guestId) {
        this.guestId = (guestId != null) ? guestId : 0;
    }


}
