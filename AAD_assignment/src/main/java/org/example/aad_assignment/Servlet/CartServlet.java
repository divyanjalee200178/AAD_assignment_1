package org.example.aad_assignment.Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.aad_assignment.DTO.CartDTO;
import org.example.aad_assignment.Servlet.ProductsService;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "CartServlet", value = "/carts")
public class CartServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost/ecommerce";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Ijse@123";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String customerName = request.getParameter("customerName");
        String productCode = request.getParameter("code");
        String productName = request.getParameter("itemName");
        String qtyStr = request.getParameter("qty");
        String priceStr = request.getParameter("price");

        if (isNullOrEmpty(customerName, productCode, productName, qtyStr, priceStr)) {
            redirectToPageWithMessage(request, response, "Please fill out all fields.", "error");
            return;
        }

        try {
            int qty = Integer.parseInt(qtyStr);
            double price = Double.parseDouble(priceStr);
            double totalPrice = qty * price;

            ProductsService productService = new ProductsService();

            try {
                productService.addToCart(customerName, productCode, productName, price, qty, totalPrice);
                redirectToPageWithMessage(request, response, "Item added to cart successfully!", "success");
            } catch (SQLException e) {
                e.printStackTrace();
                redirectToPageWithMessage(request, response, "Failed to add item to cart. " + e.getMessage(), "error");
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            redirectToPageWithMessage(request, response, "An error occurred. Please try again.", "error");
        }
    }

    private boolean isNullOrEmpty(String... values) {
        for (String value : values) {
            if (value == null || value.trim().isEmpty()) {
                return true;
            }
        }
        return false;
    }

    private void redirectToPageWithMessage(HttpServletRequest request, HttpServletResponse response, String message, String type) throws ServletException, IOException {
        request.setAttribute("message", message);
        request.setAttribute("type", type);
        request.getRequestDispatcher("placeOrder.jsp").forward(request, response);
    }
}