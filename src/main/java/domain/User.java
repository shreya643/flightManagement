package domain;

import controller.DatabaseConnection;

import javax.xml.bind.DatatypeConverter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class User {

    int u_id;
    String name;
    String password;
    String email;


    public int getU_id() {
        return u_id;
    }

    public void setU_id(int u_id) {
        this.u_id = u_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public static User login(String username, String password){
        User user=null;
        String query="Select * from user where name=? and password=?";
        try {
            PreparedStatement pstm =new DatabaseConnection().getPrepareStatement(query);
                        MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(password.getBytes());
            byte[] digest = md.digest();
            String myHash = DatatypeConverter
                    .printHexBinary(digest).toLowerCase();
            System.out.println(myHash);
            pstm.setString(1,username);
            pstm.setString(2,myHash);
            ResultSet rs=pstm.executeQuery();

            while (rs.next()){
                user=new User();
                user.setU_id(rs.getInt("u_id"));
                user.setName(rs.getString("name"));
                user.setPassword(rs.getString("password"));
                user.setEmail(rs.getString("email"));
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return  user;
    }
}
