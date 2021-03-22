package controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import static java.lang.Class.forName;

public class DatabaseConnection {

    String url = "jdbc:sqlite:/Users/shreya/flightManagement.db";

    Connection connection = null;

    public DatabaseConnection() {
        try {
            Class.forName("org.sqlite.JDBC");
            connection = DriverManager.getConnection(url);
            System.out.println("Connected");

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public PreparedStatement getPrepareStatement(String query) throws SQLException{
        return connection.prepareStatement(query);
    }
}