package domain;

import controller.DatabaseConnection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class FlightDetails {

    int d_id;
    String name;
    String email;
    Date date;
    String phone;
    String destination;
    String paymentStatus;
    //while converting price from dollars or adding up any discount there can be some decimal value
    double price;

    public int getD_id() {
        return d_id;
    }

    public void setD_id(int d_id) {
        this.d_id = d_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(String paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public static List<FlightDetails> getFlights(){
        List<FlightDetails> flights=new ArrayList<FlightDetails>();
        try {
            String query="Select * from flightDetails" ;
            PreparedStatement pstm =new DatabaseConnection().getPrepareStatement(query);
            ResultSet rs=pstm.executeQuery();

            while (rs.next()){
                FlightDetails flight=new FlightDetails();
                flight.setD_id(rs.getInt("d_id"));
                flight.setName(rs.getString("name"));
                flight.setEmail(rs.getString("email"));
                flight.setPhone(rs.getString("phone"));
                flight.setPaymentStatus(rs.getString("paymentStatus"));
                flight.setPrice(rs.getDouble("price"));
                flight.setDestination(rs.getString("destination"));
                flight.setDate(rs.getDate("date"));
                flights.add(flight);
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        return flights;
    }

    public static List<FlightDetails> getFlights(String paymentStatus){
        List<FlightDetails> flights=new ArrayList<FlightDetails>();
        try {
            String query="Select * from flightDetails where paymentStatus =?" ;
            PreparedStatement pstm =new DatabaseConnection().getPrepareStatement(query);
            pstm.setString(1,paymentStatus);
            ResultSet rs=pstm.executeQuery();

            while (rs.next()){
                FlightDetails flight=new FlightDetails();
                flight.setD_id(rs.getInt("d_id"));
                flight.setName(rs.getString("name"));
                flight.setEmail(rs.getString("email"));
                flight.setPhone(rs.getString("phone"));
                flight.setPaymentStatus(rs.getString("paymentStatus"));
                flight.setPrice(rs.getDouble("price"));
                flight.setDestination(rs.getString("destination"));
                flight.setDate(rs.getDate("date"));
                flights.add(flight);
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }
        return flights;
    }

    public static void addFlight(String name, String email, String phone, String destination, double price, String paymentStatus, Date date)
    {
        String query="Insert into flightDetails(name, phone, email, destination, price, paymentStatus, date)"+"values(?,?,?,?,?,?,?)";
        try
        {

            PreparedStatement pstm =new DatabaseConnection().getPrepareStatement(query);
            pstm.setString(1,name);
            pstm.setString(2,phone);
            pstm.setString(3,email);
            pstm.setString(4, destination);
            pstm.setDouble(5, price);
            pstm.setString(6, paymentStatus);
            pstm.setDate(7, new java.sql.Date( date.getTime()));
            pstm.executeUpdate();
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }

    }

    public static void deleteFlightDets(Integer id)
    {
        String query="Delete from flightDetails where d_id= ?";
        try
        {
            PreparedStatement pstm =new DatabaseConnection().getPrepareStatement(query);
            pstm.setInt(1,id);
            pstm.execute();
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }

    }

    public static FlightDetails getFlight(Integer id)
    {
        FlightDetails details =null;
        String query="Select * from flightDetails where d_id =?";
        try
        {

            PreparedStatement pstm =new DatabaseConnection().getPrepareStatement(query);
            pstm.setInt(1,id);
            ResultSet rs=pstm.executeQuery();

            while (rs.next()){
                details=new FlightDetails();
                details.setD_id(rs.getInt("d_id"));
                details.setName(rs.getString("name"));
                details.setEmail(rs.getString("email"));
                details.setPhone(rs.getString("phone"));
                details.setPaymentStatus(rs.getString("paymentStatus"));
                details.setPrice(rs.getDouble("price"));
                details.setDestination(rs.getString("destination"));
                details.setDate(rs.getDate("date"));
            }
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }
        return details;
    }

    public static void editFlight(int id, String name, String email, String phone, String destination, double price, String paymentStatus, Date date)
    {
        String query="Update flightDetails set name=? ,email=? , phone=?, destination=?, price=?, paymentStatus=? ,date=? where d_id=?";
        try{
            PreparedStatement pstm = new DatabaseConnection().getPrepareStatement(query);
            pstm.setString(1,name);
            pstm.setString(2,phone);
            pstm.setString(3,email);
            pstm.setString(4, destination);
            pstm.setDouble(5, price);
            pstm.setString(6, paymentStatus);
            pstm.setDate(7, new java.sql.Date( date.getTime()));
            pstm.setInt(8, id);
            pstm.execute();

        }
        catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void updateStatus(Integer id, String paymentStatus)
    {
        String query="Update flightDetails set paymentStatus=? where d_id= ?";
        try
        {
            PreparedStatement pstm =new DatabaseConnection().getPrepareStatement(query);
            pstm.setString(1,paymentStatus);
            pstm.setInt(2,id);
            pstm.execute();
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }

    }
}
