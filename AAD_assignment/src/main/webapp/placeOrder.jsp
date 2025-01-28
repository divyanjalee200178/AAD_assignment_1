<%@ page import="java.util.List" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="org.example.aad_assignment.DTO.CartItemDTO" %><%--
  Created by IntelliJ IDEA.
  Date: 1/20/2025
  Time: 10:19 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Place Order</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<style>
    body {
        background-image: url('<%= request.getContextPath() %>/resources/images/d20.webp');
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

    .container-section {
        background-color: white;
        padding: 30px;
        border-radius: 8px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    form {
        box-shadow: 2px 6px 100px white;
    }

    .action-section {
        display: flex;
        justify-content: center;
        align-items: center;
        gap: 15px;
        margin-top: 20px;
    }

    .action-item {
        background-color: #343a40;
        padding: 10px 15px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        text-align: center;
        transition: transform 0.3s ease-in-out;
        margin: 0 5px;
    }

    .action-item:hover {
        transform: translateY(-5px);
        box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
    }

    .action-item span {
        font-size: 1rem;
        font-weight: bold;
        color: #f8f9fa;
        display: block;
        margin-bottom: 5px;
    }

    .action-item a {
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


</style>

<body>
<%
    String message = request.getParameter("message");
    String error = request.getParameter("error");
%>
<%
    if (message != null) {
%>
<div style="color: green"><%= message %></div>
<%
    }
%>

<%
    if (error != null) {
%>
<div style="color: red"><%= error %></div>
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
                <li class="nav-item"><a class="nav-link" href="user-update.jsp">Profile</a></li>
                <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
                <li class="nav-item"><a class="nav-link" href="">Logout</a></li>
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
    <form class="row g-3 p-3" action="CartServlet" method="post">
        <%
            String predefinedDate = "2025-01-20";
        %>
        <div class="col-md-6">
            <label for="date" class="form-label">Date</label>
            <input type="date" class="form-control" id="date" name="date" value="<%= predefinedDate %>">
        </div>

        <div class="col-md-6">
            <label for="inputState" class="form-label">Customer Name</label>
            <select id="inputState" class="form-select" name="customer_name">
                <option selected>Choose...</option>
                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection connection = DriverManager.getConnection(
                                "jdbc:mysql://localhost/ecommerce",
                                "root",
                                "Ijse@123"
                        );
                        Statement st = connection.createStatement();
                        String query = "SELECT id, name FROM users WHERE role = 'customer'";

                        ResultSet rst = st.executeQuery(query);
                        while (rst.next()) {
                %>
                <option data-id="<%= rst.getString("id") %>"><%= rst.getString("name") %></option>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </select>
        </div>

        <div class="col-md-6">
            <label for="id" class="form-label">Customer Id</label>
            <input type="text" class="form-control" id="id" name="customer_id">
        </div>

        <div class="col-md-6">
            <label for="product" class="form-label">Product Name</label>
            <select id="product" class="form-select" name="product_name">
                <option selected>Choose...</option>
                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection connection = DriverManager.getConnection(
                                "jdbc:mysql://localhost/ecommerce",
                                "root",
                                "Ijse@123"
                        );
                        Statement statement = connection.createStatement();
                        String query = "SELECT code, name, qty, unitPrice FROM product";
                        ResultSet resultSet = statement.executeQuery(query);
                        while (resultSet.next()) {
                %>
                <option
                        data-code="<%= resultSet.getString("code") %>"
                        data-qty="<%= resultSet.getInt("qty") %>"
                        data-unitPrice="<%= resultSet.getDouble("unitPrice") %>">
                    <%= resultSet.getString("name") %>
                </option>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </select>
        </div>

        <div class="col-md-6">
            <label for="qty" class="form-label">Qty</label>
            <input type="number" class="form-control" id="qty" name="item_qty">
        </div>

        <div class="col-md-6">
            <label for="unit_price" class="form-label">Unit price</label>
            <input type="text" class="form-control" id="unit_price" name="item_unitPrice">
        </div>

        <div class="col-md-6">
            <label for="quantity" class="form-label">QtyOnHand</label>
            <input type="number" class="form-control" id="quantity" name="item_quantity">
        </div>



        <div class="col-12 text-center mt-4">
            <div>
                <button type="submit" class="btn btn-primary btn-lg w-50 mb-3">Add to cart</button>
            </div>
        </div>
    </form>
</section>

<section class="container my-3 bg-light p-3">
    <header class="text-center">
        <h2>Cart Details</h2>
    </header>
    <table class="table table-bordered table-striped mt-3" id="cartTable">
        <thead class="table-dark">
        <tr>
            <th>CustomerId</th>
            <th>Product Name</th>
            <th>Quantity</th>
            <th>Unit Price</th>
            <th>Total Price</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<CartItemDTO> cart = (List<CartItemDTO>) session.getAttribute("cart");
            if (cart != null) {
                for (CartItemDTO item : cart) {
        %>
        <tr>
            <td><%= item.getCustomerId() %></td>
            <td><%= item.getProductName() %></td>
            <td><%= item.getQuantity() %></td>
            <td><%= item.getUnitPrice() %></td>
            <td><%= item.getTotalPrice() %></td>
        </tr>
        <%
            }
        } else {
        %>
        <tr><td colspan="4" class="text-center">No items in cart</td></tr>
        <% } %>
        </tbody>
    </table>

    <div class="text-center">
        <form action="PlaceOrderServlet" method="post">
            <button type="submit" class="btn btn-success btn-lg">Place Order</button>
        </form>
    </div>
</section>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
    document.getElementById("inputState").addEventListener("change", function() {
        var customerNameSelect = this;
        var customerIdInput = document.getElementById("id");

        var selectedOption = customerNameSelect.options[customerNameSelect.selectedIndex];

        var customerId = selectedOption.getAttribute("data-id");

        customerIdInput.value = customerId;
    });


    document.getElementById("product").addEventListener("change", function () {
        var productSelect = this;
        var selectedOption = productSelect.options[productSelect.selectedIndex];
        var productQty = selectedOption.getAttribute("data-qty");
        var productUnitPrice = selectedOption.getAttribute("data-unitPrice");
        document.getElementById("qty").value = productQty || "";
        document.getElementById("unit_price").value = productUnitPrice || "";
    });
</script>




</body>
</html>