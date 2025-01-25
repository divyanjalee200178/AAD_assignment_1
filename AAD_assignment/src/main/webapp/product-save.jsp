<%--
  Created by IntelliJ IDEA.
  User: Dilan Madusanka
  Date: 1/14/2025
  Time: 6:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add New Product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>


<style>
    body {
        background-image: url('<%= request.getContextPath() %>/resources/images/d20.webp');
        background-size: cover;
        background-repeat: no-repeat;
        background-attachment: fixed;
        font-family: 'Arial', sans-serif;
        margin: 0;
        padding: 0;
    }

    .navbar {
        margin-bottom: 30px;
    }

    .container-section{
        background-color: white;
        padding: 30px;
        border-radius: 8px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    form{
        box-shadow: 2px 6px 100px white;
    }



    .action-section {
        display: flex;
        justify-content: center;
        align-items: center;
        gap: 15px;
        margin-top: 20px;
    }

    .action-item {
        background-color: #343a40;
        padding: 10px 15px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        text-align: center;
        transition: transform 0.3s ease-in-out;
        margin: 0 5px;
    }

    .action-item:hover {
        transform: translateY(-5px);
        box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
    }

    .action-item span {
        font-size: 1rem;
        font-weight: bold;
        color: #f8f9fa;
        display: block;
        margin-bottom: 5px;
    }

    .action-item a {
        padding: 8px 15px;
        font-size: 0.875rem;
        border-radius: 5px;
        text-decoration: none;
        transition: background-color 0.3s ease;
    }

    .btn-danger {
        background-color: #dc3545;
        color: #fff;
    }

    .btn-danger:hover {
        background-color: #bb2d3b;
    }

    .btn-success {
        background-color: #28a745;
        color: #fff;
    }

    .btn-success:hover {
        background-color: #218838;
    }

    .btn-warning {
        background-color: #ffc107;
        color: #212529;
    }

    .btn-warning:hover {
        background-color: #e0a800;
    }

</style>

<body>

<%
    String message=request.getParameter("message");
    String error=request.getParameter("error");
%>
<%
    if (message!=null){

%>
<div style="color: green"><%=message%>
</div>
<%
    }
%>

<%
    if (error!=null){

%>
<div style="color: red"><%=error%>
</div>
<%
    }
%>

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
                <li class="nav-item"><a class="nav-link" href="placeOrder.jsp">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

<section class="container my-2 bg-dark w-50 text-light p-3">
    <div class="container-section bg-dark text-light py-2">
        <header class="text-center">
            <h1 class="display-4">Item form</h1>
        </header>
    </div>
    <form class="row g-3 p-3" action="product-save" method="post" enctype="multipart/form-data">
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

        <div class="col-md-12">
            <label for="image" class="form-label">Upload an Image:</label>
            <input type="file" id="image" name="image" required>
        </div>


<%--        <div>--%>
<%--        <label for="image">Upload an Image:</label>--%>
<%--        <input type="file" id="image" name="image" accept="image/*" required>--%>
<%--        </div>--%>

<%--        <div class="col-md-6">--%>
<%--            <label for="photo" class="form-label">Upload Photo</label>--%>
<%--            <input type="file" class="form-control" id="photo" name="item_photo" accept="image/*">--%>
<%--        </div>--%>

        <div class="col-12 text-center mt-4">
            <div>
                <button type="submit" class="btn btn-primary btn-lg w-50 mb-3">Register</button>
                <button type="submit" class="btn btn-primary btn-lg w-50 mb-3">Back</button>
            </div>


            <div class="action-section">
                <div class="action-item">
                    <span>Do you want to delete a Product?</span>
                    <a href="product-delete.jsp" class="btn btn-danger btn-sm">Delete</a>
                </div>

                <div class="action-item">
                    <span>Do you want to update a Product?</span>
                    <a href="product-update.jsp" class="btn btn-success btn-sm">Update</a>
                </div>

                <div class="action-item">
                    <span>Do you want to view a Product?</span>
                    <a href="product-view" class="btn btn-warning btn-sm">View</a>
                </div>

                <div class="action-item">
                    <span>Do you want to Search a Product?</span>
                    <a href="product-search.jsp" class="btn btn-warning btn-sm">View</a>
                </div>
            </div>
        </div>


    </form>

</section>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
