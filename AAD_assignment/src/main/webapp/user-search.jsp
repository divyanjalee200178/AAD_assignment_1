<%@ page import="org.example.aad_assignment.DTO.CustomerDTO" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  Date: 1/25/2025
  Time: 4:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search customer</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<style>
    body {
        background-color: black;
        color: #e0e0e0;
        font-family: 'Helvetica', sans-serif;
    }

    .navbar {
        margin-bottom: 30px;
    }



    h1 {
        font-size: 2.5rem;
        font-weight: 600;
        text-align: center;
        color: #fff;
        margin-top: 50px;
        margin-bottom: 20px;
    }

    .container {
        max-width: 900px;
        margin-top: 50px;
        padding: 40px;
        background: rgba(255, 255, 255, 0.3);
        border-radius: 10px;
        box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
        backdrop-filter: blur(10px);
        -webkit-backdrop-filter: blur(10px);
        border: 1px solid rgba(255, 255, 255, 0.18);
    }

    .form-control {
        background-color: #333;
        color: #fff;
        border: 1px solid #555;
        border-radius: 8px;
        padding: 15px;
        margin-bottom: 20px;
    }

    .form-control:focus {
        background-color: #444;
        border-color: #1f78d1;
        box-shadow: 0 0 8px rgba(31, 120, 209, 0.5);
    }

    .btn-primary {
        background-color: #1f78d1;
        border: none;
        color: #fff;
        font-size: 1.1rem;
        padding: 12px 20px;
        border-radius: 10px;
        width: 100%;
        transition: 0.3s;
    }

    .btn-primary:hover {
        background-color: #155fa0;
    }

    .card {
        background-color: #282828;
        border-radius: 10px;
        border: none;
        margin-bottom: 20px;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.15);
    }

    .card-header {
        background-color: #1f78d1;
        color: white;
        padding: 20px;
        font-size: 1.2rem;
        text-align: center;
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
    }

    .card-body {
        padding: 30px;
        color: #bbb;
    }

    .card-body input {
        margin-bottom: 15px;
    }




    .no-products {
        color: #999;
        text-align: center;
        font-size: 1.3rem;
    }
</style>

<body>
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
                <li class="nav-item"><a class="nav-link" href="user-save.jsp">Customer</a></li>
                <li class="nav-item"><a class="nav-link" href="dashboard.jsp">Login</a></li>
                <li class="nav-item"><a class="nav-link" href="logout.jsp">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <form action="user-search" method="get">
        <h1>Search Users</h1>

        <div class="mb-3">
            <label for="searchCus" class="form-label">User Name</label>
            <input type="text" class="form-control" id="searchCus" style="color: white" name="searchCus" placeholder="Enter customer name" value="<%= request.getParameter("searchCus") != null ? request.getParameter("searchCat") : "" %>">
        </div>

        <button type="submit" class="btn btn-primary">Search</button>
    </form>
</div>


<div class="container my-4">
    <%
        List<CustomerDTO> customers = (List<CustomerDTO>) request.getAttribute("customers");
        if (customers != null && !customers.isEmpty()) {
            for (CustomerDTO customer : customers) {
    %>
    <div class="card">
        <div class="card-header">
            <%= customer.getName() %>
        </div>
        <div class="card-body">
            <div class="mb-3">
                <label for="name_<%= customer.getId() %>" class="form-label">Name</label>
                <input type="text" class="form-control" id="name_<%= customer.getId() %>" name="name_<%= customer.getId() %>" value="<%= customer.getName() %>">
            </div>

            <div class="mb-3">
                <label for="email_<%= customer.getId() %>" class="form-label">Email</label>
                <input type="text" class="form-control" id="email_<%= customer.getId() %>" name="email_<%= customer.getId() %>" value="<%= customer.getEmail() %>">
            </div>

            <div class="mb-3">
                <label for="number_<%= customer.getId() %>" class="form-label">Number</label>
                <input type="text" class="form-control" id="number_<%= customer.getId() %>" name="number_<%= customer.getId() %>" value="<%= customer.getNumber() %>">
            </div>

            <div class="mb-3">
                <label for="role_<%= customer.getId() %>" class="form-label">Role</label>
                <input type="text" class="form-control" id="role_<%= customer.getId() %>" name="role_<%= customer.getId() %>" value="<%= customer.getRole() %>">
            </div>

        </div>

    </div>
    <%
        }
    } else {
    %>
    <div class="no-products">
        <p>No products found.</p>
    </div>
    <%
        }
    %>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

