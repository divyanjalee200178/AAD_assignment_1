package org.example.aad_assignment.Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.aad_assignment.util.PasswordUtil;
import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet(name = "UserSaveServlet", value = "/user-save")
public class UserSaveServlet extends HttpServlet {
    String DB_URL="jdbc:mysql://localhost/ecommerce";
    String DB_USER="root";
    String DB_PASSWORD="Ijse@123";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("user_name");
        String email = req.getParameter("user_email");
        String telString = req.getParameter("user_number");
        String password = req.getParameter("user_password");
        String role = req.getParameter("user_role");

        int tel;
        try {
            tel = Integer.parseInt(telString);
        } catch (NumberFormatException e) {
            resp.sendRedirect("user-save.jsp?error=Invalid phone number format");
            return;
        }

        if (!"customer".equals(role) && !"admin".equals(role)) {
            resp.sendRedirect("user-save.jsp?error=Invalid role selected");
            return;
        }

        try {
            String hashedPassword = PasswordUtil.hashPassword(password);
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            String sql = "INSERT INTO users(name, email, number, password, role) VALUES(?, ?, ?, ?, ?)";
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setString(1, name);
            pstm.setString(2, email);
            pstm.setInt(3, tel);
            pstm.setString(4, hashedPassword);
//            pstm.setString(4, password);
            pstm.setString(5, role);

            int effectRowCount = pstm.executeUpdate();

            if (effectRowCount > 0) {
                resp.sendRedirect("user-save.jsp?message=Customer saved successfully");
            } else {
                resp.sendRedirect("user-save.jsp?error=Customer saved unsuccessfully");
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("user-save.jsp?error=An error occurred. Please try again.");
        }
    }

    private String encryptPassword(String password) {
        return BCrypt.hashpw(password, BCrypt.gensalt());
    }
}

