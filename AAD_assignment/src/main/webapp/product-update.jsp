<%--
  Created by IntelliJ IDEA.
  User: Dilan Madusanka
  Date: 1/15/2025
  Time: 11:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product update</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<style>
    body {
        background-color: dimgray;
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

    /*.btn-custom:hover {*/
    /*    background-color: #0056b3;*/
    /*}*/

    .display-4{
        text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.6);
    }

    .alert {
        align-items: center;
        justify-content: center;
        width: fit-content;
        height: fit-content;

    }
</style>

<body>

<%
    String message=request.getParameter("message");
    String error=request.getParameter("error");
%>

<% if (message != null || error != null) { %>
<div id="alert-container" style="display: flex; justify-content: center; align-items: center; height: 100vh; position: absolute; width: 100%;">
    <% if (message != null) { %>
    <div id="alert-success" class="alert alert-success text-center" role="alert">
        <%= message %>
    </div>
    <% } %>

    <% if (error != null) { %>
    <div id="alert-danger" class="alert alert-danger text-center" role="alert">
        <%= error %>
    </div>
    <% } %>
</div>

<script>
    setTimeout(function() {
        var alertContainer = document.getElementById('alert-container');
        alertContainer.style.display = 'none';
    }, 2000);
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
                <li class="nav-item"><a class="nav-link" href="product-update.jsp">Login</a></li>
                <li class="nav-item"><a class="nav-link" href="logout.jsp">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

<section class="container my-2 bg-dark w-50 text-light p-3">
    <div class="container-section bg-dark text-light py-2">
        <header class="text-center">
            <h3 class="display-4">Update form</h3>
        </header>
    </div>
    <form class="row g-3 p-3" action="product-update" method="post" enctype="multipart/form-data">
        <div class="col-md-6">
            <label for="code" class="form-label">Code</label>
            <input type="text" class="form-control" id="code" name="item_code">
        </div>
        <div class="col-md-6">
            <label for="name" class="form-label">Name</label>
            <input type="text" class="form-control" id="name" name="item_name">
        </div>
        <div class="col-md-6">
            <label for="qty" class="form-label">Qty</label>
            <input type="number" class="form-control" id="qty" name="item_qty">
        </div>

        <div class="col-md-6">
            <label for="unitPrice" class="form-label">Unit price</label>
            <input type="text" class="form-control" id="unitPrice" name="item_unitPrice">
        </div>

        <div class="col-md-12">
            <label for="image" class="form-label">Upload an Image:</label>
            <input type="file" id="image" name="image" required>
        </div>


        <div class="col-12">
            <button type="submit" class="btn btn-custom">Update</button>

        </div>


    </form>

</section>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
