<%@ page import="java.util.List" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="org.example.aad_assignment.DTO.ProductDTO" %>
<%@ page import="org.example.aad_assignment.DTO.CartDTO" %>
<%@ page import="org.example.aad_assignment.Servlet.ProductService" %>

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

    .card {
        width: 100%;
        margin: 10px 0;
        border-radius: 12px;
        background: rgba(255, 255, 255, 0.9);
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        transition: all 0.3s ease;
        backdrop-filter: blur(8px);
        -webkit-backdrop-filter: blur(8px);
    }

    /* Card hover effect */
    .card:hover {
        transform: translateY(-5px);
        box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
    }

    /* Card image styling */
    .card img {
        width: 100%;
        height: 200px;
        object-fit: cover;
        border-top-left-radius: 12px;
        border-top-right-radius: 12px;
    }

    /* Card body styling */
    .card-body {
        padding: 20px;
        text-align: center;
        background-color: #fff;
        border-bottom-left-radius: 12px;
        border-bottom-right-radius: 12px;
    }


    .card-title {
        font-size: 1.4rem;
        font-weight: bold;
        color: #2c3e50;
        margin-bottom: 10px;
    }
    .row {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
    }


    .card-text {
        font-size: 1.1rem;
        color: #34495e;
        margin-bottom: 15px;
    }


    .btn-warning {
        background-color: #e67e22;
        border: none;
        padding: 10px 20px;
        font-size: 1rem;
        transition: all 0.3s ease;
    }

    /* Button hover effect */
    .btn-warning:hover {
        background-color: #d35400;
        transform: translateY(-2px);
    }

    /* Responsive design for smaller screens */
    @media (max-width: 768px) {
        .col-md-4 {
            flex: 1 1 100%;
            margin-bottom: 20px;
        }
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

<% if (message != null) { %>
<div style="color: green"><%= message %></div>
<% } %>

<% if (error != null) { %>
<div style="color: red"><%= error %></div>
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
                <li class="nav-item"><a class="nav-link" href="product-delete.jsp">Category</a></li>
                <li class="nav-item"><a class="nav-link" href="user-update.jsp">Profile</a></li>
                <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
                <li class="nav-item"><a class="nav-link" href="">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

<section class="set">
    <div class="left-side">
        <h4>Available Items</h4>
        <div class="row justify-content-center">

            <%
                ProductService productService = new ProductService();
                List<ProductDTO> products = productService.getProducts();
                for (ProductDTO product : products) {
            %>
            <div class="col-md-4 mb-5">
                <div class="card category-card" data-code="<%= product.getCode() %>">
                    <%
                        String imagePath = product.getImagePath();
                        if (imagePath != null && !imagePath.isEmpty()) {
                    %>
                    <img src="<%= request.getContextPath() + "/" + imagePath %>" class="card-img-top img-fluid" alt="<%= product.getName() %>">
                    <% } else { %>
                    <img src="<%= request.getContextPath() + "/images/default.png" %>" class="card-img-top img-fluid" alt="Default Image">
                    <% } %>
                    <div class="card-body">
                        <h5 class="card-title" style="font-size: 1.5rem; color: darkred;"><%= product.getName() %></h5>
                        <h5 class="card-title" style="font-size: 1.5rem; color: darkred;"><%= product.getCode() %></h5>
                        <p class="card-text" style="font-size: 1rem; color: blue;">
                            <%= product.getQty() %></p>
                        <p class="card-text" style="font-size: 1rem; color: blue;">
                            <%= product.getUnitPrice() %>
                        </p>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
    </div>
</section>

<section class="container my-2 bg-dark w-50 text-light p-3">
    <div class="container-section bg-dark text-light py-2">
        <header class="text-center">
            <h1 class="display-4">Item form</h1>
        </header>
    </div>
    <form class="row g-3 p-3" action="carts" method="post">
        <h4>Add Product to Cart</h4>
        <div class="mb-3">
            <label for="code" class="form-label">Code</label>
            <input type="text" class="form-control" name="code" id="code" placeholder="Enter product code" readonly>
        </div>
        <div class="mb-3">
            <label for="itemName" class="form-label">Item Name</label>
            <input type="text" class="form-control" name="itemName" id="itemName" placeholder="Item name" readonly>
        </div>
        <div class="mb-3">
            <label for="qty" class="form-label">Quantity</label>
            <input type="number" class="form-control" name="qty" id="qty" placeholder="Quantity" min="1">
        </div>
        <div class="mb-3">
            <label for="price" class="form-label">Price</label>
            <input type="text" class="form-control" name="price" id="price" placeholder="Price" readonly>
        </div>
        <div class="mb-3">
            <label for="userName" class="form-label">Customer Name</label>
            <input type="text" name="customerName" class="form-control" placeholder="User name" id="userName">
        </div>
        <div class="mb-3">
            <label for="qt" class="form-label">Qty</label>
            <input type="number" name="qt" class="form-control" placeholder="qty" id="qt">
        </div>


        <button type="submit" class="btn btn-success btn-lg">Save to Cart</button>
    </form>

    <form >
        <button type="submit" class="btn btn-danger btn-sm">Add to Cart</button>
    </form>

</section>

<section class="container my-3 bg-light p-3">
    <header class="text-center">
        <h2>Cart Details</h2>
    </header>
    <table class="table table-bordered table-striped mt-3" id="cartTable">
        <thead class="table-dark">
        <tr>
            <th>Customer Name</th>
            <th>Product Code</th>
            <th>Product Name</th>
            <th>Quantity</th>
            <th>Unit Price</th>
            <th>Total Price</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<CartDTO> cart = (List<CartDTO>) session.getAttribute("cart");
            if (cart != null) {
                for (CartDTO item : cart) {
        %>
        <tr>
            <td><%= item.getCustomerName() %></td>
            <td><%= item.getProductCode() %></td>
            <td><%= item.getProductName() %></td>
            <td><%= item.getQty() %></td>
            <td><%= item.getPrice() %></td>
            <td><%= item.getTotalPrice() %></td>
        </tr>
        <%
            }
        } else {
        %>
        <tr><td colspan="4" class="text-center"></td></tr>
        <% } %>
        </tbody>
    </table>

    <div class="text-center">
        <form action="place" method="post">
            <button type="submit" class="btn btn-success btn-lg">Place Order</button>
        </form>
    </div>
</section>


<script>
    function addClickListenerToProductCards() {
        const cards = document.querySelectorAll('.category-card');

        cards.forEach(card => {
            card.addEventListener('click', function () {
                const productCode = card.getAttribute('data-code');
                const productName = card.querySelector('.card-title').textContent.trim();
                const productPrice = card.querySelectorAll('.card-text')[1].textContent.trim(); // Get the price from the second .card-text
                const productQty = card.querySelectorAll('.card-text')[0].textContent.trim(); // Get the quantity from the first .card-text

                document.getElementById('code').value = productCode;
                document.getElementById('itemName').value = productName;
                document.getElementById('price').value = productPrice;
                document.getElementById('qty').value = productQty;

                document.getElementById('userName').value = '';
            });
        });
    }

    window.onload = function () {
        addClickListenerToProductCards();
    };


</script>


<script>
    function handleProductSelection() {
        const cards = document.querySelectorAll('.category-card');

        cards.forEach(card => {
            card.addEventListener('click', function () {
                const productCode = card.getAttribute('data-code');
                const productName = card.querySelector('.card-title').textContent.trim();
                const productQty = card.querySelectorAll('.card-text')[0].textContent.trim();
                const productPrice = card.querySelectorAll('.card-text')[1].textContent.trim();

                document.getElementById('code').value = productCode;
                document.getElementById('itemName').value = productName;
                document.getElementById('qty').value = productQty;
                document.getElementById('price').value = productPrice;
                document.getElementById('userName').value = '';
            });
        });
    }


    function addToCart(event) {
        event.preventDefault();

        const productCode = document.getElementById('code').value;
        const productName = document.getElementById('itemName').value;
        const qty = parseInt(document.getElementById('qt').value) || 0;
        const unitPrice = parseFloat(document.getElementById('price').value) || 0;
        const customerName = document.getElementById('userName').value.trim();

        if (!productCode || !productName || qty <= 0 || unitPrice <= 0 || !customerName) {
            alert('Please complete all fields with valid data.');
            return;
        }

        const totalPrice = qty * unitPrice;

        const cartTable = document.getElementById('cartTable').getElementsByTagName('tbody')[0];
        let rowExists = false;

        for (let i = 0; i < cartTable.rows.length; i++) {
            const row = cartTable.rows[i];
            const existingCode = row.cells[1].textContent;

            if (existingCode === productCode) {
                const existingQty = parseInt(row.cells[3].textContent);
                const updatedQty = existingQty + qty;
                const updatedTotalPrice = updatedQty * unitPrice;

                row.cells[3].textContent = updatedQty;
                row.cells[5].textContent = updatedTotalPrice.toFixed(2);

                rowExists = true;
                break;
            }
        }

        if (!rowExists) {
            // Add a new row to the cart
            const newRow = cartTable.insertRow();

            newRow.insertCell(0).textContent = customerName;
            newRow.insertCell(1).textContent = productCode;
            newRow.insertCell(2).textContent = productName;
            newRow.insertCell(3).textContent = qty;
            newRow.insertCell(4).textContent = unitPrice.toFixed(2);
            newRow.insertCell(5).textContent = totalPrice.toFixed(2);
        }

        // Clear input fields
        document.getElementById('code').value = '';
        document.getElementById('itemName').value = '';
        document.getElementById('qt').value = '';
        document.getElementById('price').value = '';
        document.getElementById('userName').value = '';
    }
</script>




<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>