<%@ page import="org.example.aad_assignment.DTO.OrderDetailDTO" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Dilan Madusanka
  Date: 1/25/2025
  Time: 1:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View order details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<style>
    body {
        background-image: url('<%= request.getContextPath() %>/resources/images/d29.webp');
        font-family: Arial, sans-serif;
        margin: 0;
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-size: cover;
        color: #333;
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

    h1 {
        text-align: center;
        color: #0056b3;
        margin-bottom: 20px;
    }

    .error {
        color: red;
        font-weight: bold;
        text-align: center;
        margin-bottom: 20px;
    }

    .table-wrapper {
        flex: 1;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 40px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        backdrop-filter: blur(10px);
        -webkit-backdrop-filter: blur(10px);
        border: 1px solid rgba(255, 255, 255, 0.18);
    }


    .table-container {
        width: 80%;
        margin: 0 auto;
        overflow-x: auto;
        border-radius: 8px;
        background: #fff;
        box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
        padding: 20px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin: 0 auto;
    }

    th, td {
        border: 1px solid #ddd;
        padding: 10px;
        text-align: left;
    }

    th {
        background-color: #007bff;
        color: white;
        text-transform: uppercase;
    }

    tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    tr:hover {
        background-color: #f1f1f1;
    }

    td img {
        max-width: 50px;
        max-height: 50px;
        object-fit: contain;
        border-radius: 5px;
    }

    p {
        text-align: center;
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
                <li class="nav-item"><a class="nav-link" href="user-save.jsp">SignUp</a></li>
                <li class="nav-item"><a class="nav-link" href="dashboard.jsp">Dashboard</a></li>
            </ul>
        </div>
    </div>
</nav>


<h1>View Orders</h1>

<%
    String errorMessage = (String) request.getAttribute("error");
    if (errorMessage != null) {
%>
<div class="error">
    <%= errorMessage %>
</div>
<%
    }
%>

<div class="table-wrapper">
    <%
        List<OrderDetailDTO> dataList = (List<OrderDetailDTO>) request.getAttribute("orderDetails");
        if (dataList != null && !dataList.isEmpty()) {
    %>
    <div class="table-container">
        <table>
            <thead>
            <tr>
                <th>ID</th>
                <th>OrderId</th>
                <th>Product name</th>
                <th>Qty</th>
                <th>Unit price</th>
                <th>Total price</th>
            </tr>
            </thead>
            <tbody>
            <%
                for (OrderDetailDTO orderDetail : dataList) {
            %>
            <tr>
                <td><%= orderDetail.getId() %></td>
                <td><%= orderDetail.getOrderId() %></td>
                <td><%= orderDetail.getProductName() %></td>
                <td><%= orderDetail.getQuantity() %></td>
                <td><%= orderDetail.getUnitPrice() %></td>
                <td><%= orderDetail.getTotalPrice() %></td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
    <%
    } else {
    %>
    <p>No order details found.</p>
    <%
        }
    %>

</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
