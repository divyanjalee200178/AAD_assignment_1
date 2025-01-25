package org.example.aad_assignment.Servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.aad_assignment.DTO.ProductDTO;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


@WebServlet(name = "ProductSearchServlet", value = "/product-search")
public class productSearchServlet extends HttpServlet {
    String DB_URL="jdbc:mysql://localhost/ecommerce";
    String DB_USER="root";
    String DB_PASSWORD="Ijse@123";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<ProductDTO> products = new ArrayList<>();

        String searchTerm = req.getParameter("searchTerm");

        try {
            // Connect to the database
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // SQL query to search for products
            String sql;
            if (searchTerm != null && !searchTerm.isEmpty()) {
                sql = "SELECT * FROM product WHERE name LIKE ?";
            } else {
                sql = "SELECT * FROM product";
            }

            PreparedStatement statement = connection.prepareStatement(sql);
            if (searchTerm != null && !searchTerm.isEmpty()) {
                statement.setString(1, "%" + searchTerm + "%");
            }
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                ProductDTO product = new ProductDTO(
                        resultSet.getInt("code"),
                        resultSet.getString("name"),
                        resultSet.getInt("qty"),
                        resultSet.getDouble("unitPrice"),
                        resultSet.getString("image_path")
                );

                products.add(product);
            }

            // Set the product list in the request scope
            req.setAttribute("products", products);

            // Forward to the JSP
            RequestDispatcher dispatcher = req.getRequestDispatcher("product-search.jsp");
            dispatcher.forward(req, resp);

        } catch (SQLException | ClassNotFoundException e) {
            throw new ServletException("Database connection or query failed", e);
        }
    }
}