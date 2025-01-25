<%--
  Created by IntelliJ IDEA.
  User: Dilan Madusanka
  Date: 1/25/2025
  Time: 1:58 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>confirmation</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%
  String orderId = request.getParameter("orderId");
%>
<section class="container my-5">
  <div class="text-center">
    <h1 class="display-4">Order Confirmation</h1>
    <p class="lead">Your order has been successfully placed. Order ID: <%= orderId %></p>
  </div>
</section>
</body>
</html>
