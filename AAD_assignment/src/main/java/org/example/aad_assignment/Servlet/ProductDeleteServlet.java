package org.example.aad_assignment.Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet(name = "ProductDeleteServlet", value = "/product-delete")
public class ProductDeleteServlet extends HttpServlet {
    String DB_URL="jdbc:mysql://localhost/ecommerce";
    String DB_USER="root";
    String DB_PASSWORD="Ijse@123";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String item_name = req.getParameter("item_name");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(
                    DB_URL,
                    DB_USER,
                    DB_PASSWORD
            );

            String sql="DELETE FROM product WHERE name=?";
            PreparedStatement pstm=connection.prepareStatement(sql);
            pstm.setString(1,item_name);

            int effectRowCount=pstm.executeUpdate();

            if (effectRowCount>0){
                resp.sendRedirect(
                        "product-delete.jsp?message=Item deleted successfully"
                );
            }else {
                resp.sendRedirect(
                        "product-delete.jsp?message=Item  deleted"
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect(
                    "product-delete.jsp?message=Item deleted successfully"
            );
        }
    }
}
