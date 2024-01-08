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
import java.util.logging.Level;
import java.util.logging.Logger;
import ph.pup.itech.ksnxprss.model.AdminModel;

public class AdminDao {
    
    public AdminModel getUserDetails(String userID) {
        AdminModel userDetails = null;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "SELECT userID, "
                + "password,"
                + "firstName,"
                + "middleName,"
                + "lastName,"
                + "completeAddress,"
                + "birthday,"
                + "mobileNumber,"
                + "accountStatus,"
                + "loginStatus,"
                + "userRole "
                + "FROM user "
                + "WHERE userID = ? ";
        try {
            conn = ConnectionPool.getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, userID);
            rs = ps.executeQuery();
            if (rs.next()) {
                userID = rs.getString("userID");
                String password = rs.getString("password");
                String firstN = rs.getString("firstName");
                String middleN = rs.getString("middleName");
                String lastN = rs.getString("lastName");
                String location = rs.getString("completeAddress");
                String birthday = rs.getString("birthday");
                String number = rs.getString("mobileNumber");
                String accountStatus = rs.getString("accountStatus");
                String loginStatus = rs.getString("loginStatus");
                String userRole = rs.getString("userRole");
                userDetails = new AdminModel(userID, password, firstN, middleN, lastN, location, birthday, number, accountStatus, loginStatus, userRole);
            }
        } catch (SQLException e) {
            System.out.println("userDetails Error: " + e);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AdminDao.class.getName()).log(Level.SEVERE, null, ex);
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
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    //ignore
                }
            }

        }
        return userDetails;
    }

    public boolean createUser(AdminModel user) {
        boolean success = false;
        Connection conn = null;
        PreparedStatement ps = null;
        String query = "insert into user ("
                + "userID,"
                + "password,"
                + "firstName,"
                + "middleName,"
                + "lastName,"
                + "accountStatus,"
                + "loginStatus,"
                + "userRole ) "
                + "VALUES (?, 'Admin213*', ?, ?, ?, 'Valid', 'Offline', ? ) ";
        try {
            conn = ConnectionPool.getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user.getUserID());
            ps.setString(2, user.getFirstN());
            ps.setString(3, user.getMiddleN());
            ps.setString(4, user.getLastN());
            ps.setString(5, user.getUserRole());
            int rowAffected = ps.executeUpdate();
            if (rowAffected != 0) {
                success = true;
            }
        } catch (SQLException e) {
            System.out.println("createUser Error: " + e);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AdminDao.class.getName()).log(Level.SEVERE, null, ex);
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

    public boolean updateUser(AdminModel user) {
        boolean success = false;
        Connection conn = null;
        PreparedStatement ps = null;
        String query = "update user set "
                + "password = ?, "
                + "firstName = ?, "
                + "middleName = ?, "
                + "lastName = ?, "
                + "completeAddress = ?, "
                + "birthday = ?, "
                + "mobileNumber = ?, "
                + "userRole = ? "
                + "where userID = ? ";
        try {
            conn = ConnectionPool.getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(9, user.getUserID());
            ps.setString(1, user.getPassword());
            ps.setString(2, user.getFirstN());
            ps.setString(3, user.getMiddleN());
            ps.setString(4, user.getLastN());
            ps.setString(5, user.getCompleteAddress());
            ps.setString(6, user.getBirthday());
            ps.setString(7, user.getMobileNumber());
            ps.setString(8, user.getUserRole());
            int rowAffected = ps.executeUpdate();
            if (rowAffected != 0) {
                success = true;
            }
        } catch (SQLException e) {
            System.out.println("updateUser Error: " + e);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AdminDao.class.getName()).log(Level.SEVERE, null, ex);
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

    public boolean deleteUser(String userID) {
        boolean success = false;
        Connection conn = null;
        PreparedStatement ps = null;
        String query = "delete from user "
                + "where userID = ? ";
        try {
            conn = ConnectionPool.getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, userID);
            int rowAffected = ps.executeUpdate();
            if (rowAffected != 0) {
                success = true;
            }
        } catch (SQLException e) {
            System.out.println("deleteUser Error: " + e);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AdminDao.class.getName()).log(Level.SEVERE, null, ex);
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

    public ArrayList<AdminModel> searchUser(String userID, String firstN) {
        ArrayList<AdminModel> searchResults = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "SELECT * FROM user WHERE userID = ? OR firstName = ?";
        try {
            conn = ConnectionPool.getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, userID);
            ps.setString(2, firstN);
            rs = ps.executeQuery();
            while (rs.next()) {
                AdminModel user = new AdminModel();
                user.setUserID(rs.getString("userID"));
                user.setFirstN(rs.getString("firstName"));
                user.setMiddleN(rs.getString("middleName"));
                user.setLastN(rs.getString("lastName"));
                user.setAccountStatus(rs.getString("accountStatus"));
                user.setLoginStatus(rs.getString("loginStatus"));
                user.setUserRole(rs.getString("userRole"));
                searchResults.add(user);
            }
        } catch (SQLException e) {
            System.out.println("searchUser Error: " + e);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AdminDao.class.getName()).log(Level.SEVERE, null, ex);
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
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    //ignore
                }
            }

        }
        return searchResults;
    }
    
}
