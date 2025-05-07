package co.edu.uptc.firstjavawebapp.controller;

import java.io.IOException;
import java.util.List;

import co.edu.uptc.firstjavawebapp.model.Customer;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/editcustomer")
public class EditCustomerController extends HttpServlet{

    @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
    
            String idParam = request.getParameter("cust_id");
            String name = request.getParameter("cust_name");
            String email = request.getParameter("cust_email");
            String address = request.getParameter("cust_address");
    
            List<Customer> customerList = (List<Customer>) request.getSession().getAttribute("customerlist");
    
            int id = Integer.parseInt(idParam);
    
            if (name == null || email == null || address == null) {
                // Solo llegó el ID → Mostrar el formulario de edición
                for (Customer cust : customerList) {
                    if (cust.getId() == id) {
                        request.setAttribute("customer", cust);
                        break;
                    }
                }
                request.getRequestDispatcher("WEB-INF/jsp/editCustomer.jsp").forward(request, response);
            } else {
    
                for (Customer cust : customerList) {
                    if (cust.getId() == id) {
                        cust.setName(name);
                        cust.setEmail(email);
                        cust.setAddress(address);
                        break;
                    }
                }
                response.sendRedirect("customers");
            }
        }

}
