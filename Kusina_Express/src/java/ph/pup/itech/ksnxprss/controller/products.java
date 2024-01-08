/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package ph.pup.itech.ksnxprss.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ph.pup.itech.ksnxprss.dao.ProductDao;
import ph.pup.itech.ksnxprss.model.ProductModel;

public class products extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getServletPath();
        switch (action) {
            case "/products/add":
                getProducts(request, response);
                break;
            default:
                showProductForm(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    private void getProducts(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int productID = Integer.parseInt(request.getParameter("productID"));
        String productName = request.getParameter("productName");
        String description = request.getParameter("description");
        String size = request.getParameter("size");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String type = request.getParameter("type");

        ProductModel product = new ProductModel(
                productID, productName, description, size, price, quantity, type);
        ProductDao productsDao = new ProductDao();
        ProductModel getProducts = productsDao.getProductDetails(product);
        request.setAttribute("product", getProducts);
        System.out.println("product  " + getProducts);
        
        RequestDispatcher rd = getServletContext().getRequestDispatcher(
                "/product.jsp");
        rd.forward(request, response);
    }

    private void showProductForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher rd = getServletContext().getRequestDispatcher(
                "/product.jsp");
        rd.forward(request, response);
    }
    
}