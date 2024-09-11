package com.company.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;  // Import for URL encoding
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class LoginServlet extends HttpServlet {
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

            // Get the username and password from the request
            String username = request.getParameter("txtName");
            String password = request.getParameter("txtPwd");

            // Prepare the SQL statement
            String query = "SELECT uname FROM person WHERE uname=? AND password=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);

            // Execute the query
            ResultSet rs = ps.executeQuery();

            // Check if the user exists
            if (rs.next()) {
                // Redirect to welcome.jsp with username parameter on successful 
                response.sendRedirect("welcome.jsp?username=" + URLEncoder.encode(username, "UTF-8"));
            } else {
                // Redirect to login.jsp with error parameter on failed login
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