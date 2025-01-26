package org.example.aad_assignment.Servlet;

import org.example.aad_assignment.DTO.CategoryDTO;
import org.example.aad_assignment.DTO.ProductDTO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductSetServlet {
        String DB_URL = "jdbc:mysql://localhost/ecommerce";
        String DB_USER = "root";
        String DB_PASSWORD = "Ijse@123";

        public List<ProductDTO> getAllCategories() {
            List<ProductDTO> products = new ArrayList<>();
            String query = "SELECT * FROM product";

            try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                 Statement statement = connection.createStatement();
                 ResultSet resultSet = statement.executeQuery(query)) {

                while (resultSet.next()) {
                    int code = resultSet.getInt("code");
                    String name = resultSet.getString("name");
                    int qty = resultSet.getInt("qty");
                    double unitPrice = resultSet.getDouble("unitPrice");  // fixed this line
                    String imagePath = resultSet.getString("image_path");

                    ProductDTO product = new ProductDTO(code, name, qty, unitPrice, imagePath);
                    products.add(product);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

            return products;
        }

        public ProductDTO getProductByCode(int code) {  // fixed return type to ProductDTO
            ProductDTO product = null;  // fixed variable type
            String query = "SELECT * FROM product WHERE code = ?";  // query fixed

            try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                 PreparedStatement statement = connection.prepareStatement(query)) {

                statement.setInt(1, code);
                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        String name = resultSet.getString("name");
                        int qty = resultSet.getInt("qty");
                        double unitPrice = resultSet.getDouble("unitPrice");
                        String imagePath = resultSet.getString("image_path");

                        product = new ProductDTO(code, name, qty, unitPrice, imagePath);
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

            return product;
        }
    }
