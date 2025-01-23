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

@WebServlet(name = "UserUpdateServlet", value = "/user-update")
public class UserUpdateServlet extends HttpServlet {
    String DB_URL="jdbc:mysql://localhost/ecommerce";
    String DB_USER="root";
    String DB_PASSWORD="Ijse@123";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String user_id=req.getParameter("user_id");
        String user_name=req.getParameter("user_name");
        String user_email=req.getParameter("user_email");
        String user_number=req.getParameter("user_number");
        String user_password=req.getParameter("user_password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection= DriverManager.getConnection(
                    DB_URL,
                    DB_USER,
                    DB_PASSWORD
            );
            String sql="UPDATE users SET name = ?, email = ? ,number = ? ,password = ? WHERE id = ?";
            PreparedStatement pstm=connection.prepareStatement(sql);

            pstm.setString(1,user_name);
            pstm.setString(2,user_email);
            pstm.setString(3,user_number);
            pstm.setString(4,user_password);
            pstm.setString(5,user_id);

            int effectRowCount=pstm.executeUpdate();

            if (effectRowCount>0){
                resp.sendRedirect(
                        "user-update.jsp?message=Customer update successfully"
                );
            }else {
                resp.sendRedirect(
                        "user-update.jsp?error=Customer not updated"
                );
            }
        }catch (Exception e){
            e.printStackTrace();
            resp.sendRedirect(
                    "user-update.jsp?error=Customer update unsuccessfully"
            );
        }

    }
}
