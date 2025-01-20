<%@ page import="java.util.List" %>
<%@ page import="org.example.aad_assignment.DTO.CustomerDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    List<CustomerDTO> dataList = (List<CustomerDTO>) request.getAttribute("customers");
    if (dataList != null && !dataList.isEmpty()) {
%>
<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Number</th>
        <th>Password</th>
        <th>Role</th>
    </tr>
    </thead>
    <tbody>
    <%
        for (CustomerDTO customer : dataList) {
    %>
    <tr>
        <td><%= customer.getId() %></td>
        <td><%= customer.getName() %></td>
        <td><%= customer.getEmail() %></td>
        <td><%= customer.getNumber() %></td>
        <td><%= customer.getPassword() %></td>
        <td><%= customer.getRole() %></td>
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
