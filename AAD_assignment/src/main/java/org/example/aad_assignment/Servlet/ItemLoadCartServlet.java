package org.example.aad_assignment.Servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.aad_assignment.DTO.ProductDTO;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ItemLoadCartServlet", value = "/addToCart")
public class ItemLoadCartServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost/ecommerce";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Ijse@123";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<ProductDTO> productList=new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection= DriverManager.getConnection(
                    DB_URL,
                    DB_USER,
                    DB_PASSWORD
            );
            String sql="SELECT * FROM product";
            Statement stm=connection.createStatement();
            ResultSet rst=stm.executeQuery(sql);
            while (rst.next()){
                ProductDTO productDTO =new ProductDTO(
                        rst.getInt(1),
                        rst.getString(2),
                        rst.getInt(3),
                        rst.getDouble(4),
                        rst.getString(5)
                );
                productList.add(productDTO);
            }

            req.setAttribute("product", productList);
            RequestDispatcher rd = req.getRequestDispatcher("addToCart.jsp");
            rd.forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Error loading customers: " + e.getMessage());
            RequestDispatcher rd = req.getRequestDispatcher("addToCart.jsp");
            rd.forward(req, resp);
        }
    }
}
