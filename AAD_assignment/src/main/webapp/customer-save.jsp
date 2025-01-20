<%--
  Created by IntelliJ IDEA.
  User: Dilan Madusanka
  Date: 1/13/2025
  Time: 11:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register Form</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<style>
    body {
        background-image: url('<%= request.getContextPath() %>/resources/images/d18.jpg');
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

    .action-section {
        display: flex;
        justify-content: center;
        align-items: center;
        gap: 15px;
        margin-top: 20px;
    }

    .action-customer {
        background-color: #343a40;
        padding: 10px 15px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        text-align: center;
        transition: transform 0.3s ease-in-out;
        margin: 0 5px;
    }

    .action-customer:hover {
        transform: translateY(-5px);
        box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
    }

    .action-customer span {
        font-size: 1rem;
        font-weight: bold;
        color: #f8f9fa;
        display: block;
        margin-bottom: 5px;
    }

    .action-customer a {
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
                <li class="nav-item"><a class="nav-link" href="category-save.jsp">Category</a></li>
                <li class="nav-item"><a class="nav-link" href="customer-save.jsp">Customer</a></li>
                <li class="nav-item"><a class="nav-link" href="dashboard.jsp">Login</a></li>
                <li class="nav-item"><a class="nav-link" href="logout.jsp">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

<section class="container my-2 bg-dark w-50 text-light p-3">
    <div class="container-section bg-dark text-light py-2">
        <header class="text-center">
            <h3 class="display-4">Register form</h3>
        </header>
    </div>
    <form class="row g-3 p-3" action="customer-save" method="post">
        <div class="col-md-6">
            <label for="name" class="form-label">Name</label>
            <input type="text" class="form-control" id="name" name="customer_name">
        </div>
        <div class="col-md-6">
            <label for="email" class="form-label">Email</label>
            <input type="text" class="form-control" id="email" name="customer_email">
        </div>

        <div class="col-md-6">
            <label for="number" class="form-label">Tele-phone number</label>
            <input type="text" class="form-control" id="number" name="customer_number">
        </div>
        <div class="col-md-6">
            <label for="Password" class="form-label">Password</label>
            <input type="password" class="form-control" id="Password" name="customer_password">
        </div>

        <div class="col-md-6">
            <label for="ConfirmPassword" class="form-label">Confirm Password</label>
            <input type="password" class="form-control" id="ConfirmPassword">
        </div>

        <div class="mb-3">
            <label class="form-label" for="specificSizeSelect">Role</label>
            <select class="form-select" id="specificSizeSelect" name="customer_role" required>
                <option value="" disabled selected style="font-size: 15px">Choose...</option>
                <option value="customer">Customer</option>
                <option value="admin">Admin</option>
            </select>
        </div>


        <div class="col-12 text-center mt-4">
            <button type="submit" class="btn btn-primary btn-lg w-50 mb-3">Register</button>

            <div class="action-section">
                <div class="action-customer">
                    <span>Do you want to delete a Customer?</span>
                    <a href="customer-delete.jsp" class="btn btn-danger btn-sm">Delete</a>
                </div>

                <div class="action-customer">
                    <span>Do you want to update a Customer?</span>
                    <a href="customer-update.jsp" class="btn btn-success btn-sm">Update</a>
                </div>

                <div class="action-customer">
                    <span>Do you want to view a Customer?</span>
                    <a href="customer-view" class="btn btn-warning btn-sm">View</a>
                </div>
            </div>
        </div>



    </form>

</section>





<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>




