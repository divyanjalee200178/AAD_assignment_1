package org.example.aad_assignment.Servlet;

import org.example.aad_assignment.DTO.CartDTO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CartSet {
        String DB_URL = "jdbc:mysql://localhost/ecommerce";
        String DB_USER = "root";
        String DB_PASSWORD = "Ijse@123";

        public List<CartDTO> getAllCategories() {
            List<CartDTO> carts = new ArrayList<>();
            String query = "SELECT * FROM cart";

            try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                 Statement statement = connection.createStatement();
                 ResultSet resultSet = statement.executeQuery(query)) {

                while (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    int productCode = resultSet.getInt("product_code");
                    String productName = resultSet.getString("product_name");
                    double price = resultSet.getDouble("price");
                    int qty = resultSet.getInt("qty");
                    String customerName = resultSet.getString("customer_name");
                    double totalPrice = resultSet.getDouble("total_price");

                    // Using the constructor with id
                    CartDTO cart = new CartDTO(id, productCode, productName, price, qty, totalPrice, customerName);
                    carts.add(cart);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

            return carts;
        }

        public CartDTO getCartById(int id) {
            CartDTO cart = null;
            String query = "SELECT * FROM cart WHERE id = ?";

            try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                 PreparedStatement statement = connection.prepareStatement(query)) {

                statement.setInt(1, id);
                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        int productCode = resultSet.getInt("product_code");
                        String productName = resultSet.getString("product_name");
                        double price = resultSet.getDouble("price");
                        int qty = resultSet.getInt("qty");
                        String customerName = resultSet.getString("customer_name");
                        double totalPrice = resultSet.getDouble("total_price");

                        // Using the constructor with id
                        cart = new CartDTO(id, productCode, productName, price, qty, totalPrice, customerName);
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

            return cart;
        }
    }
