package org.example.aad_assignment.Servlet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ProductsService {

    private static final String DB_URL = "jdbc:mysql://localhost/ecommerce";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Ijse@123";

    public void addToCart(String customerName, String productCode, String productName, double price, int qty, double totalPrice) throws SQLException {
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String sql = "INSERT INTO cart (customer_name, product_code, product_name, price, qty, total_price) VALUES (?, ?, ?, ?, ?, ?)";
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setString(1, customerName);
                ps.setString(2, productCode);
                ps.setString(3, productName);
                ps.setDouble(4, price);
                ps.setInt(5, qty);
                ps.setDouble(6, totalPrice);

                int rowsAffected = ps.executeUpdate();
                if (rowsAffected == 0) {
                    throw new SQLException("Failed to add item to cart.");
                }
            }
        }
    }
}
