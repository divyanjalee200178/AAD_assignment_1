package org.example.aad_assignment.Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.example.aad_assignment.DTO.CartItemDTO;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CartServlet", value = "/CartServlet")
public class CartServlet extends HttpServlet {
    String DB_URL="jdbc:mysql://localhost/ecommerce";
    String DB_USER="root";
    String DB_PASSWORD="Ijse@123";


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String productName = request.getParameter("product_name");
        int quantity = Integer.parseInt(request.getParameter("item_quantity"));
        double unitPrice = Double.parseDouble(request.getParameter("item_unitPrice"));
        String customerId = request.getParameter("customer_id");


        double totalPrice = quantity * unitPrice;


        CartItemDTO item = new CartItemDTO();
        item.setProductName(productName);
        item.setQuantity(quantity);
        item.setUnitPrice(unitPrice);
        item.setTotalPrice(totalPrice);
        item.setCustomerId(customerId);


        HttpSession session = request.getSession();
        List<CartItemDTO> cart = (List<CartItemDTO>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
            session.setAttribute("cart", cart);
        }

        cart.add(item);

        response.sendRedirect("placeOrder.jsp");
    }
}