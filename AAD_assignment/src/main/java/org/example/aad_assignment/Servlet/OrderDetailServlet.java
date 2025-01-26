package org.example.aad_assignment.Servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.aad_assignment.DTO.CustomerDTO;
import org.example.aad_assignment.DTO.OrderDetailDTO;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "OrderDetailServlet", value = "/orderDetail-view")
public class OrderDetailServlet extends HttpServlet {
    String DB_URL="jdbc:mysql://localhost/ecommerce";
    String DB_USER="root";
    String DB_PASSWORD="Ijse@123";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<OrderDetailDTO> orderDetailList=new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection= DriverManager.getConnection(
                    DB_URL,
                    DB_USER,
                    DB_PASSWORD
            );
            String sql="SELECT * FROM order_items";
            Statement stm=connection.createStatement();
            ResultSet rst=stm.executeQuery(sql);
            while (rst.next()){
                OrderDetailDTO orderDetailDTO=new OrderDetailDTO(
                        rst.getInt(1),
                        rst.getInt(2),
                        rst.getString(3),
                        rst.getInt(4),
                        rst.getDouble(5),
                        rst.getDouble(6)
                );
                orderDetailList.add(orderDetailDTO);
            }

            req.setAttribute("orderDetails", orderDetailList);
            RequestDispatcher rd = req.getRequestDispatcher("orderDetail-view.jsp");
            rd.forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Error loading orders: " + e.getMessage());
            RequestDispatcher rd = req.getRequestDispatcher("orderDetail-view.jsp");
            rd.forward(req, resp);
        }
    }
}
