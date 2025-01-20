package org.example.aad_assignment;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet(name = "CustomerSaveServlet", value = "/customer-save")
public class CustomerSaveServlet extends HttpServlet {
    String DB_URL="jdbc:mysql://localhost/Management_system";
    String DB_USER="root";
    String DB_PASSWORD="Ijse@123";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("customer_name");
        String email = req.getParameter("customer_email");
        String telString = req.getParameter("customer_number");
        String password = req.getParameter("customer_password");
        String role = req.getParameter("customer_role");

        int tel;
        try {
            tel = Integer.parseInt(telString);
        } catch (NumberFormatException e) {
            resp.sendRedirect("customer-save.jsp?error=Invalid phone number format");
            return;
        }

        if (!"customer".equals(role) && !"admin".equals(role)) {
            resp.sendRedirect("customer-save.jsp?error=Invalid role selected");
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            String sql = "INSERT INTO customer(name, email, number, password, role) VALUES(?, ?, ?, ?, ?)";
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setString(1, name);
            pstm.setString(2, email);
            pstm.setInt(3, tel);
            pstm.setString(4, password);
            pstm.setString(5, role);

            int effectRowCount = pstm.executeUpdate();

            if (effectRowCount > 0) {
                resp.sendRedirect("customer-save.jsp?message=Customer saved successfully");
            } else {
                resp.sendRedirect("customer-save.jsp?error=Customer saved unsuccessfully");
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("customer-save.jsp?error=An error occurred. Please try again.");
        }
    }
    }

