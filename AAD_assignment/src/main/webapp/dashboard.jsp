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
            height: 100vh;
            width: 250px;
            background-color: #343a40;
            padding-top:100px;
            gap: 50px;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 1000;
            border: 4px solid white;
            border-radius: 10px;
            box-shadow: 2px 2px 8px rgba(0, 0, 0, 0.6);
        }

        .sidebar a {
            display: block;
            padding: 15px;
            color: white;
            text-decoration: none;
            margin-bottom: 10px;
            font-size: 18px;
            transition: all 0.3s ease;
        }

        .sidebar a:hover {
            background-color: #007bff;
            border-radius: 5px;
            transform: scale(1.05);
        }

        .main-content {
            margin-left: 250px; /* Space for the sidebar */
            padding: 20px;
        }

        /* Header section */
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
    </style>
</head>

<body>


<div class="sidebar">
    <a href="dashboard.jsp">Dashboard</a>
    <a href="product-save.jsp">Products</a>
    <a href="#">Categories</a>
    <a href="customer-save.jsp">Customers</a>
    <a href="#">Reports</a>
    <a href="#">Settings</a>
</div>


<div class="main-content">
    <div class="header">
        Dashboard Overview
    </div>

    <section class="container my-2">
        <div id="set">
            <div class="card">
                <img src="<%= request.getContextPath() %>/resources/images/d1.webp" class="card-img-top" alt="Placeholder image">
                <div class="card-body">
                    <h5 class="card-title">Butter</h5>
                    <p class="card-text">you can choose the brands you want..</p>
                    <a href="addToCart" class="btn btn-primary">Add to cart</a>
                </div>
            </div>

            <div class="card">
                <img src="<%= request.getContextPath() %>/resources/images/d2.webp" class="card-img-top" alt="Placeholder image">
                <div class="card-body">
                    <h5 class="card-title">Juice</h5>
                    <p class="card-text">you can choose the brands you want..</p>
                    <a href="addToCart" class="btn btn-primary">Add to cart</a>
                </div>
            </div>

            <div class="card">
                <img src="<%= request.getContextPath() %>/resources/images/d3.webp" class="card-img-top" alt="Placeholder image">
                <div class="card-body">
                    <h5 class="card-title">Cookies</h5>
                    <p class="card-text">you can choose the brands you want..</p>
                    <a href="addToCart" class="btn btn-primary">Add to cart</a>
                </div>
            </div>

            <div class="card">
                <img src="<%= request.getContextPath() %>/resources/images/d5.webp" class="card-img-top" alt="Placeholder image">
                <div class="card-body">
                    <h5 class="card-title">Noodles</h5>
                    <p class="card-text">you can choose the brands you want..</p>
                    <a href="addToCart" class="btn btn-primary">Add to cart</a>
                </div>
            </div>

            <div class="card">
                <img src="<%= request.getContextPath() %>/resources/images/d12.jpg" class=card-img-top" alt="Placeholder image">
                <div class="card-body">
                    <h5 class="card-title">Jewellery</h5>
                    <p class="card-text">you can choose the brands you want..</p>
                    <a href="addToCart" class="btn btn-primary">Add to cart</a>
                </div>
            </div>

            <div class="card">
                <img src="<%= request.getContextPath() %>/resources/images/d7.jpg" class="card-img-top" alt="Placeholder image">
                <div class="card-body">
                    <h5 class="card-title">Biscuits</h5>
                    <p class="card-text">you can choose the brands you want..</p>
                    <a href="addToCart" class="btn btn-primary">Add to cart</a>
                </div>
            </div>

            <div class="card">
                <img src="<%= request.getContextPath() %>/resources/images/d10.jpg" class="card-img-top" alt="Placeholder image">
                <div class="card-body">
                    <h5 class="card-title">shoes</h5>
                    <p class="card-text">you can choose the brands you want..</p>
                    <a href="addToCart" class="btn btn-primary">Add to cart</a>
                </div>
            </div>

            <div class="card">
                <img src="<%= request.getContextPath() %>/resources/images/d11.jpg" class="card-img-top" alt="Placeholder image">
                <div class="card-body">
                    <h5 class="card-title">Clothes</h5>
                    <p class="card-text">you can choose the brands you want..</p>
                    <a href="addToCart" class="btn btn-primary">Add to cart</a>
                </div>
            </div>
        </div>
    </section>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
