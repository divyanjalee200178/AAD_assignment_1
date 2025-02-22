<%@ page import="org.example.aad_assignment.DTO.ProductDTO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add to Cart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<style>
    body {
        background-image: url('<%= request.getContextPath() %>/resources/images/d21.webp');
        background-size: cover;
        background-repeat: no-repeat;
        background-attachment: fixed;
        font-family: 'Arial', sans-serif;
        margin: 0;
        padding: 0;
    }



    .set {
        display: flex;
        justify-content: space-between;
        margin-top: 20px;
        backdrop-filter: blur(10px);
        -webkit-backdrop-filter: blur(10px);
        background: rgba(255, 255, 255, 0.2);
        border-radius: 10px;
        padding: 20px;
        box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
        border: 1px solid rgba(255, 255, 255, 0.18);
        /*display: flex;*/
        /*justify-content: space-between;*/
        /*margin-top: 20px;*/
    }

    .left-side {
        flex: 2;
        padding: 20px;
        margin: 10px;
        color: black;
        /*border-radius: 8px;*/
        /*box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);*/
        backdrop-filter: blur(10px);
        -webkit-backdrop-filter: blur(10px);
        background: rgba(255, 255, 255, 0.2);
        border-radius: 10px;
        box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
        border: 1px solid rgba(255, 255, 255, 0.18);
    }

    .display-4{
        color: black;
        font-size: 1.4rem;
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

    .right-side {
        flex: 1;
        padding: 20px;
        margin: 10px;
        background-color: #6c757d;
        color: white;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    table {
        width: 100%;
        border-collapse: collapse;
    }

    table, th, td {
        border: 1px solid white;
    }

    th, td {
        padding: 8px;
        text-align: center;
    }

    th {
        background-color: #495057;
    }

    img {
        max-width: 80px;
        max-height: 60px;
        object-fit: contain;
    }
</style>

<body>
<section class="container my-2  w-75 text-light p-3">
    <div class="container-section ">
        <header class="text-center">
            <h3 class="display-4">Add to Cart</h3>
        </header>
    </div>

    <section class="set">
        <div class="left-side">
            <h4>Available Items</h4>

            <%
                // Fetching the list of products to display
                List<ProductDTO> dataList = (List<ProductDTO>) request.getAttribute("product");
                if (dataList != null && !dataList.isEmpty()) {
            %>
            <div class="row">
                <%
                    for (ProductDTO product : dataList) {
                %>
                <div class="col-md-4 mb-5">
                    <div class="card product-card" onclick="fillForm('<%= product.getCode() %>', '<%= product.getName() %>', <%= product.getQty() %>, <%= product.getUnitPrice() %>)">
                        <img src="<%= request.getContextPath() + "/" + product.getImagePath() %>" class="card-img-top" alt="<%= product.getName() %>" style="height: 200px; object-fit: cover;">
                        <div class="card-body">
                            <h5 class="card-title" style="font-size: 1.5rem; color: darkred;"><%= product.getName() %></h5>
                            <p class="card-text" style="font-size: 1rem; color: blue;">
                                Code: <%= product.getCode() %><br>
                                Qty Available: <%= product.getQty() %><br>
                                Price: $<%= product.getUnitPrice() %>
                            </p>
                            <a href="addToCart?code=<%= product.getCode() %>" class="btn btn-warning mt-3">Add to Cart</a>
                        </div>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
            <%
            } else {
            %>
            <p>No products available.</p>
            <%
                }
            %>
        </div>
        <div class="right-side">
            <h4>Add Item to Cart</h4>
            <form action="cart" method="post">
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

                <div class="action-category">
                    <button type="submit" class="btn btn-danger btn-sm">Add to cart</button>
                </div>
                <div>
                    <%= request.getAttribute("message") != null ? request.getAttribute("message") : "" %>
                </div>
            </form>
        </div>
    </section>
</section>

<script>
    // JavaScript function to fill the form when a product card is clicked
    function fillForm(code, name, qty, price) {
        // Fill the form fields with the product details
        document.getElementById('code').value = code;
        document.getElementById('itemName').value = name;
        document.getElementById('qty').value = qty;
        document.getElementById('price').value = '$' + price.toFixed(2); // format price to 2 decimal places
        document.getElementById('userName').value = ''; // Optionally reset customer name field
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>