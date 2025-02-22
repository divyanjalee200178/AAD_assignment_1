<%@ page import="org.example.aad_assignment.DTO.CategoryDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.aad_assignment.Servlet.CategoryService" %><%--
  Created by IntelliJ IDEA.
  User: Dilan Madusanka
  Date: 1/22/2025
  Time: 4:10 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer side dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<style>
    body {
        background-image: url('<%= request.getContextPath() %>/resources/images/d17.jpg');
        background-size: cover;
        background-repeat: no-repeat;
        background-attachment: fixed;
        font-family: 'Arial', sans-serif;
        margin: 0;
        padding: 0;
    }

    .navbar {
        position: fixed;
        top: 0;
        width: 100%;
        z-index: 1000;
        background: rgba(0, 0, 0, 0.9);
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .navbar .form-control {
        border: 1px solid #007bff;
    }

    .navbar .btn-outline-success {
        border-color: #00ff7f;
        color: #00ff7f;
    }

    .navbar .btn-outline-success:hover {
        background-color: #00ff7f;
        color: white;
    }

    .container {
        margin-top: 150px;
        padding: 15px;
        background: rgba(255, 255, 255, 0.3);
        border-radius: 10px;
        box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
        backdrop-filter: blur(10px);
        -webkit-backdrop-filter: blur(10px);
        border: 1px solid rgba(255, 255, 255, 0.18);
        max-width: 1200px;
        margin-left: auto;
        margin-right: auto;
    }

    .card {
        width: 100%;
        margin: 10px 0;
        transition: all 0.3s ease;
        /*border: 4px solid white;*/
        border-radius: 10px;
        /*box-shadow: 2px 2px 8px rgba(0, 0, 0, 0.6);*/
        background: rgba(255, 255, 255, 0.3);
        box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
        backdrop-filter: blur(10px);
        -webkit-backdrop-filter: blur(10px);
        border: 1px solid rgba(255, 255, 255, 0.18);
    }

    .row {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
    }

    .card:hover {
        transform: scale(1.05);
        box-shadow: 0px 6px 10px rgba(0, 0, 0, 0.2);
    }

    .card img {
        width: 100%;
        height: 150px;
        object-fit: cover;
        border-top-left-radius: 8px;
        border-top-right-radius: 8px;
    }

    .card-body {
        background-color: #fff;
        padding: 20px;
        text-align: center;
        border-bottom-left-radius: 8px;
        border-bottom-right-radius: 8px;
    }

    .card-title {
        font-size: 1.25rem;
        font-weight: bold;
        color: #343a40;
    }

    .card-text {
        font-size: 0.9rem;
        color: #6c757d;
    }

    .btn-primary {
        background-color: #007bff;
        border: none;
        transition: background-color 0.3s ease;
    }

    .btn-primary:hover {
        background-color: #0056b3;
    }

    .col-md-3 {
        flex: 1 1 22%;
        box-sizing: border-box;
    }
</style>


<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp">Home</a>
        <div class="d-flex justify-content-center w-100">
            <form class="d-flex" style="max-width: 400px; width: 100%;">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>
        <div class="collapse navbar-collapse justify-content-end">
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="customerCategory-view">Category</a></li>
                <li class="nav-item"><a class="nav-link" href="customerProduct-view">Product</a></li>
                <li class="nav-item"><a class="nav-link" href="placeOrder.jsp">Order</a></li>
                <li class="nav-item"><a class="nav-link" href="user-update.jsp">Profile</a></li>
                <li class="nav-item"><a class="nav-link" href="login.jsp">SignIn</a></li>
                <li class="nav-item"><a class="nav-link" href="user-save.jsp">LogOut</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container text-center">
    <h2 class="mb-5" style="color: #e74c3c; font-size: 2.5rem;">Available Categories</h2>

    <div class="row justify-content-center">
        <%
            CategoryService categoryService = new CategoryService();
            List<CategoryDTO> categories = categoryService.getCategories();
            for (CategoryDTO category : categories) {
        %>
        <div class="col-md-4 mb-5">
            <div class="card category-card">
                <img src="<%= category.getImagePath() %>" class="card-img-top" alt="<%= category.getName() %>">
                <div class="card-body">
                    <h5 class="card-title" style="font-size: 1.5rem; color: darkred;"><%= category.getName() %></h5>
                    <p class="card-text" style="font-size: 1rem; color: blue;"><%= category.getQty() %> items available</p>
                    <a href="addToCart?category=<%= category.getCode() %>" class="btn btn-warning mt-3">Shop Now</a>
                </div>
            </div>
        </div>
        <%
            }
        %>
    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>



</body>
</html>
