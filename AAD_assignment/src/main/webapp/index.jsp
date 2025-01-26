<%@ page import="org.example.aad_assignment.DTO.CategoryDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.aad_assignment.Servlet.CategoryService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Home Page</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

  <style>
      body {
          background-color: lightslategray;
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

      main {
          padding-top:0;
      }


      .carousel-item img {
          width: 100%;
          height: 70vh;
          object-fit: cover;
      }
      .card {
          box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
      }
      .footer-cta {
          box-shadow: rgba(0, 0, 0, 0.15) 0px 5px 15px;
      }
      .container {
          margin-top: 50px;
          padding: 5px;
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
                <li class="nav-item"><a class="nav-link" href="login.jsp">SignIn</a></li>
                <li class="nav-item"><a class="nav-link" href="placeOrder.jsp">SignUp</a></li>
            </ul>
        </div>
    </div>
</nav>

<div id="carouselExampleCaptions" class="carousel slide carousel-fade" data-mdb-ride="carousel">
    <div class="carousel-indicators">
        <button
                type="button"
                data-mdb-target="#carouselExampleCaptions"
                data-mdb-slide-to="0"
                class="active"
                aria-current="true"
                aria-label="Slide 1"
        ></button>
        <button
                type="button"
                data-mdb-target="#carouselExampleCaptions"
                data-mdb-slide-to="1"
                aria-label="Slide 2"
        ></button>
        <button
                type="button"
                data-mdb-target="#carouselExampleCaptions"
                data-mdb-slide-to="2"
                aria-label="Slide 3"
        ></button>
    </div>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="<%= request.getContextPath() %>/resources/images/d18.jpg" alt="Description">
            <div class="mask" style="background-color: rgba(0, 0, 0, 0.4)"></div>
            <div class="carousel-caption d-none d-sm-block mb-5">
                <h1 class="mb-4">
                    <strong style="color: #e74c3c;">Welcome to Our <span style="color: #f39c12;">Online Store</span>!</strong>
                </h1>

                <p>
                    <strong style="color: #f39c12;">Shop the best collection of <span style="color: #e74c3c;">watches</span>, <span style="color: #e74c3c;">bags</span>, and <span style="color: #e74c3c;">bottles</span>.</strong>
                </p>

                <p class="mb-4 d-none d-md-block">
                    <strong style="color: #02011b;">Find premium quality products at unbeatable prices. Browse our top-selling categories and discover your next favorite item!</strong>
                </p>


            </div>
        </div>
        <div class="carousel-item">
            <img src="<%= request.getContextPath() %>/resources/images/d18.jpg" alt="Description">

            <div class="mask" style="background-color: rgba(0, 0, 0, 0.4)"></div>
            <div class="carousel-caption d-none d-md-block mb-5">
                <h1 class="mb-4">
                    <strong style="color: #e74c3c;">Welcome to Our <span style="color: #f39c12;">Online Store</span>!</strong>
                </h1>

                <p>
                    <strong style="color: #f39c12;">Shop the best collection of <span style="color: #e74c3c;">watches</span>, <span style="color: #e74c3c;">bags</span>, and <span style="color: #e74c3c;">bottles</span>.</strong>
                </p>

                <p class="mb-4 d-none d-md-block">
                    <strong style="color: #02011b;">Find premium quality products at unbeatable prices. Browse our top-selling categories and discover your next favorite item!</strong>
                </p>


            </div>


        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-mdb-target="#carouselExampleCaptions" data-mdb-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-mdb-target="#carouselExampleCaptions" data-mdb-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>


<main>

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
                        <a href="placeOrder.jsp?category=<%= category.getCode() %>" class="btn btn-warning mt-3">Shop Now</a>
                    </div>
                </div>
            </div>
            <%
                }
            %>
        </div>

        <div class="action-customer mt-5">
            <span style="font-size: 1.2rem; color: #fff;">Want to explore all categories?</span>
            <a href="homeLoadCategories" class="btn btn-outline-light mt-2">See All Categories</a>
        </div>
    </div>

</main>


<footer class="text-center text-white mt-4" style="background-color: #607D8B">

    <div class="pt-4 pb-2">
        <a class="btn btn-outline-white footer-cta mx-2" href="https://mdbootstrap.com/docs/jquery/getting-started/download/" target="_blank" role="button">Download MDB
            <i class="fas fa-download ms-2"></i>
        </a>
        <a class="btn btn-outline-white footer-cta mx-2" href="https://mdbootstrap.com/education/bootstrap/" target="_blank" role="button">Start free tutorial
            <i class="fas fa-graduation-cap ms-2"></i>
        </a>
    </div>

</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
