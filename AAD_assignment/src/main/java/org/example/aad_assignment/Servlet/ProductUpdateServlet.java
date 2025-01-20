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

@WebServlet(name = "ProductUpdateServlet", value = "/product-update")
public class ProductUpdateServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost/Management_system";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Ijse@123";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String code=req.getParameter("item_code");
        String name=req.getParameter("item_name");
        int qty= Integer.parseInt(req.getParameter("item_qty"));
        double unitPrice= Double.parseDouble(req.getParameter("item_unitPrice"));


        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection= DriverManager.getConnection(
                    DB_URL,
                    DB_USER,
                    DB_PASSWORD
            );

            String sql = "UPDATE product SET name=?, qty=?, unitPrice=? WHERE code=?";
            PreparedStatement pstm=connection.prepareStatement(sql);
            pstm.setString(1,name);
            pstm.setInt(2,qty);
            pstm.setDouble(3,unitPrice);
            pstm.setString(4,code);


            int effectRowCount=pstm.executeUpdate();

            if (effectRowCount>0){
                resp.sendRedirect(
                        "product-update.jsp?message=Product updated successfully"
                );
            }else {
                resp.sendRedirect(
                        "product-update.jsp?message=Product updated unsuccessfully"
                );
            }
        }catch (Exception e){
            e.printStackTrace();
            resp.sendRedirect(
                    "product-update.jsp?=Product updated successfully"
            );
        }
    }
}
