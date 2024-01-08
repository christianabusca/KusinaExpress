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
import ph.pup.itech.ksnxprss.model.ProductModel;

public class ProductDao {

    public ArrayList<ProductModel> getProductList() throws ClassNotFoundException {
        ArrayList<ProductModel> productList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "select * from products";
        try {
            conn = ConnectionPool.getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                ProductModel product = new ProductModel();
                product.setProductID(rs.getInt("productID"));
                product.setProductName(rs.getString("productName"));
                product.setDescription(rs.getString("description"));
                product.setSize(rs.getString("size"));
                product.setPrice(rs.getDouble("price"));
                product.setQuantity(rs.getInt("quantity"));
                product.setType(rs.getString("type"));
                productList.add(product);
            }
            conn.close();
        } catch (SQLException e) {
            System.out.println("getProductList Error: " + e);
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
        return productList;
    }

    public ProductModel getProductDetails(int productID) {
        ProductModel productDetails = null;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = ""
                + "select productID, "
                + "productName,"
                + "description,"
                + "size,"
                + "price,"
                + "quantity, "
                + "type "
                + "from products "
                + "where productID = ? ";
        try {
            conn = ConnectionPool.getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, productID);
            rs = ps.executeQuery();
            if (rs.next()) {
                productID = rs.getInt("productID");
                String productName = rs.getString("productName");
                String description = rs.getString("description");
                String size = rs.getString("size");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");
                String type = rs.getString("type");
                productDetails = new ProductModel(productID, productName, description, size, price, quantity, type);
            }
        } catch (SQLException e) {
            System.out.println("productDetails Error: " + e);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
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
        return productDetails;
    }

    public boolean createProduct(ProductModel product) {
        boolean success = false;
        Connection conn = null;
        PreparedStatement ps = null;
        String query = "insert into products ("
                + "productID, "
                + "productName, "
                + "description, "
                + "size, "
                + "price, "
                + "quantity, "
                + "type) "
                + "values (?,?,?,?,?,?, ?)";
        try {
            conn = ConnectionPool.getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, product.getProductID());
            ps.setString(2, product.getProductName());
            ps.setString(3, product.getDescription());
            ps.setString(4, product.getSize());
            ps.setDouble(5, product.getPrice());
            ps.setInt(6, product.getQuantity());
            ps.setString(7, product.getType());
            int rowAffected = ps.executeUpdate();
            if (rowAffected != 0) {
                success = true;
            }
        } catch (SQLException e) {
            System.out.println("createProduct Error: " + e);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
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

    public boolean updateProduct(ProductModel product) {
        boolean success = false;
        Connection conn = null;
        PreparedStatement ps = null;
        String query = "UPDATE products SET "
                + "productName = ?, "
                + "description = ?, "
                + "size = ?, "
                + "price = ?, "
                + "quantity = ?, "
                + "type =? "
                + "WHERE productID = ? ";
        try {
            conn = ConnectionPool.getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(7, product.getProductID());
            ps.setString(1, product.getProductName());
            ps.setString(2, product.getDescription());
            ps.setString(3, product.getSize());
            ps.setDouble(4, product.getPrice());
            ps.setInt(5, product.getQuantity());
            ps.setString(6, product.getType());
            int rowAffected = ps.executeUpdate();
            if (rowAffected != 0) {
                success = true;
            }
        } catch (SQLException e) {
            System.out.println("updateProduct Error: " + e);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
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

    public boolean deleteProduct(int productID) {
        boolean success = false;
        Connection conn = null;
        PreparedStatement ps = null;
        String query = "delete from products "
                + "where productID = ? ";
        try {
            conn = ConnectionPool.getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, productID);
            int rowAffected = ps.executeUpdate();
            if (rowAffected != 0) {
                success = true;
            }
        } catch (SQLException e) {
            System.out.println("delete Product Error: " + e);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
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

    public ArrayList<ProductModel> searchProducts(int productID, String productName) {
        ArrayList<ProductModel> searchResults = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "SELECT * FROM products WHERE productID = ? OR productName = ?";
        try {
            conn = ConnectionPool.getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, productID);
            ps.setString(2, productName);
            rs = ps.executeQuery();
            while (rs.next()) {
                ProductModel product = new ProductModel();
                product.setProductID(rs.getInt("productID"));
                product.setProductName(rs.getString("productName"));
                product.setDescription(rs.getString("description"));
                product.setSize(rs.getString("size"));
                product.setPrice(rs.getDouble("price"));
                product.setQuantity(rs.getInt("quantity"));
                product.setType(rs.getString("type"));
                searchResults.add(product);
            }
        } catch (SQLException e) {
            System.out.println("search Products Error: " + e);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
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
