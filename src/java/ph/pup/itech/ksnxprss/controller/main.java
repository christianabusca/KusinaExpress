/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package ph.pup.itech.ksnxprss.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import ph.pup.itech.ksnxprss.dao.AdminDao;
import ph.pup.itech.ksnxprss.dao.ConnectionPool;
import ph.pup.itech.ksnxprss.dao.UserAddClass;
import ph.pup.itech.ksnxprss.model.AdminModel;

/**
 *
 * @author user
 */
public class main extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getServletPath();
        switch (action) {
            case "/main/home":
                try {
                getLogin(request, response);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(main.class.getName()).log(Level.SEVERE, null, ex);
            }
            break;
            case "/main/adminhomepage":
                adminHome(request, response);
                break;
            case "/main/forgotPass":
                forgotPasswordForm(request, response);
                break;
            case "/main/homepage":
                customerHome(request, response);
                break;
            case "/main/forgotten":
                forgotPassword(request, response);
                break;
            default:
                notLogin(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    private void getLogin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException {
        String userName = request.getParameter("mainname");
        String password = request.getParameter("mainpass");

        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/kusina_express?serverTimezone=UTC", "root", "Abuscafamily12232*");
            System.out.println("Connected");

            String sql = "SELECT * FROM user WHERE userID = ? AND password = ?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, userName);
            statement.setString(2, password);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {

                String userRole = resultSet.getString("userRole");
                if (userRole.equals("Administrator")) {

                    String updateSql = "UPDATE user SET loginStatus = 'Online' WHERE userID = ?";
                    PreparedStatement updateStatement = connection.prepareStatement(updateSql);
                    updateStatement.setString(1, userName);
                    updateStatement.executeUpdate();
                    updateStatement.close();
                    
                    request.getSession().setAttribute("userID", userName);
                    request.setAttribute("loggedInUsername", userName);
                    request.setAttribute("loggedInPassword", password);
                    request.setAttribute("message", "Admin logged in successfully.");
                    resetLoginAttemptCount(request.getSession());
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/adminhome.jsp");
                    dispatcher.forward(request, response);
                    System.out.println("Admin logged in successfully");
                } else if (userRole.equals("Customer")) {

                    String updateSql = "UPDATE user SET loginStatus = 'Online' WHERE userID = ?";
                    PreparedStatement updateStatement = connection.prepareStatement(updateSql);
                    updateStatement.setString(1, userName);
                    updateStatement.executeUpdate();
                    updateStatement.close();

                    request.getSession().setAttribute("userID", userName);
                    request.setAttribute("loggedInUsername", userName);
                    request.setAttribute("loggedInPassword", password);
                    request.setAttribute("message", "Customer logged in successfully.");
                    resetLoginAttemptCount(request.getSession());
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/home.jsp");
                    dispatcher.forward(request, response);
                    System.out.println("Customer logged in successfully");
                } else {

                    request.setAttribute("message", "User is not authorized to access the system.");
                    resetLoginAttemptCount(request.getSession());
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/index.jsp");
                    dispatcher.forward(request, response);
                    System.out.println("User is not authorized to access the system.");
                }

            } else {
                incrementLoginAttemptCount(request.getSession());
                int loginAttemptCount = getLoginAttemptCount(request.getSession());
                if (loginAttemptCount >= 3) {
                    request.setAttribute("mainss", "Due to numerous failed attemps you can't login for a moment");
                    request.getSession().setAttribute("accountLocked", true);
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/noLoginindex.jsp");
                    dispatcher.forward(request, response);
                } else {
                    request.setAttribute("collage", "The username and password do not match.");
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/index.jsp");
                    dispatcher.forward(request, response);
                    System.out.println("Invalid username or password. Please try again.");
                }
            }

        } catch (ClassNotFoundException | SQLException e) {
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (statement != null) {
                    statement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
            }
        }
    }

    private int getLoginAttemptCount(HttpSession session) {
        Integer loginAttemptCount = (Integer) session.getAttribute("loginAttemptCount");
        return loginAttemptCount != null ? loginAttemptCount : 0;
    }

    private void incrementLoginAttemptCount(HttpSession session) {
        Integer loginAttemptCount = getLoginAttemptCount(session);
        session.setAttribute("loginAttemptCount", loginAttemptCount + 1);
    }

    private void resetLoginAttemptCount(HttpSession session) {
        session.setAttribute("loginAttemptCount", 0);
    }

    private void adminHome(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher rd = getServletContext().getRequestDispatcher(
                "/adminhome.jsp");
        rd.forward(request, response);
    }

    private void customerHome(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher rd = getServletContext().getRequestDispatcher(
                "/home.jsp");
        rd.forward(request, response);
    }

    private void forgotPasswordForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher rd = getServletContext().getRequestDispatcher(
                "/forgotPassword.jsp");
        rd.forward(request, response);
    }

    private void forgotPassword(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userName = request.getParameter("userName");
        String newPassword = request.getParameter("newPassword");

        UserAddClass user = new UserAddClass();
        AdminModel forgotPass = new AdminModel(userName, newPassword);

        boolean update = user.forgotPass(forgotPass);

        if (update) {
            request.setAttribute("message", "Password has been modified.");
        } else {
            request.setAttribute("message", "Password has failed to be modified");
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
        rd.forward(request, response);
    }

    private void notLogin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/kusina_express?serverTimezone=UTC", "root", "Abuscafamily12232*");

            String query = "SELECT userID, loginStatus FROM user WHERE loginStatus = 'Online'";
            statement = connection.prepareStatement(query);
            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                String userID = resultSet.getString("userID");

                String sql = "UPDATE user SET loginStatus = 'Offline' WHERE userID = ?";
                statement = connection.prepareStatement(sql);
                statement.setString(1, userID);
                int rowsAffected = statement.executeUpdate();

                if (rowsAffected != 0) {
                    System.out.println("The Login Status has been set to Offline for userID: " + userID);
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (statement != null) {
                    statement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
            }
        }

        RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
        rd.forward(request, response);
    }
}
