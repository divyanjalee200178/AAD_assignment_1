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
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
            <%
            } else {
            %>
            <p>No customers found.</p>
            <%
                }
            %>
        </div>



        <div class="right-side">
            <h4>Add Item to Cart</h4>
            <form>
                <div class="mb-3">
                    <label for="code" class="form-label">Code</label>
                    <input type="text" class="form-control" id="code" placeholder="quantity">
                </div>
                <div class="mb-3">
                    <label for="itemName" class="form-label">Item Name</label>
                    <input type="text" class="form-control" id="itemName" placeholder="name">
                </div>
                <div class="mb-3">
                    <label for="qty" class="form-label">Qty</label>
                    <input type="number" class="form-control" id="qty" placeholder="quantity">
                </div>
                <div class="mb-3">
                    <label for="price" class="form-label">Price</label>
                    <input type="text" class="form-control" id="price" placeholder="Enter price">
                </div>

                <div class="mb-3">
                    <label for="quantity" class="form-label">Quantity</label>
                    <input type="number" class="form-control" id="quantity" placeholder="Enter quantity">
                </div>

                <button type="submit" class="btn btn-primary w-100">Add to Cart</button>
            </form>
        </div>
    </section>
</section>

<script>
    const table=document.getElementById('itemTableBody');
    const rows=table.getElementsByTagName('tr');

    for (let row of rows){
        row.addEventListener('click', function () {
            const cell=row.getElementsByTagName('td');
            document.getElementById('code').value=cell[0].textContent;
            document.getElementById('itemName').value=cell[1].textContent;
            document.getElementById('price').value=cell[2].textContent;
            document.getElementById('qty').value=cell[3].textContent;
        });
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
