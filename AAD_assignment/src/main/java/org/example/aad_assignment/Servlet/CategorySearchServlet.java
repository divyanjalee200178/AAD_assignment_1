package org.example.aad_assignment.Servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.aad_assignment.DTO.CategoryDTO;
import org.example.aad_assignment.DTO.ProductDTO;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CategorySearchServlet", value = "/category-search")
public class CategorySearchServlet extends HttpServlet {
    String DB_URL="jdbc:mysql://localhost/ecommerce";
    String DB_USER="root";
    String DB_PASSWORD="Ijse@123";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<CategoryDTO> categoryDTOList = new ArrayList<>();

        String searchTerm = req.getParameter("searchCat");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            String sql;
            if (searchTerm != null && !searchTerm.isEmpty()) {
                sql = "SELECT * FROM category WHERE name LIKE ?";
            } else {
                sql = "SELECT * FROM category";
            }

            PreparedStatement statement = connection.prepareStatement(sql);
            if (searchTerm != null && !searchTerm.isEmpty()) {
                statement.setString(1, "%" + searchTerm + "%");
            }
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                CategoryDTO categoryDTO = new CategoryDTO(
                        resultSet.getInt("code"),
                        resultSet.getString("name"),
                        resultSet.getInt("qty"),
                        resultSet.getString("image_path")
                );

                categoryDTOList.add(categoryDTO);
            }

            req.setAttribute("categories", categoryDTOList);

            RequestDispatcher dispatcher = req.getRequestDispatcher("category-search.jsp");
            dispatcher.forward(req, resp);

        } catch (SQLException | ClassNotFoundException e) {
            throw new ServletException("Database connection or query failed", e);
        }
    }

}
