<%--
  Created by IntelliJ IDEA.
  User: Dilan Madusanka
  Date: 1/26/2025
  Time: 2:06 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="org.example.aad_assignment.DTO.CartDTO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.example.aad_assignment.DTO.CartDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Your Cart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
<section class="container my-2 w-75 text-light p-3">
    <div class="container-section">
        <header class="text-center">
            <h3 class="display-4">Your Cart</h3>
        </header>
    </div>

    <h4>Cart Items</h4>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>ID</th>
            <th>Product Code</th>
            <th>Product Name</th>
            <th>Price</th>
            <th>Qty</th>
            <th>Customer Name</th>
            <th>Total Price</th>
        </tr>
        </thead>
        <tbody>
        <%
            // Get the cart data from session
            List<CartDTO> cartList = (List<CartDTO>) session.getAttribute("cart");
            if (cartList != null && !cartList.isEmpty()) {
                for (CartDTO cart : cartList) {
        %>
        <tr>
            <td><%= cart.getId() %></td>
            <td><%= cart.getProductCode() %></td>
            <td><%= cart.getProductName() %></td>
            <td><%= cart.getPrice() %></td>
            <td><%= cart.getQty() %></td>
            <td><%= cart.getCustomerName() %></td>
            <td><%= cart.getTotalPrice() %></td>
        </tr>
        <% } } else { %>
        <tr><td colspan="7">Your cart is empty.</td></tr>
        <% } %>
        </tbody>
    </table>
</section>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
