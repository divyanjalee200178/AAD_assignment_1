<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Dilan Madusanka
  Date: 1/24/2025
  Time: 11:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add to cart</title>
</head>
<body>
<%
    List<HashMap<String, String>> cart = (List<HashMap<String, String>>) session.getAttribute("cart");
    if (cart == null) {
        cart = new ArrayList<>();
    }

    String customerId = request.getParameter("customer_id");
    String customerName = request.getParameter("customer_name");
    String productName = request.getParameter("product_name");
    String quantity = request.getParameter("item_qty");
    String unitPrice = request.getParameter("item_unitPrice");

    double totalPrice = Double.parseDouble(quantity) * Double.parseDouble(unitPrice);

    HashMap<String, String> cartItem = new HashMap<>();
    cartItem.put("customerId", customerId);
    cartItem.put("customerName", customerName);
    cartItem.put("productName", productName);
    cartItem.put("quantity", quantity);
    cartItem.put("unitPrice", unitPrice);
    cartItem.put("totalPrice", String.valueOf(totalPrice));
    cart.add(cartItem);

    session.setAttribute("cart", cart);

    response.sendRedirect("index.jsp");
%>

</body>
</html>
