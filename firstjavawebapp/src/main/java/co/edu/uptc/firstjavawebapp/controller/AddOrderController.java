package co.edu.uptc.firstjavawebapp.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import co.edu.uptc.firstjavawebapp.model.Order;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/addorder")
public class AddOrderController extends HttpServlet {
    private List<Order> orderList = new ArrayList<>();

    public AddOrderController() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // You can handle GET requests here if needed
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String orderId = req.getParameter("order_id");
            String customerDocument = req.getParameter("customer_document");
            String orderDate = req.getParameter("order_date");
            String productDescription = req.getParameter("product_description");
            String orderStatus = req.getParameter("order_status");

            Order order = new Order(orderId, customerDocument, orderDate, productDescription, orderStatus);
            orderList.add(order);

            req.getSession().setAttribute("oper", "success");
            req.getSession().setAttribute("orderlist", orderList);
            resp.sendRedirect("confirm.html");
        } catch (Exception e) {
            resp.sendRedirect("/error.html");
        }
    }
}
