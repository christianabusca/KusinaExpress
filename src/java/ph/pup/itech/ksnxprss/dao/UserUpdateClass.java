/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ph.pup.itech.ksnxprss.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import ph.pup.itech.ksnxprss.model.AdminModel;

/**
 *
 * @author user
 */
public class UserUpdateClass {
    
    public ArrayList<AdminModel> getUserDetails(String userID) throws ClassNotFoundException{
        ArrayList<AdminModel> userDetails = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            
            String query = "SELECT "
                    + "userID, "
                    + "password, "
                    + "firstName, "
                    + "middleName, "
                    + "lastName, "
                    + "completeAddress, "
                    + "birthday, "
                    + "mobileNumber, "
                    + "userRole "
                    + "FROM user"
                    + "WHERE userID = ?";
            conn = ConnectionPool.getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, userID);
            rs = ps.executeQuery();
            
            while(rs.next()){
                AdminModel admin = new AdminModel();
                admin.setUserID(rs.getString("userID"));
                admin.setPassword(rs.getString("password"));
                admin.setFirstN(rs.getString("firstName"));
                admin.setMiddleN(rs.getString("middleName"));
                admin.setLastN(rs.getString("lastName"));
                admin.setCompleteAddress(rs.getString("completeAddress"));
                admin.setBirthday(rs.getString("birthday"));
                admin.setMobileNumber(rs.getString("mobileNumber"));
                admin.setUserRole(rs.getString("userRole"));
                userDetails.add(admin);
            }
            conn.close();
        } catch (SQLException e){
            System.out.println("getUserDetails error: " + e);
        }
        finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    System.out.println("SQLException: " + e.getMessage());
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException e) {
                   System.out.println("SQLException: " + e.getMessage());
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    System.out.println("SQLException: " + e.getMessage());
                }
            }
        }
        
        
        return userDetails;
        
    }
    
}
