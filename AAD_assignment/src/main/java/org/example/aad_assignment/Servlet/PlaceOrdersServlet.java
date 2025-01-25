package org.example.aad_assignment.Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.example.aad_assignment.DTO.CartItemDTO;

import java.io.IOException;
import java.sql.*;
import java.util.List;

@WebServlet(name = "PlaceOrdersServlet", value = "/PlaceOrderServlet")
public class PlaceOrdersServlet extends HttpServlet {
     String DB_URL = "jdbc:mysql://localhost/ecommerce";
     String DB_USER = "root";
     String DB_PASSWORD = "Ijse@123";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection connection = null;
        PreparedStatement insertOrderStmt = null;
        PreparedStatement insertOrderItemStmt = null;
        PreparedStatement updateProductStmt = null;
        PreparedStatement checkStockStmt = null;

        HttpSession session = request.getSession();
        List<CartItemDTO> cart = (List<CartItemDTO>) session.getAttribute("cart");

        if (cart == null || cart.isEmpty()) {
            response.sendRedirect("placeOrder.jsp?error=No items in cart!");
            return;
        }

        String customerId = cart.get(0).getCustomerId();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            connection.setAutoCommit(false);

            String insertOrderQuery = "INSERT INTO orders (customer_id, order_date) VALUES (?, CURDATE())";
            insertOrderStmt = connection.prepareStatement(insertOrderQuery, Statement.RETURN_GENERATED_KEYS);
            insertOrderStmt.setString(1, customerId);
            insertOrderStmt.executeUpdate();


            ResultSet rs = insertOrderStmt.getGeneratedKeys();
            if (!rs.next()) {
                throw new SQLException("Failed to retrieve the order ID.");
            }
            int orderId = rs.getInt(1);


            String insertOrderItemQuery = "INSERT INTO order_items (order_id, product_name, quantity, unit_price, total_price) VALUES (?, ?, ?, ?, ?)";
            insertOrderItemStmt = connection.prepareStatement(insertOrderItemQuery);


            String updateProductQuery = "UPDATE product SET qty = qty - ? WHERE name = ?";
            updateProductStmt = connection.prepareStatement(updateProductQuery);


            String checkStockQuery = "SELECT qty FROM product WHERE name = ?";
            checkStockStmt = connection.prepareStatement(checkStockQuery);


            for (CartItemDTO item : cart) {
                System.out.println("Checking stock for product: " + item.getProductName());
                checkStockStmt.setString(1, item.getProductName());
                ResultSet stockResult = checkStockStmt.executeQuery();
                if (stockResult.next()) {
                    int availableStock = stockResult.getInt("qty");
                    if (item.getQuantity() > availableStock) {
                        throw new SQLException("Not enough stock for product: " + item.getProductName());
                    }
                } else {
                    System.out.println("No product found with name: " + item.getProductName());
                    throw new SQLException("Product not found: " + item.getProductName());
                }

                insertOrderItemStmt.setInt(1, orderId);
                insertOrderItemStmt.setString(2, item.getProductName());
                insertOrderItemStmt.setInt(3, item.getQuantity());
                insertOrderItemStmt.setDouble(4, item.getUnitPrice());
                insertOrderItemStmt.setDouble(5, item.getTotalPrice());
                insertOrderItemStmt.addBatch();

                updateProductStmt.setInt(1, item.getQuantity());
                updateProductStmt.setString(2, item.getProductName());
                updateProductStmt.addBatch();
            }

            insertOrderItemStmt.executeBatch();
            updateProductStmt.executeBatch();

            connection.commit();
            System.out.println("Transaction committed successfully.");

            session.removeAttribute("cart");
            response.sendRedirect("placeOrder.jsp?message=Order placed successfully!");

        } catch (SQLException | ClassNotFoundException e) {
            if (connection != null) {
                try {
                    connection.rollback();
                    System.out.println("Transaction rolled back.");
                } catch (SQLException rollbackEx) {
                    rollbackEx.printStackTrace();
                }
            }
            e.printStackTrace();
            response.sendRedirect("placeOrder.jsp?error=Failed to place order!");
        } finally {
            try {
                if (insertOrderStmt != null) insertOrderStmt.close();
                if (insertOrderItemStmt != null) insertOrderItemStmt.close();
                if (updateProductStmt != null) updateProductStmt.close();
                if (checkStockStmt != null) checkStockStmt.close();
                if (connection != null) connection.close();
            } catch (SQLException cleanupEx) {
                cleanupEx.printStackTrace();
            }
        }
    }
}
