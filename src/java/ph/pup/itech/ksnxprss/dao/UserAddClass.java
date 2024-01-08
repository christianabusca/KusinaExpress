/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ph.pup.itech.ksnxprss.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import ph.pup.itech.ksnxprss.model.AdminModel;

public class UserAddClass {

    public boolean addUser(String userID, 
            String password, 
            String firstName, 
            String middleName, 
            String lastName, 
            String completeAddress, 
            String birthday, 
            long mobileNumber) throws ClassNotFoundException {
        boolean success = false;
        Connection conn = null;
        PreparedStatement ps = null;
        try {
            String query = "INSERT INTO user ("
                    
                    + "userID,"
                    + "password,"
                    + "firstName,"
                    + "middleName,"
                    + "lastName,"
                    + "completeAddress,"
                    + "birthday,"
                    + "mobileNumber,"
                    + "accountStatus,"
                    + "loginStatus,"
                    + "userRole) "
                    + "VALUES (?, ?, ? , ?, ?, ?, ?, ?, 'Valid', 'Offline', 'Customer')";
            conn = ConnectionPool.getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, userID);
            ps.setString(2, password);
            ps.setString(3, firstName);
            ps.setString(4, middleName);
            ps.setString(5, lastName);
            ps.setString(6, completeAddress);
            ps.setString(7, birthday);
            ps.setLong(8, mobileNumber);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected != 0) {
                success = true;
            }
            conn.close();
        }catch (SQLException e){
            System.out.println("SQLException: " + e);
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                }
                catch (SQLException e) {
                    System.out.println("SQLException: " + e.getMessage());
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                }
                catch (SQLException e) {
                    System.out.println("SQLException: " + e.getMessage());
                }
            } 
        }
        return success;
    }
    
    public boolean forgotPass(AdminModel user) {
        boolean success = false;
        Connection conn = null;
        PreparedStatement ps = null;
        String query = "update user set "
                + "password = ? "
                + "where userID = ? ";
        try {
            conn = ConnectionPool.getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(2, user.getUserID());
            ps.setString(1, user.getPassword());
            int rowAffected = ps.executeUpdate();
            if (rowAffected != 0) {
                success = true;
            }
        } catch (SQLException e) {
            System.out.println("updateUser Error: " + e);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserAddClass.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    //ignore
                }
            }
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException e) {
                    //ignore
                }
            }

        }
        return success;
    }
    
}
