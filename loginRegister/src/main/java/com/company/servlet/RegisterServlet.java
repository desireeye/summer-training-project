package com.company.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        Connection con = null;

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish the connection to mydb database
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "ar#123");

            // Get the form data
            String username = request.getParameter("txtName");
            String password = request.getParameter("txtPwd");
            String email = request.getParameter("txtEmail");

            // Prepare the SQL statement
            String query = "INSERT INTO person (uname, password, email) VALUES (?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, email);

            // Execute the update
            int result = ps.executeUpdate();

            // Redirect to login.jsp with a success parameter if registration was successful
            if (result > 0) {
                response.sendRedirect("login.jsp?success=true");
            } else {
                response.sendRedirect("login.jsp?error=true");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new ServletException("JDBC Driver not found", e);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("Error connecting to the database", e);
        } finally {
            // Ensure the connection is closed
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            out.close();
        }
    }
}