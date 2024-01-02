package com.hotelweb;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UserTokenDAO {

    private Connection connection;

    public UserTokenDAO(Connection connection) {
        this.connection = connection;
    }

    // Method to associate the token with the user in the database
    public void associateTokenWithUser(String userId, String rememberMeToken) throws SQLException {
        // You should have a table in the database to store user tokens (e.g., user_tokens)
        // Assuming the table has columns user_id and remember_me_token

        String query = "INSERT INTO user_tokens (user_id, remember_me_token) VALUES (?, ?)";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, userId);
            preparedStatement.setString(2, rememberMeToken);

            preparedStatement.executeUpdate();
        }
    }
}
