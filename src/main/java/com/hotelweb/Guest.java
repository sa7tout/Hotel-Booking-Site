package com.hotelweb;

import com.hotelweb.DbConnection;

import java.util.List;

public class Guest {

    private int guestID;
    private String firstName;
    private String lastName;
    private String email;
    private String password;

    public Guest(String firstName, String lastName, String email, String password) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
    }

    public int getGuestID() {
        return guestID;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public static Guest getGuestById(int guestId, List<Guest> allGuests) {
        for (Guest guest : allGuests) {
            if (guest.getGuestID() == guestId) {
                return guest;
            }
        }
        return null; // Guest with the given ID not found
    }

    @Override
    public String toString() {
        return getFirstName() + " " + getLastName();
    }


}
