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

@WebServlet (name = "ProductSaveServlet", value = "/product-save")
public class ProductSaveServlet extends HttpServlet {
    String DB_URL="jdbc:mysql://localhost/Management_system";
    String DB_USER="root";
    String DB_PASSWORD="Ijse@123";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        req.setCharacterEncoding("UTF-8");

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

            String sql=" INSERT INTO product (name, qty, unitPrice) VALUES (?, ?, ?)";
            PreparedStatement pstm=connection.prepareStatement(sql);
            pstm.setString(1,name);
            pstm.setInt(2,qty);
            pstm.setDouble(3,unitPrice);


            int effectRowCount=pstm.executeUpdate();

            if (effectRowCount>0){
                resp.sendRedirect(
                        "product-save.jsp?message=Product saved successfully"
                );
            }else {
                resp.sendRedirect(
                        "product-save.jsp?message=Product saved unsuccessfully"
                );
            }
        }catch (Exception e){
            e.printStackTrace();
            resp.sendRedirect(
                    "product-save.jsp?=Product saved successfully"
            );
        }
    }
}
