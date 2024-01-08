/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ph.pup.itech.ksnxprss.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionPool {
    
    static Connection conn;
    
    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        
        try {
            String driver = "com.mysql.cj.jdbc.Driver";
            Class.forName (driver);
                    
            String url = "jdbc:mysql://localhost:3306/kusina_express?serverTimezone=UTC";
            conn = (Connection) DriverManager.getConnection(url, "root", "Abuscafamily12232*");
            
        }
        catch (SQLException e){
            System.out.println("SQLException" + e);
        }
        
        return conn;
    }
    
}
