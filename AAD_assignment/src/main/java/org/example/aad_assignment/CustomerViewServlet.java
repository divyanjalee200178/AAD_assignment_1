package org.example.aad_assignment;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.aad_assignment.DTO.CustomerDTO;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerViewServlet", value = "/customer-view")
public class CustomerViewServlet extends HttpServlet {
    String DB_URL="jdbc:mysql://localhost/Management_system";
    String DB_USER="root";
    String DB_PASSWORD="Ijse@123";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<CustomerDTO> customerList=new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection= DriverManager.getConnection(
                    DB_URL,
                    DB_USER,
                    DB_PASSWORD
            );
            String sql="SELECT * FROM customer";
            Statement stm=connection.createStatement();
            ResultSet rst=stm.executeQuery(sql);
            while (rst.next()){
                CustomerDTO customerDTO=new CustomerDTO(
                        rst.getInt(1),
                        rst.getString(2),
                        rst.getString(3),
                        rst.getInt(4),
                        rst.getString(5),
                        rst.getString(6)
                );
                customerList.add(customerDTO);
            }

            req.setAttribute("customers", customerList);
            RequestDispatcher rd = req.getRequestDispatcher("customer-view.jsp");
            rd.forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Error loading customers: " + e.getMessage());
            RequestDispatcher rd = req.getRequestDispatcher("customer-view.jsp");
            rd.forward(req, resp);
        }
    }
}
