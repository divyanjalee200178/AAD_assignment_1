package org.example.aad_assignment.Servlet;

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

@WebServlet(name = "PlaceOrderLoadServlet", value = "/placeOrder")
public class PlaceOrderLoadServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/ecommerce";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Ijse@123";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<CustomerDTO> customers = new ArrayList<>();

        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement statement = connection.prepareStatement(
                     "SELECT id, name FROM customer WHERE role = 'customer'"
             )) {

            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                customers.add(new CustomerDTO(
                        resultSet.getInt("id"),
                        resultSet.getString("name"),
                        null,
                        0,
                        null,
                        null
                ));
            }

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Error retrieving customer data: " + e.getMessage());
        }

        request.setAttribute("customers", customers);
        request.getRequestDispatcher("place-order.jsp").forward(request, response);
    }
}
