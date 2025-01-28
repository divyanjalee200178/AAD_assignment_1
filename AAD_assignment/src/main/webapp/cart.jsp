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
    }

    .left-side {
        flex: 2;
        padding: 20px;
        margin: 10px;
        color: black;
        backdrop-filter: blur(10px);
        -webkit-backdrop-filter: blur(10px);
        background: rgba(255, 255, 255, 0.2);
        border-radius: 10px;
        box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
        border: 1px solid rgba(255, 255, 255, 0.18);
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
<section class="container my-2 w-75 text-light p-3">
    <div class="container-section ">
        <header class="text-center">
            <h3 class="display-4">Add to Cart</h3>
        </header>
    </div>

    <section class="set">
        <div class="left-side">
            <h4>Available Items</h4>

            <%
                List<ProductDTO> dataList = (List<ProductDTO>) request.getAttribute("product");
                if (dataList != null && !dataList.isEmpty()) {
            %>
            <table>
                <thead>
                <tr>
                    <th>Code</th>
                    <th>Name</th>
                    <th>Qty</th>
                    <th>UnitPrice</th>
                    <th>Image</th>
                </tr>
                </thead>
                <tbody id="itemTableBody">
                <%
                    for (ProductDTO product : dataList) {
                %>
                <tr>
                    <td><%= product.getCode() %></td>
                    <td><%= product.getName() %></td>
                    <td><%= product.getQty()%></td>
                    <td><%= product.getUnitPrice() %></td>
                    <td>
                        <%
                            String imagePath = product.getImagePath();
                            if (imagePath != null && !imagePath.isEmpty()) {
                        %>
                        <img src="<%= request.getContextPath() + "/" + imagePath %>" alt="Product Image">
                        <%
                        } else {
                        %>
                        <p>No image available</p>
                        <%
                            }
                        %>
                    </td>
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
            <%
            } else {
            %>
            <p>No products found.</p>
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
                    <button type="submit" class="btn btn-danger btn-sm">Add to Cart</button>
                </div>
                <div>

                    <%= request.getAttribute("message") != null ? request.getAttribute("message") : "" %>
                </div>
            </form>
        </div>
    </section>


</section>

<script>
    const table = document.getElementById('itemTableBody');
    const rows = table.getElementsByTagName('tr');

    // Add click event to each row to select the product
    for (let row of rows) {
        row.addEventListener('click', function () {
            const cells = row.getElementsByTagName('td');
            document.getElementById('code').value = cells[0].textContent.trim();
            document.getElementById('itemName').value = cells[1].textContent.trim();
            document.getElementById('qty').value = cells[2].textContent.trim();
            document.getElementById('price').value = cells[3].textContent.trim();
            document.getElementById('userName').value = '';
        });
    }


</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>