package co.edu.uptc.firstjavawebapp.controller;

import java.io.IOException;
import java.util.List;

import co.edu.uptc.firstjavawebapp.model.Order;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/editorder")
public class EditOrder extends HttpServlet {

    @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
    
            String id = request.getParameter("order_id");
            String customerDocument = request.getParameter("customer_document");
            String orderDate = request.getParameter("order_date");
            String productDescription = request.getParameter("product_description");
            String orderStatus = request.getParameter("order_status");
    
            List<Order> orderList = (List<Order>) request.getSession().getAttribute("orderlist");
    
            if (customerDocument == null || orderDate == null || productDescription == null || orderStatus == null) {   
                // Solo llegó el ID → Mostrar el formulario de edición
                for (Order order : orderList) {
                    if (order.getOrderId().equals(id)) {
                        request.setAttribute("order", order);
                        break;
                    }
                }
                request.getRequestDispatcher("WEB-INF/jsp/editorder.jsp").forward(request, response);
            } else {
    
                for (Order order : orderList) {
                    if (order.getOrderId().equals(id)) {
                        order.setCustomerDocument(customerDocument);
                        order.setOrderDate(orderDate);
                        order.setProductDescription(productDescription);
                        order.setOrderStatus(orderStatus);
                        break;
                    }
                }
                response.sendRedirect("orders");
            }
        }
}
