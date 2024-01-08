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
import javax.servlet.RequestDispatcher;
import ph.pup.itech.ksnxprss.model.ProductModel;

public class ProductSearchClass {
    
    public ArrayList<ProductModel> getAllProduct() throws ClassNotFoundException{
        ArrayList<ProductModel> allProducts = new ArrayList<>();
        Connection conn  = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            
            String query = "SELECT "
                    + "productID, "
                    + "productName, "
                    + "description, "
                    + "size, "
                    + "price, "
                    + "quantity, "
                    + "type "
                    + "FROM products";
            
            conn = ConnectionPool.getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            
            while(rs.next()){
                ProductModel product = new ProductModel();
                product.setProductID(rs.getInt("productID"));
                product.setProductName(rs.getString("productName"));
                product.setDescription(rs.getString("description"));
                product.setSize(rs.getString("size"));
                product.setPrice(rs.getDouble("price"));
                product.setQuantity(rs.getInt("quantity"));
                product.setType(rs.getString("type"));
                allProducts.add(product);
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
        
        
        return allProducts;
        
    }
    
}
