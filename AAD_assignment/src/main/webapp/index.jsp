<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Home Page</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
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
</head>

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
        <li class="nav-item"><a class="nav-link" href="login.jsp">Sign in</a></li>
        <li class="nav-item"><a class="nav-link" href="customer-save.jsp">Sign up</a></li>
      </ul>
    </div>
  </div>
</nav>

<div class="container">
  <div class="action-customer">
    <span>Do you want to view available Categories?</span>
    <a href="homeLoadCategories" class="btn btn-warning btn-sm">View</a>
  </div>
  <div class="row">
    <div class="col-md-3">
      <div class="card">
        <img src="<%= request.getContextPath() %>/resources/images/d24.jpg" class="card-img-top" alt="Butter">
        <div class="card-body">
          <h5 class="card-title">Watches</h5>
          <p class="card-text">You can choose the brands you want.</p>
          <a href="addToCart" class="btn btn-primary">See more</a>
        </div>
      </div>
    </div>
    <div class="col-md-3">
      <div class="card">
        <img src="<%= request.getContextPath() %>/resources/images/d25.jpg" class="card-img-top" alt="Juice">
        <div class="card-body">
          <h5 class="card-title">Bags</h5>
          <p class="card-text">You can choose the brands you want.</p>
          <a href="addToCart" class="btn btn-primary">See more</a>
        </div>
      </div>
    </div>
    <div class="col-md-3">
      <div class="card">
        <img src="<%= request.getContextPath() %>/resources/images/d26.jpg" class="card-img-top" alt="Cookies">
        <div class="card-body">
          <h5 class="card-title">Beauty products</h5>
          <p class="card-text">You can choose the brands you want.</p>
          <a href="addToCart" class="btn btn-primary">See more</a>
        </div>
      </div>
    </div>
    <div class="col-md-3">
      <div class="card">
        <img src="<%= request.getContextPath() %>/resources/images/d12.jpg" class="card-img-top" alt="Jewellery">
        <div class="card-body">
          <h5 class="card-title">Jewellery</h5>
          <p class="card-text">You can choose the brands you want.</p>
          <a href="addToCart" class="btn btn-primary">See more</a>
        </div>
      </div>
    </div>

    <div class="col-md-3">
      <div class="card">
        <img src="<%= request.getContextPath() %>/resources/images/d27.jpg" class="card-img-top" alt="Jewellery">
        <div class="card-body">
          <h5 class="card-title">Bottle</h5>
          <p class="card-text">You can choose the brands you want.</p>
          <a href="addToCart" class="btn btn-primary">See more</a>
        </div>
      </div>
    </div>

    <div class="col-md-3">
      <div class="card">
        <img src="<%= request.getContextPath() %>/resources/images/d28.jpeg" class="card-img-top" alt="Biscuits">
        <div class="card-body">
          <h5 class="card-title">Toys</h5>
          <p class="card-text">You can choose the brands you want.</p>
          <a href="addToCart" class="btn btn-primary">See more</a>
        </div>
      </div>
    </div>

    <div class="col-md-3">
      <div class="card">
        <img src="<%= request.getContextPath() %>/resources/images/d10.jpg" class="card-img-top" alt="Shoes">
        <div class="card-body">
          <h5 class="card-title">Shoes</h5>
          <p class="card-text">You can choose the brands you want.</p>
          <a href="addToCart" class="btn btn-primary">See more</a>
        </div>
      </div>
    </div>

    <div class="col-md-3">
      <div class="card">
        <img src="<%= request.getContextPath() %>/resources/images/d11.jpg" class="card-img-top" alt="Clothes">
        <div class="card-body">
          <h5 class="card-title">Clothes</h5>
          <p class="card-text">You can choose the brands you want.</p>
          <a href="addToCart" class="btn btn-primary">See more</a>
        </div>
      </div>
    </div>

  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
