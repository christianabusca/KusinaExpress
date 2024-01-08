/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package ph.pup.itech.ksnxprss.controller;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ph.pup.itech.ksnxprss.dao.RegistrationDao;
import ph.pup.itech.ksnxprss.dao.UserAddClass;
import ph.pup.itech.ksnxprss.model.RegistrationModel;

public class Home extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getServletPath();
        switch (action) {
            case "/Home/guest": {
                try {
                    getRegistration(request, response);
                } catch (ClassNotFoundException ex) {
                    Logger.getLogger(Home.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

            break;

            default:
                showRegistrationForm(request, response);
                break;
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    private void getRegistration(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException {

        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        String firstName = request.getParameter("firstName");
        String middleName = request.getParameter("middleName");
        String lastName = request.getParameter("lastName");
        String location = request.getParameter("location");
        String birthday = request.getParameter("birthday");
        long number = Long.parseLong(request.getParameter("number"));

        RegistrationModel registration = new RegistrationModel(
                userName, password, firstName, middleName, lastName, location, birthday, number);
        RegistrationDao registrationDao = new RegistrationDao();
        RegistrationModel getRegistration = registrationDao.getRegistrationDetails(registration);

        request.setAttribute("registration", getRegistration);
        System.out.println("registration  " + getRegistration);

        UserAddClass users = new UserAddClass();
        boolean addUser = users.addUser(userName, password, firstName, middleName, lastName, location, birthday, number);
        if (addUser) {
            System.out.println("Success");
        } else {
            System.out.println("Failed");
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(
                "/index.jsp");
        rd.forward(request, response);
    }

    private void showRegistrationForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher rd = getServletContext().getRequestDispatcher(
                "/index.jsp");
        rd.forward(request, response);
    }

}
