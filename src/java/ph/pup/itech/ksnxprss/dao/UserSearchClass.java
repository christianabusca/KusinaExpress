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
public class UserSearchClass {
    
    public ArrayList<AdminModel> getAllUsers() throws ClassNotFoundException{
        ArrayList<AdminModel> allAdmins = new ArrayList<>();
        Connection conn  = null;
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
                    + "birthday,"
                    + "mobileNumber,"
                    + "accountStatus,"
                    + "loginStatus,"
                    + "userRole "
                    + "FROM user";
            
            conn = ConnectionPool.getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            
            while(rs.next()){
                AdminModel users = new AdminModel();
                users.setUserID(rs.getString("userID"));
                users.setFirstN(rs.getString("firstName"));
                users.setMiddleN(rs.getString("middleName"));
                users.setLastN(rs.getString("lastName"));
                users.setCompleteAddress(rs.getString("completeAddress"));
                users.setBirthday(rs.getString("birthday"));
                users.setMobileNumber(rs.getString("mobileNumber"));
                users.setUserRole(rs.getString("userRole"));
                users.setLoginStatus(rs.getString("loginStatus"));
                users.setAccountStatus(rs.getString("accountStatus"));
                allAdmins.add(users);
            }
            conn.close();
            
            
        } catch (SQLException e) {
            
            System.out.print("getAllClient error: " + e);
            
        } finally {
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
        
        
        return allAdmins;
        
    }
    
}
