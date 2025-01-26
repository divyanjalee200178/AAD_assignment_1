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

@WebServlet(name = "AddToCartServlet", value = "/addTo")
public class AddToCartServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form data from the request
        String productCode = request.getParameter("code");
        String productName = request.getParameter("itemName");
        String qtyStr = request.getParameter("qty");
        String priceStr = request.getParameter("price");
        String customerName = request.getParameter("customerName");

        // Validate input fields
        if (productCode == null || productCode.isEmpty() ||
                productName == null || productName.isEmpty() ||
                qtyStr == null || qtyStr.isEmpty() ||
                priceStr == null || priceStr.isEmpty() ||
                customerName == null || customerName.isEmpty()) {
            request.setAttribute("message", "Please fill in all the fields.");
            request.getRequestDispatcher("add-to-cart.jsp").forward(request, response);
            return;
        }

        try {
            int qty = Integer.parseInt(qtyStr);
            double price = Double.parseDouble(priceStr);

            // Calculate total price for the item
            double totalPrice = qty * price;

            // Create a CartDTO object for the item
            CartDTO cartItem = new CartDTO();
            cartItem.setId((int) System.currentTimeMillis()); // Use current timestamp as a unique ID
            cartItem.setCustomerName(customerName);
            cartItem.setProductCode(Integer.parseInt(productCode));
            cartItem.setProductName(productName);
            cartItem.setQty(qty);
            cartItem.setPrice(price);
            cartItem.setTotalPrice(totalPrice);

            // Get the current session
            HttpSession session = request.getSession();

            // Retrieve or initialize the cart
            List<CartDTO> cart = (List<CartDTO>) session.getAttribute("cart");
            if (cart == null) {
                cart = new ArrayList<>();
                session.setAttribute("cart", cart);
            }

            // Add the item to the cart
            cart.add(cartItem);

            // Set success message
            request.setAttribute("message", "Item added to cart successfully.");
        } catch (NumberFormatException e) {
            request.setAttribute("message", "Invalid quantity or price format.");
        }

        // Forward back to the same page
        request.getRequestDispatcher("add-to-cart.jsp").forward(request, response);
    }
}