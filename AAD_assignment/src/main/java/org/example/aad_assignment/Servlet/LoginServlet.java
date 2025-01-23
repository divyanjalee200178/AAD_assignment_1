package org.example.aad_assignment.Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.aad_assignment.DTO.CustomerDTO;
import org.example.aad_assignment.util.PasswordUtil;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost/ecommerce";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Ijse@123";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String password = req.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            String sql = "SELECT id, name, email, number, password, role FROM users WHERE name = ?";
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setString(1, name);

            ResultSet rs = pstm.executeQuery();

            if (rs.next()) {
                int id = rs.getInt("id");
                String userName = rs.getString("name");
                String email = rs.getString("email");
                int number = rs.getInt("number");
                String storedPassword = rs.getString("password");
                String role = rs.getString("role");

                boolean isPasswordEncrypted = isPasswordEncrypted(storedPassword);

                if (isPasswordEncrypted) {
                    if (PasswordUtil.checkPassword(password, storedPassword)) {
                        CustomerDTO customer = new CustomerDTO(id, userName, email, number, storedPassword, role);
                        req.getSession().setAttribute("customer", customer);

                        if ("customer".equals(role)) {
                            resp.sendRedirect("customerDash.jsp");
                        } else if ("admin".equals(role)) {
                            resp.sendRedirect("dashboard.jsp");
                        } else {
                            resp.sendRedirect("login.jsp?error=Invalid role");
                        }
                    } else {
                        resp.sendRedirect("login.jsp?error=Invalid name or password");
                    }
                } else {
                    if (password.equals(storedPassword)) {
                        CustomerDTO customer = new CustomerDTO(id, userName, email, number, storedPassword, role);
                        req.getSession().setAttribute("customer", customer);
                        if ("customer".equals(role)) {
                            resp.sendRedirect("customerDash.jsp");
                        } else if ("admin".equals(role)) {
                            resp.sendRedirect("dashboard.jsp");
                        } else {
                            resp.sendRedirect("login.jsp?error=Invalid role");
                        }
                    } else {
                        resp.sendRedirect("login.jsp?error=Invalid name or password");
                    }
                }
            } else {
                resp.sendRedirect("index.jsp?error=Invalid name or password");
            }

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("index.jsp?error=An error occurred. Please try again.");
        }
    }

    private boolean isPasswordEncrypted(String password) {
        return password != null && password.matches("^\\$2[aby]\\$\\d{2}\\$[A-Za-z0-9./]{53}$");
    }
}
