/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ph.pup.itech.ksnxprss.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author user
 */
public class AdminAddClass {

    public boolean addAdmin(
            String userID,
            String firstName,
            String middleName,
            String lastName,
            String userRole) throws ClassNotFoundException {

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
                    + "accountStatus,"
                    + "loginStatus,"
                    + "userRole) "
                    + "VALUES (?, 'Admin213*', ?, ?, ?, 'Valid', 'Offline',?)";
            conn = ConnectionPool.getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, userID);
            ps.setString(2, firstName);
            ps.setString(3, middleName);
            ps.setString(4, lastName);
            ps.setString(5, userRole);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected != 0) {
                success = true;
            }

            conn.close();

        } catch (SQLException e) {
            System.out.println("SQLException: " + e);
        } finally {
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException e) {
                    System.out.println("SQLException: " + e.getMessage());
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    System.out.println("SQLException: " + e.getMessage());
                }
            }
        }

        return success;

    }

}
