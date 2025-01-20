package org.example.aad_assignment;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet(name = "CustomerUpdateServlet", value = "/customer-update")
public class CustomerUpdateServlet extends HttpServlet {
    String DB_URL="jdbc:mysql://localhost/Management_system";
    String DB_USER="root";
    String DB_PASSWORD="Ijse@123";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String customer_id=req.getParameter("customer_id");
        String customer_name=req.getParameter("customer_name");
        String customer_email=req.getParameter("customer_email");
        String customer_number=req.getParameter("customer_number");
        String customer_password=req.getParameter("customer_password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection= DriverManager.getConnection(
                    DB_URL,
                    DB_USER,
                    DB_PASSWORD
            );
            String sql="UPDATE customer SET name = ?, email = ? ,number = ? ,password = ? WHERE id = ?";
            PreparedStatement pstm=connection.prepareStatement(sql);

            pstm.setString(1,customer_name);
            pstm.setString(2,customer_email);
            pstm.setString(3,customer_number);
            pstm.setString(4,customer_password);
            pstm.setString(5,customer_id);

            int effectRowCount=pstm.executeUpdate();

            if (effectRowCount>0){
                resp.sendRedirect(
                        "customer-update.jsp?message=Customer update successfully"
                );
            }else {
                resp.sendRedirect(
                        "customer-update.jsp?error=Customer not updated"
                );
            }
        }catch (Exception e){
            e.printStackTrace();
            resp.sendRedirect(
                    "customer-update.jsp?error=Customer update unsuccessfully"
            );
        }

    }
}
