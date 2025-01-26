<%--
  Created by IntelliJ IDEA.
  User: Dilan Madusanka
  Date: 1/26/2025
  Time: 9:35 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%@ page import="org.example.aad_assignment.DTO.CartDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Shopping Cart</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp">Home</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item"><a class="nav-link" href="product-save.jsp">Item</a></li>
        <li class="nav-item"><a class="nav-link" href="product-delete.jsp">Category</a></li>
        <li class="nav-item"><a class="nav-link" href="user-update.jsp">Profile</a></li>
        <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
        <li class="nav-item"><a class="nav-link" href="">Logout</a></li>
      </ul>
    </div>
  </div>
</nav>

<div class="container my-4">
  <h2 class="text-center">Shopping Cart</h2>

  <%
    List<CartDTO> cart = (List<CartDTO>) session.getAttribute("");
    if (cart != null && !cart.isEmpty()) {
  %>
  <table class="table table-bordered">
    <thead>
    <tr>
      <th>Product Code</th>
      <th>Product Name</th>
      <th>Quantity</th>
      <th>Unit Price</th>
      <th>Total Price</th>
      <th>Customer Name</th>
    </tr>
    </thead>
    <tbody>
    <% for (CartDTO item : cart) { %>
    <tr>
      <td><%= item.getProductCode() %></td>
      <td><%= item.getProductName() %></td>
      <td><%= item.getQty() %></td>
      <td><%= item.getPrice() %></td>
      <td><%= item.getTotalPrice() %></td>
      <td><%= item.getCustomerName() %></td>
    </tr>
    <% } %>
    </tbody>
  </table>



  <% } else { %>
  <div class="alert alert-info">
    Your cart is empty. <a href="index.jsp">Continue shopping</a>.
  </div>
  <% } %>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

