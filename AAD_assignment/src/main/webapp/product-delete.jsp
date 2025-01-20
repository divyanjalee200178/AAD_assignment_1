<%--
  Created by IntelliJ IDEA.
  User: Dilan Madusanka
  Date: 1/14/2025
  Time: 11:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Item</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
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

    .btn-custom {
        background-color: #007bff;
        color: white;
    }

    .btn-custom:hover {
        background-color: #0056b3;
    }

    .alert {
        margin-top: 15px;
    }
</style>

<body>
<%
    String message=request.getParameter("message");
    String error=request.getParameter("error");
%>

<% if (message != null) { %>
<div class="alert alert-success text-center" role="alert">
    <%= message %>
</div>
<% } %>

<% if (error != null) { %>
<div class="alert alert-danger text-center" role="alert">
    <%= error %>
</div>
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
                <li class="nav-item"><a class="nav-link" href="customer-save.jsp">Customer</a></li>
                <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
                <li class="nav-item"><a class="nav-link" href="logout.jsp">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

<section class="container my-2 bg-dark w-50 text-light p-3">
    <div class="container-section bg-dark text-light py-2">
        <header class="text-center">
            <h3 class="display-4">Item form</h3>
        </header>
    </div>
    <form class="row g-3 p-3" action="product-delete" method="post">
        <div class="col-md-6">
            <label for="name" class="form-label">Name</label>
            <input type="text" class="form-control" id="name" name="item_name">
        </div>
        <div class="col-md-6">
            <label for="qty" class="form-label">Qty</label>
            <input type="number" class="form-control" id="qty" name="item_qty">
        </div>

        <div class="col-md-6">
            <label for="unit_price" class="form-label">Unit price</label>
            <input type="text" class="form-control" id="unit_price" name="item_unitPrice">
        </div>


        <%--        <div>--%>
        <%--        <label for="image">Upload an Image:</label>--%>
        <%--        <input type="file" id="image" name="image" accept="image/*" required>--%>
        <%--        </div>--%>

        <div class="col-md-6">
            <label for="photo" class="form-label">Upload Photo</label>
            <input type="file" class="form-control" id="photo" name="item_photo" accept="image/*">
        </div>

        <div class="col-12">
                        <button type="submit" class="btn btn-primary">Delete</button>
        </div>


    </form>

</section>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<%--<form action="product-delete" method="post">--%>
<%--    <label for="id">code</label><br>--%>
<%--    <input type="number" id="id" name="item_code"/>--%>
<%--    <br><br>--%>
<%--    <button type="submit">Delete Customer</button>--%>
<%--</form>--%>
</body>
</html>
