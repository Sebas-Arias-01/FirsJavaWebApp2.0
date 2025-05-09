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

@WebServlet("/Addorder")
public class AddOrderController extends HttpServlet {
    private List<Order> orderList = new ArrayList<>();

    public AddOrderController() {
        super();
    }

    // // Mostrar formulario addorder.jsp
    // @Override
    // protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    //     RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/jsp/addorder.jsp");
    //     rd.forward(req, resp);
    // }

    // Procesar formulario enviado
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
            resp.sendRedirect("confirmorder.html");
        } catch (Exception e) {
            resp.sendRedirect("/error.html");
        }
    }
}
