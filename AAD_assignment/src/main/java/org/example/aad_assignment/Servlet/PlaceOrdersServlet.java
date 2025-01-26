package org.example.aad_assignment.Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.example.aad_assignment.DTO.OrderDetailDTO;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

@WebServlet(name = "PlaceOrdersServlet", value = "/place")
public class PlaceOrdersServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost/ecommerce";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Ijse@123";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("userId");

        // Check if cart data is present in the request
        String[] customerNames = request.getParameterValues("cartData[][customerName]");
        String[] productCodes = request.getParameterValues("cartData[][productCode]");
        String[] productNames = request.getParameterValues("cartData[][productName]");
        String[] quantities = request.getParameterValues("cartData[][quantity]");
        String[] unitPrices = request.getParameterValues("cartData[][unitPrice]");
        String[] totalPrices = request.getParameterValues("cartData[][totalPrice]");

        if (customerNames == null || customerNames.length == 0) {
            response.sendRedirect("placeOrder.jsp?error=Cart is empty");
            return;
        }

        if (userId == null) {
            response.sendRedirect("login.jsp?error=Please login to place an order");
            return;
        }

        Connection connection = null;
        PreparedStatement insertOrderStmt = null;
        PreparedStatement insertOrderItemStmt = null;
        PreparedStatement updateProductStmt = null;

        try {
            connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            connection.setAutoCommit(false);

            // Insert into orders table
            String insertOrderQuery = "INSERT INTO orders (user_id, order_date) VALUES (?, NOW())";
            insertOrderStmt = connection.prepareStatement(insertOrderQuery, Statement.RETURN_GENERATED_KEYS);
            insertOrderStmt.setString(1, userId);
            int rowsAffected = insertOrderStmt.executeUpdate();

            if (rowsAffected == 0) {
                throw new SQLException("Failed to insert order.");
            }

            // Get the generated order ID
            ResultSet generatedKeys = insertOrderStmt.getGeneratedKeys();
            int orderId;
            if (generatedKeys.next()) {
                orderId = generatedKeys.getInt(1);
            } else {
                throw new SQLException("Failed to retrieve order ID.");
            }

            // Insert into order_items and update product stock
            String insertOrderItemQuery = "INSERT INTO order_items (order_id, product_name, quantity, unit_price, total_price) VALUES (?, ?, ?, ?, ?)";
            insertOrderItemStmt = connection.prepareStatement(insertOrderItemQuery);

            String updateProductQuery = "UPDATE product SET qty = qty - ? WHERE name = ?";
            updateProductStmt = connection.prepareStatement(updateProductQuery);

            for (int i = 0; i < customerNames.length; i++) {
                String customerName = customerNames[i];
                String productCode = productCodes[i];
                String productName = productNames[i];
                int quantity = Integer.parseInt(quantities[i]);
                double unitPrice = Double.parseDouble(unitPrices[i]);
                double totalPrice = Double.parseDouble(totalPrices[i]);

                // Insert order item
                insertOrderItemStmt.setInt(1, orderId);
                insertOrderItemStmt.setString(2, productName);
                insertOrderItemStmt.setInt(3, quantity);
                insertOrderItemStmt.setDouble(4, unitPrice);
                insertOrderItemStmt.setDouble(5, totalPrice);
                insertOrderItemStmt.addBatch();

                // Update product stock
                updateProductStmt.setInt(1, quantity);
                updateProductStmt.setString(2, productName);
                updateProductStmt.addBatch();
            }

            // Execute batch updates
            insertOrderItemStmt.executeBatch();
            updateProductStmt.executeBatch();

            connection.commit(); // Commit the transaction

            // Clear the cart after successful order placement
            session.removeAttribute("cart");

            response.sendRedirect("orderSuccess.jsp");

        } catch (SQLException e) {
            e.printStackTrace();
            if (connection != null) {
                try {
                    connection.rollback();
                } catch (SQLException rollbackEx) {
                    rollbackEx.printStackTrace();
                }
            }
            response.sendRedirect("placeOrder.jsp?error=Order placement failed: " + e.getMessage());
        } finally {
            try {
                if (insertOrderStmt != null) insertOrderStmt.close();
                if (insertOrderItemStmt != null) insertOrderItemStmt.close();
                if (updateProductStmt != null) updateProductStmt.close();
                if (connection != null) connection.close();
            } catch (SQLException closeEx) {
                closeEx.printStackTrace();
            }
        }
    }
}
