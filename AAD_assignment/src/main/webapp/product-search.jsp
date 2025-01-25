<%@ page import="org.example.aad_assignment.DTO.ProductDTO" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  Date: 1/24/2025
  Time: 4:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.example.aad_assignment.DTO.ProductDTO" %>
<%@ page import="java.util.List" %>

<html>
<head>
    <title>Search Product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Global Styles */
        body {
            background-color: white;
            color: #e0e0e0;
            font-family: 'Helvetica', sans-serif;
        }

        h1 {
            font-size: 2.5rem;
            font-weight: 600;
            text-align: center;
            color: #fff;
            margin-top: 50px;
            margin-bottom: 20px;
        }

        .container {
            max-width: 900px;
            margin-top: 50px;
            padding: 40px;
            background-color: #1d1d1d;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }

        .form-control {
            background-color: #333;
            color: #fff;
            border: 1px solid #555;
            border-radius: 8px;
            padding: 15px;
            margin-bottom: 20px;
        }

        .form-control:focus {
            background-color: #444;
            border-color: #1f78d1;
            box-shadow: 0 0 8px rgba(31, 120, 209, 0.5);
        }

        .btn-primary {
            background-color: #1f78d1;
            border: none;
            color: #fff;
            font-size: 1.1rem;
            padding: 12px 20px;
            border-radius: 10px;
            width: 100%;
            transition: 0.3s;
        }

        .btn-primary:hover {
            background-color: #155fa0;
        }

        .card {
            background-color: #282828;
            border-radius: 10px;
            border: none;
            margin-bottom: 20px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.15);
        }

        .card-header {
            background-color: #1f78d1;
            color: white;
            padding: 20px;
            font-size: 1.2rem;
            text-align: center;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }

        .card-body {
            padding: 30px;
            color: #bbb;
        }

        .card-body input {
            margin-bottom: 15px;
        }

        .product-image {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 10px;
            transition: all 0.3s ease;
            margin-bottom: 10px;
        }

        .product-image:hover {
            transform: scale(1.1);
        }

        .card-footer {
            background-color: #333;
            padding: 15px;
            text-align: center;
            border-bottom-left-radius: 10px;
            border-bottom-right-radius: 10px;
        }

        .btn-success {
            background-color: #28a745;
            color: #fff;
            border-radius: 25px;
            padding: 10px 20px;
            border: none;
            font-size: 1rem;
        }

        .btn-success:hover {
            background-color: #218838;
        }

        .no-products {
            color: #999;
            text-align: center;
            font-size: 1.3rem;
        }
    </style>
</head>
<body>

<!-- Search Form -->
<div class="container">
    <form action="product-search" method="get">
        <h1>Search Products</h1>

        <div class="mb-3">
            <label for="searchTerm" class="form-label">Product Name</label>
            <input type="text" class="form-control" id="searchTerm" name="searchTerm" placeholder="Enter product name" value="<%= request.getParameter("searchTerm") != null ? request.getParameter("searchTerm") : "" %>">
        </div>

        <button type="submit" class="btn btn-primary">Search</button>
    </form>
</div>

<!-- Product Results -->
<div class="container my-4">
    <%
        List<ProductDTO> products = (List<ProductDTO>) request.getAttribute("products");
        if (products != null && !products.isEmpty()) {
            for (ProductDTO product : products) {
    %>
    <div class="card">
        <div class="card-header">
            <%= product.getName() %>
        </div>
        <div class="card-body">
            <div class="mb-3">
                <label for="name_<%= product.getCode() %>" class="form-label">Name</label>
                <input type="text" class="form-control" id="name_<%= product.getCode() %>" name="name_<%= product.getCode() %>" value="<%= product.getName() %>">
            </div>

            <div class="mb-3">
                <label for="qty_<%= product.getCode() %>" class="form-label">Quantity</label>
                <input type="number" class="form-control" id="qty_<%= product.getCode() %>" name="qty_<%= product.getCode() %>" value="<%= product.getQty() %>">
            </div>

            <div class="mb-3">
                <label for="unitPrice_<%= product.getCode() %>" class="form-label">Unit Price</label>
                <input type="text" class="form-control" id="unitPrice_<%= product.getCode() %>" name="unitPrice_<%= product.getCode() %>" value="<%= product.getUnitPrice() %>">
            </div>

            <div class="mb-3">
                <label for="image_<%= product.getCode() %>" class="form-label">Image Path</label>
                <input type="text" class="form-control" id="image_<%= product.getCode() %>" name="image_<%= product.getCode() %>" value="<%= product.getImagePath() %>">
            </div>

            <%-- Display Image --%>
            <div class="text-center">
                <% if (product.getImagePath() != null && !product.getImagePath().isEmpty()) { %>
                <img src="<%= product.getImagePath() %>" alt="<%= product.getName() %>" class="product-image">
                <% } else { %>
                <span>No Image</span>
                <% } %>
            </div>
        </div>
        
    </div>
    <%
        }
    } else {
    %>
    <div class="no-products">
        <p>No products found.</p>
    </div>
    <%
        }
    %>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
