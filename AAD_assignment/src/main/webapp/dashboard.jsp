<%@ page import="org.example.aad_assignment.Servlet.CategoryService" %>
<%@ page import="org.example.aad_assignment.DTO.CategoryDTO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /*body {*/
        /*    background-color: #f8f9fa;*/
        /*    font-family: 'Arial', sans-serif;*/
        /*    margin: 0;*/
        /*    padding: 0;*/
        /*    border: 4px solid black;*/
        /*    border-radius: 10px;*/
        /*    box-shadow: 2px 2px 8px rgba(0, 0, 0, 0.6);*/
        /*}*/

        body {
            background-image: url('<%= request.getContextPath() %>/resources/images/d15.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            border: 4px solid black;
            border-radius: 10px;
            box-shadow: 2px 2px 8px rgba(0, 0, 0, 0.6);
        }


    .sidebar {
            height: fit-content;
            width: 250px;
            background-color: #343a40;
            padding-top:100px;
            gap: 30px;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 1000;
            border: 4px solid white;
            border-radius: 10px;
            box-shadow: 2px 2px 8px rgba(0, 0, 0, 0.8);
        }


        .sidebar a {
            display: block;
            padding: 10px;
            color: white;
            text-decoration: none;
            margin-bottom: 10px;
            font-size: 18px;
            transition: all 0.3s ease;
            border: 2px solid transparent;
            border-radius: 8px;
            text-align: center;
            font-weight: bold;
            background: none;
            position: relative;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .sidebar a:before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, #007bff, #0056b3);
            transform: scaleX(0);
            transform-origin: left;
            transition: transform 0.3s ease;
            z-index: -1;
        }

        .sidebar a:hover:before {
            transform: scaleX(1);
            transform-origin: right;
        }

        .sidebar a:hover {
            color: white;
            text-shadow: 0px 2px 5px rgba(255, 255, 255, 0.8);
        }

        .sidebar a:after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            width: 0;
            height: 3px;
            background: white;
            transition: all 0.3s ease;
            transform: translateX(-50%);
        }

        .sidebar a:hover:after {
            width: 80%;
        }


        .main-content {
            margin-left: 250px;
            padding: 20px;
        }

        .header {
            padding: 20px;
            background-color: #007bff;
            color: white;
            font-size: 24px;
            border-radius: 8px;
            margin-bottom: 20px;
            text-align: center;
        }


        #set {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }

        .card {
            width: 18rem;
            transition: all 0.3s ease;
            border: 4px solid white;
            border-radius: 10px;
            box-shadow: 2px 2px 8px rgba(0, 0, 0, 0.6);
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

        .main-content{
            border: 4px solid white;
            border-radius: 10px;
            box-shadow: 2px 2px 8px rgba(0, 0, 0, 0.6);
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
            transition: background-color 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }
        .sidebar>h3{
            color: white;
            text-align: center;
            margin-bottom: 20px;
        }
    </style>
</head>

<body>


<div class="sidebar">
    <h3>Navigation bar</h3>
    <a href="index.jsp">Home</a>
    <a href="category-view">Category Details</a>
    <a href="category-save.jsp">Category manage</a>
    <a href="product-view">Products Details</a>
    <a href="product-save.jsp">Product Manage</a>
    <a href="user-update.jsp">Profile</a>
    <a href="user-save.jsp">User Manage</a>
    <a href="">Log out</a>
    <a href="order-view">Order Details</a>
    <a href="cart-view">Cart Details</a>
</div>


<div class="main-content">
    <div class="header">
        Dashboard Overview
    </div>

    <section class="container my-2">
        <div id="set text-center">
                <h2 class="mb-5" style="color: black; font-size: 2.5rem;">Available Categories</h2>

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

    </section>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
