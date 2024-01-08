/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ph.pup.itech.ksnxprss.dao;

import ph.pup.itech.ksnxprss.model.ProductModel;

public class ProductDao {
    
    public ProductModel getProductDetails(ProductModel product){
    ProductModel productDetails;
    
    int productID = product.getProductID();
    String productName = product.getProductName();
    String description = product.getDescription();
    String size = product.getSize();
    double price = product.getPrice();
    int quantity = product.getQuantity();
    String type = product.getType();
    
    productDetails = new ProductModel(productID, productName, description, size, price, quantity, type);
    System.out.println("Product Details " + productDetails);
    return productDetails;
    
    }
    
    public String getProductID(){
        String productID = null;
        return productID;
    }
    
}
