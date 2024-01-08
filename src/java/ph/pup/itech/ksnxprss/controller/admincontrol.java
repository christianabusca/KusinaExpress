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
import ph.pup.itech.ksnxprss.dao.AdminDao;
import ph.pup.itech.ksnxprss.dao.UserSearchClass;
import ph.pup.itech.ksnxprss.model.AdminModel;

public class admincontrol extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getServletPath();
        switch (action) {
            case "/admincontrol/create":
                createUser(request, response);
                break;
            case "/admincontrol/update/form":
                showUserUpdateForm(request, response);
                break;
            case "/admincontrol/update":
                updateUser(request, response);
                break;
            case "/admincontrol/delete":
                deleteUser(request, response);
                break;
            case "/admincontrol/search":
                searchUser(request, response);
                break;
            default: {
                showAdminForm(request, response);
            }
            break;

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    private void createUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userID = request.getParameter("userID");
        String firstN = request.getParameter("firstN");
        String middleN = request.getParameter("middleN");
        String lastN = request.getParameter("lastN");
        String userRole = request.getParameter("userRole");

        AdminDao user = new AdminDao();
        AdminModel createUser = new AdminModel(
                userID, firstN, middleN, lastN, userRole);

        boolean success = user.createUser(createUser);

        if (success) {
            request.setAttribute("message", userID + " has been added.");
        } else {
            request.setAttribute("message", "User ID already exists.");
        }

        showAdminForm(request, response);
    }

    private void showUserUpdateForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String userID = request.getParameter("userID");
        AdminDao admin = new AdminDao();
        AdminModel userDetails = admin.getUserDetails(userID);
        request.setAttribute("userDetails", userDetails);
        RequestDispatcher rd = getServletContext().getRequestDispatcher(
                "/updateuser.jsp");
        rd.forward(request, response);
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userID = request.getParameter("userID");
        String password = request.getParameter("password");
        String firstN = request.getParameter("firstName");
        String middleN = request.getParameter("middleName");
        String lastN = request.getParameter("lastName");
        String location = request.getParameter("completeAddress");
        String birthday = request.getParameter("birthday");
        String mobileNumber = request.getParameter("mobileNumber");
        String userRole = request.getParameter("userRole");
        AdminDao user = new AdminDao();
        AdminModel updateUser = new AdminModel(userID, password, firstN, middleN, lastN, location, birthday, mobileNumber, userRole);
        
        boolean update = user.updateUser(updateUser);

        if (update) {
            request.setAttribute("message", "User with ID: " + userID + " has been updated.");
        } else {
            request.setAttribute("message", "Failed to update user." + userID);
        }

        showAdminForm(request, response);
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userID = request.getParameter("userID");
        AdminDao user = new AdminDao();
        boolean success = user.deleteUser(userID);

        if (success) {
            request.setAttribute("message", "User with ID: " + userID + " has been deleted.");
        } else {
            request.setAttribute("message", "Failed to delete user.");
        }

        showAdminForm(request, response);
    }

    private void searchUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userID = request.getParameter("userID");
        String firstN = request.getParameter("firstN");
        AdminDao user = new AdminDao();
        ArrayList<AdminModel> searchResults = user.searchUser(userID, firstN);
        request.setAttribute("allAdmins", searchResults);
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/useradmin.jsp");
        rd.forward(request, response);

    }

    private void showAdminForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            System.out.println("processRequest method called");
            UserSearchClass search = new UserSearchClass();
            ArrayList<AdminModel> allAdmins = search.getAllUsers();
            request.setAttribute("allAdmins", allAdmins);
            RequestDispatcher rd = request.getRequestDispatcher("/useradmin.jsp");
            rd.forward(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(admincontrol.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
