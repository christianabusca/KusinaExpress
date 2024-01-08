/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package ph.pup.itech.ksnxprss.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ecommerce extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userName = request.getParameter("userName");
        System.out.println("User Name: " + userName);
        String firstName = request.getParameter("firstName");
        System.out.println("First Name: " + firstName);
        String middleName = request.getParameter("middleName");
        System.out.println("Middle Name: " + middleName);
        String lastName = request.getParameter("lastName");
        System.out.println("Last Name: " + lastName);
        String location = request.getParameter("location");
        System.out.println("Location: " + location);
        String birthday = request.getParameter("birthday");
        System.out.println("Birthday: " + birthday);
        String number = request.getParameter("number");
        System.out.println("Number: " + number);

        HttpSession session = request.getSession();
        session.setAttribute("userName", userName);
        request.setAttribute("firstName", firstName);
        request.setAttribute("middleName", middleName);
        request.setAttribute("lastName", lastName);
        request.setAttribute("location", location);
        request.setAttribute("birthday", birthday);
        request.setAttribute("number", number);

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/home.jsp");
        dispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
