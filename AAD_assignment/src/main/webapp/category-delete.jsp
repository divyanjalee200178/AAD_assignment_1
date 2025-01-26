<%--
  Created by IntelliJ IDEA.
  User: Dilan Madusanka
  Date: 1/21/2025
  Time: 4:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Category</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/@sweetalert2/theme-dark@4/dark.css" rel="stylesheet">
</head>

<style>
    body {
        background-color: black;
        font-family: 'Arial', sans-serif;
    }

    .navbar {
        margin-bottom: 30px;
    }

    .container-section{
        background-color: #343a40;
        padding: 30px;
        border-radius: 8px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    form{
        box-shadow: 2px 6px 100px white;
    }

    .swal2-popup {
        background-color: white !important;
        color: black;
        transform: scale(0.6);
    }

    .swal2-confirm {
        background-color: #007bff !important;
        color: white !important;
    }
</style>

<body>
<%
    String message=request.getParameter("message");
    String error=request.getParameter("error");
%>

<% if (message != null) { %>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        Swal.fire({
            title: "Category saved Successfully!",
            text: '<%= message %>',
            icon: "success",
            draggable: true,  // Enable dragging of the alert
            confirmButtonText: "OK",
            theme: "light"  // Light theme
        });
    });
</script>
<% } %>

<% if (error != null) { %>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        Swal.fire({
            title: "Error",
            text: '<%= error %>',
            icon: "error",
            draggable: true,  // Enable dragging of the alert
            confirmButtonText: "OK",
            theme: "light"  // Light theme
        });
    });
</script>
<% } %>


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
                <li class="nav-item"><a class="nav-link" href="user-save.jsp">Customer</a></li>
                <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
                <li class="nav-item"><a class="nav-link" href="logout.jsp">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

<section class="container my-2 bg-dark w-50 text-light p-3">
    <div class="container-section bg-dark text-light py-2">
        <header class="text-center">
            <h3 class="display-4">Category delete form</h3>
        </header>
    </div>
    <form class="row g-3 p-3" action="category-delete" method="post">
        <div class="col-md-6">
            <label for="name" class="form-label">Name</label>
            <input type="text" class="form-control" id="name" name="category_name">
        </div>
        <div class="col-md-6">
            <label for="qty" class="form-label">Qty</label>
            <input type="number" class="form-control" id="qty" name="category_qty">
        </div>

        <div class="col-md-6">
            <label for="unit_price" class="form-label">Image</label>
            <input type="text" class="form-control" id="unit_price" name="category_image">
        </div>



        <div class="col-12">
            <button type="submit" class="btn btn-primary">Delete</button>
        </div>


    </form>

</section>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
</body>
</html>
