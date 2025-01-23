package org.example.aad_assignment.Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.aad_assignment.DTO.PlaceOrderDTO;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/placeOrders")
public class PlaceOrderServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        String dateParam = request.getParameter("date");

        LocalDate date = LocalDate.parse(dateParam);


        PlaceOrderDTO placeOrderDTO = new PlaceOrderDTO();
        placeOrderDTO.setDate(date);
        placeOrderDTO.setC_name(request.getParameter("customer_name"));
        placeOrderDTO.setP_name(request.getParameter("product_name"));


        response.getWriter().println("Order placed successfully for date: " + placeOrderDTO.getDate());
    }
}
