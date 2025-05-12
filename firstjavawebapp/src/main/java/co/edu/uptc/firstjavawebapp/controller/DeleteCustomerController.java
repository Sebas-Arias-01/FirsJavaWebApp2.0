package co.edu.uptc.firstjavawebapp.controller;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import co.edu.uptc.firstjavawebapp.model.Customer;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/deletecustomer")
public class DeleteCustomerController extends HttpServlet{
     @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                String idParam = request.getParameter("id");
if (idParam == null || idParam.trim().isEmpty()) {
    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID no válido.");
    return;
}

int id = -1;
try {
    id = Integer.parseInt(idParam);
} catch (NumberFormatException e) {
    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID no válido.");
    return;
}
        String confirm = request.getParameter("confirm");
        List<Customer> customerList = (List<Customer>) request.getSession().getAttribute("customerlist");
        
        if (confirm == null || confirm.equals("false")) {

            for (Customer cust : customerList) {
                if (cust.getId() == id) {
                    request.setAttribute("customer", cust);
                    break;
                }
            }
            request.getRequestDispatcher("WEB-INF/jsp/deletecustomer.jsp").forward(request, response);
        } else {

            Iterator<Customer> iterator = customerList.iterator();
            while (iterator.hasNext()) {
                Customer cust = iterator.next();
                if (cust.getId() == id) {
                    iterator.remove();
                    break;
                }
            }

            response.sendRedirect("customers");
        }
    }

}
