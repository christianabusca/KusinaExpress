/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package ph.pup.itech.ksnxprss.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ph.pup.itech.ksnxprss.dao.ProductDao;
import ph.pup.itech.ksnxprss.dao.ProductSearchClass;
import ph.pup.itech.ksnxprss.model.ProductModel;

public class products extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getServletPath();
        switch (action) {
            case "/products/create":
                createProduct(request, response);
                break;
            case "/products/update/form":
                showProductUpdateForm(request, response);
                break;
            case "/products/update":
                updateProduct(request, response);
                break;
            case "/products/delete":
                deleteProduct(request, response);
                break;
            case "/products/search": 
                searchProduct(request, response);
                break;
            default:  {
                showProductForm(request, response);
            }
            break;


        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int productID = Integer.parseInt(request.getParameter("productID"));
        String productName = request.getParameter("productName");
        String description = request.getParameter("description");
        String size = request.getParameter("size");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String type = request.getParameter("type");
        ProductDao product = new ProductDao();
        ProductModel createProduct = new ProductModel(
                productID, productName, description, size, price, quantity, type);
        boolean success = product.createProduct(createProduct);
        if (success) {
            request.setAttribute("message", productName + " with Product ID:" 
                    + productID + " has been added to inventory.");
        } else {
            request.setAttribute("message", "Product ID already exists.");
        }
        showProductForm(request, response);
    }
    
    private void showProductUpdateForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int productID = Integer.parseInt(request.getParameter("productID"));
        ProductDao product = new ProductDao();
        ProductModel productDetails = product.getProductDetails(productID);
        request.setAttribute("productDetails", productDetails);
        RequestDispatcher rd = getServletContext().getRequestDispatcher(
                "/updateproduct.jsp");
        rd.forward(request, response);
    }
    
    private void updateProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int productID = Integer.parseInt(request.getParameter("productID"));
        String productName = request.getParameter("productName");
        String description = request.getParameter("description");
        String size = request.getParameter("size");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String type = request.getParameter("type");
        ProductDao product = new ProductDao();
        ProductModel updateProduct = new ProductModel(productID, productName, description, size, price, quantity, type);
        boolean update = product.updateProduct(updateProduct);
        if (update) {
            request.setAttribute("message", "Product with : " + productID + " has been updated from the inventory.");
        } else {
            request.setAttribute("message", "Failed to update product.");
        }
        showProductForm(request, response);
    }
    
    private void deleteProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int productID = Integer.parseInt(request.getParameter("productID"));
        ProductDao product = new ProductDao();
        boolean success = product.deleteProduct(productID);
        if (success) {
            request.setAttribute("message", "Product with ID: " + productID + " has been deleted.");
        } else {
            request.setAttribute("message", "Failed to delete product.");
        }
        showProductForm(request, response);
        
    }
    
    private void searchProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int productID = Integer.parseInt(request.getParameter("productID"));
        String productName = request.getParameter("productName");

        ProductDao product = new ProductDao();
        ArrayList<ProductModel> searchResults = product.searchProducts(productID, productName);

        request.setAttribute("allProducts", searchResults);
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/product.jsp");
        rd.forward(request, response);
    }

    
    private void showProductForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            System.out.println("processRequest method called");
            ProductSearchClass search = new ProductSearchClass();
            ArrayList<ProductModel> allProducts = search.getAllProduct();
            request.setAttribute("allProducts", allProducts);
            RequestDispatcher rd = request.getRequestDispatcher("/product.jsp");
            rd.forward(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(products.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
