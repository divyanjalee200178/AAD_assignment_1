<%@ page import="org.example.aad_assignment.DTO.ProductDTO" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>Customer List</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
        .error {
            color: red;
            font-weight: bold;
        }
    </style>
</head>
<body>
<h1>View Customers</h1>

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

<%
    List<ProductDTO> dataList = (List<ProductDTO>) request.getAttribute("products");
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
    <tbody>
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
</body>
</html>
