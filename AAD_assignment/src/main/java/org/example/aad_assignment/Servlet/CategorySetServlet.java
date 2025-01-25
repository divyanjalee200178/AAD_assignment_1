package org.example.aad_assignment.Servlet;

import org.example.aad_assignment.DTO.CategoryDTO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CategorySetServlet {
    String DB_URL="jdbc:mysql://localhost/ecommerce";
    String DB_USER="root";
    String DB_PASSWORD="Ijse@123";
    public List<CategoryDTO> getAllCategories() {
        List<CategoryDTO> categories = new ArrayList<>();
        String query = "SELECT * FROM category";

        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {

            while (resultSet.next()) {
                int code = resultSet.getInt("code");
                String name = resultSet.getString("name");
                int qty = resultSet.getInt("qty");
                String imagePath = resultSet.getString("image_path");

                CategoryDTO category = new CategoryDTO(code, name, qty, imagePath);
                categories.add(category);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return categories;
    }

    public CategoryDTO getCategoryByCode(int code) {
        CategoryDTO category = null;
        String query = "SELECT * FROM category WHERE code = ?";

        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setInt(1, code);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    String name = resultSet.getString("name");
                    int qty = resultSet.getInt("qty");
                    String imagePath = resultSet.getString("image_path");

                    category = new CategoryDTO(code, name, qty, imagePath);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return category;
    }
}

