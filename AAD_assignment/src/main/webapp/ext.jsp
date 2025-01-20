<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Home Page</title>--%>
<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">--%>
<%--    <link href="https://cdn.jsdelivr.net/npm/@sweetalert2/theme-dark@4/dark.css" rel="stylesheet">--%>
<%--    <style>--%>
<%--        body {--%>
<%--            background-color: white;--%>
<%--            font-family: 'Arial', sans-serif;--%>
<%--        }--%>

<%--        .hero-section {--%>
<%--            background: url('https://via.placeholder.com/1200x600') no-repeat center center/cover;--%>
<%--            height: 100vh;--%>
<%--            color: white;--%>
<%--            text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.6);--%>
<%--        }--%>

<%--        .feature-section {--%>
<%--            background-color: #343a40;--%>
<%--            padding: 50px 0;--%>
<%--            color: white;--%>
<%--        }--%>

<%--        .feature-card {--%>
<%--            background-color: #495057;--%>
<%--            border-radius: 10px;--%>
<%--            padding: 30px;--%>
<%--            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);--%>
<%--            transition: all 0.3s ease;--%>
<%--        }--%>

<%--        .feature-card:hover {--%>
<%--            transform: scale(1.05);--%>
<%--        }--%>

<%--        .btn-custom {--%>
<%--            background-color: #007bff;--%>
<%--            color: white;--%>
<%--            border-radius: 5px;--%>
<%--        }--%>

<%--        .btn-custom:hover {--%>
<%--            background-color: #0056b3;--%>
<%--        }--%>

<%--        .footer {--%>
<%--            background-color: #343a40;--%>
<%--            color: white;--%>
<%--            text-align: center;--%>
<%--            padding: 20px 0;--%>
<%--        }--%>
<%--    </style>--%>
<%--</head>--%>

<%--<body>--%>

<%--<!-- Hero Section -->--%>
<%--<section class="hero-section d-flex justify-content-center align-items-center text-center">--%>
<%--    <div>--%>
<%--        <h1 class="display-4">Welcome to Our Management System</h1>--%>
<%--        <p class="lead">Your one-stop solution for managing products and customers.</p>--%>
<%--        <a href="product-save.jsp" class="btn btn-custom btn-lg">Get Started</a>--%>
<%--    </div>--%>
<%--</section>--%>

<%--<!-- Feature Section -->--%>
<%--<section class="feature-section text-center">--%>
<%--    <div class="container">--%>
<%--        <h2 class="mb-5">Our Features</h2>--%>
<%--        <div class="row">--%>
<%--            <div class="col-md-4">--%>
<%--                <div class="feature-card">--%>
<%--                    <h4>Product Management</h4>--%>
<%--                    <p>Manage all your products efficiently with easy-to-use interfaces.</p>--%>
<%--                    <a href="product-save.jsp" class="btn btn-light">Explore</a>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col-md-4">--%>
<%--                <div class="feature-card">--%>
<%--                    <h4>Customer Management</h4>--%>
<%--                    <p>Handle customer details and transactions with ease.</p>--%>
<%--                    <a href="customer-save.jsp" class="btn btn-light">Explore</a>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col-md-4">--%>
<%--                <div class="feature-card">--%>
<%--                    <h4>Reporting & Analytics</h4>--%>
<%--                    <p>Generate insightful reports to understand your business better.</p>--%>
<%--                    <a href="report.jsp" class="btn btn-light">Explore</a>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</section>--%>

<%--<!-- Footer Section -->--%>
<%--<section class="footer">--%>
<%--    <p>&copy; 2025 Your Company. All Rights Reserved.</p>--%>
<%--</section>--%>

<%--<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>--%>
<%--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>--%>

<%--</body>--%>
<%--</html>--%>

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
            <h1 class="display-4">Item form</h1>
        </header>
    </div>
    <form class="row g-3 p-3" action="product-save" method="post">
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
            <button type="submit" class="btn btn-primary">Register</button>
            <%--            <button type="submit" class="btn btn-primary">View</button>--%>
            <%--            <button type="submit" class="btn btn-primary">Delete</button>--%>
            <%--            <button type="submit" class="btn btn-danger" name="action" value="delete">Delete</button>--%>
        </div>


    </form>

</section>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>



<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: black;
            font-family: 'Arial', sans-serif;
        }
        .container-section {
            background-color: #343a40;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        form {
            box-shadow: 2px 6px 100px white;
        }
        .custom-img {
            width: 200px; /* Adjust image width */
            height: auto; /* Maintain aspect ratio */
        }
    </style>
</head>
<body>
<section class="container my-2 bg-dark w-50 text-light p-3">
    <div class="container-section bg-dark text-light py-2">
        <header class="text-center">
            <h3>Login page</h3>
        </header>
    </div>
    <form class="row g-3 p-3" action="customer-save" method="post">
        <div class="card mb-3" style="max-width: 540px;">
            <div class="row g-0">
                <div class="col-md-4">
                    <img src="<%= request.getContextPath() %>/resources/images/log.jpg" class="img-fluid rounded-start custom-img" alt="Image">
                </div>
                <div class="col-md-8">
                    <div class="card-body">
                        <h5 class="card-title">Card title</h5>
                        <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                        <p class="card-text"><small class="text-body-secondary">Last updated 3 mins ago</small></p>
                    </div>
                </div>
            </div>
        </div>
    </form>
</section>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

