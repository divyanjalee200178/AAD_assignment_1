package org.example.aad_assignment.Servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.aad_assignment.DTO.CustomerDTO;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "UserSearchServlet", value = "/user-search")
public class UserSearchServlet extends HttpServlet {
    String DB_URL="jdbc:mysql://localhost/ecommerce";
    String DB_USER="root";
    String DB_PASSWORD="Ijse@123";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<CustomerDTO> customerDTOS = new ArrayList<>();

        String searchUser = req.getParameter("searchCus");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);


            String sql;
            if (searchUser != null && !searchUser.isEmpty()) {
                sql = "SELECT * FROM users WHERE name LIKE ?";
            } else {
                sql = "SELECT * FROM users";
            }

            PreparedStatement statement = connection.prepareStatement(sql);
            if (searchUser != null && !searchUser.isEmpty()) {
                statement.setString(1, "%" + searchUser + "%");
            }
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                CustomerDTO customerDTO = new CustomerDTO(
                        resultSet.getInt("id"),
                        resultSet.getString("name"),
                        resultSet.getString("email"),
                        resultSet.getInt("number"),
                        resultSet.getString("password"),
                        resultSet.getString("role")
                );

                customerDTOS.add(customerDTO);
            }

            req.setAttribute("customers", customerDTOS);

            RequestDispatcher dispatcher = req.getRequestDispatcher("user-search.jsp");
            dispatcher.forward(req, resp);

        } catch (SQLException | ClassNotFoundException e) {
            throw new ServletException("Database connection or query failed", e);
        }
    }

}


