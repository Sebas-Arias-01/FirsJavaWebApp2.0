package co.edu.uptc.firstjavawebapp.controller;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import co.edu.uptc.firstjavawebapp.model.Order;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/deleteorder")
public class DeleteOrder extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");
        String confirm = request.getParameter("confirm");
        List<Order> orderList = (List<Order>) request.getSession().getAttribute("orderlist");
        
        if (confirm == null || confirm.equals("false")) {

            for (Order order : orderList) {
                if (order.getOrderId() == id) {
                    request.setAttribute("order", order);
                    break;
                }
            }
            request.getRequestDispatcher("WEB-INF/jsp/deleteorder.jsp").forward(request, response);
        } else {

            Iterator<Order> iterator = orderList.iterator();
            while (iterator.hasNext()) {
                Order order = iterator.next();
                if (order.getOrderId() == id) {
                    iterator.remove();
                    break;
                }
            }

            response.sendRedirect("orders");
        }
    }

}
