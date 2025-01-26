package org.example.aad_assignment.Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.example.aad_assignment.DTO.CartDTO;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CartsServlet", value = "/CartsServlet")
public class CartsServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productCode = request.getParameter("productCode");
        String productName = request.getParameter("productName");
        String quantityStr = request.getParameter("quantity");
        String unitPriceStr = request.getParameter("unitPrice");
        String customerName = request.getParameter("customerName");

        if (productCode == null || productName == null || quantityStr == null || unitPriceStr == null || customerName == null) {
            response.sendRedirect("placeOrder.jsp?error=Missing required fields.");
            return;
        }

        int quantity = Integer.parseInt(quantityStr);
        double unitPrice = Double.parseDouble(unitPriceStr);
        double totalPrice = quantity * unitPrice;

        // Create CartDTO object
        CartDTO cartItem = new CartDTO();
        cartItem.setProductCode(Integer.parseInt(productCode));
        cartItem.setProductName(productName);
        cartItem.setQty(quantity);
        cartItem.setPrice(unitPrice);
        cartItem.setTotalPrice(totalPrice);
        cartItem.setCustomerName(customerName);

        HttpSession session = request.getSession();
        List<CartDTO> cart = (List<CartDTO>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
            session.setAttribute("cart", cart);
        }

        // Add the CartDTO to the session cart list
        cart.add(cartItem);

        response.sendRedirect("placeOrder.jsp?message=Item added to cart successfully.");
    }
}
