package org.example.aad_assignment;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.aad_assignment.DTO.CustomerDTO;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost/Management_system";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Ijse@123";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String password = req.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            String sql = "SELECT id, name, email, number, password, role FROM customer WHERE name = ? AND password = ?";

            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setString(1, name);   // Set the username
            pstm.setString(2, password); // Set the password

            ResultSet rs = pstm.executeQuery();

            if (rs.next()) {
                int id = rs.getInt("id");
                String userName = rs.getString("name");
                String email = rs.getString("email");
                int number = rs.getInt("number");
                String userPassword = rs.getString("password");
                String role = rs.getString("role");

                CustomerDTO customer = new CustomerDTO(id, userName, email, number, userPassword, role);

                req.getSession().setAttribute("customer", customer);

                if ("customer".equals(role)) {
                    resp.sendRedirect("dashboard.jsp");
                } else if ("admin".equals(role)) {
                    resp.sendRedirect("customer-save.jsp");
                } else {
                    resp.sendRedirect("index.jsp?error=Invalid role");
                }
            } else {
                resp.sendRedirect("index.jsp?error=Invalid name or password");
            }

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("index.jsp?error=An error occurred. Please try again.");
        }
    }
}