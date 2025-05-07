package co.edu.uptc.firstjavawebapp.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import co.edu.uptc.firstjavawebapp.model.Customer;
import co.edu.uptc.firstjavawebapp.model.Employee;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/addcustomer")
public class AddCustomerController extends HttpServlet{
    private List<Customer> customerList = new ArrayList<Customer>();

    public AddCustomerController() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // TODO Auto-generated method stub
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("cust_id"));
            String name = req.getParameter("cust_name");
            String email = req.getParameter("cust_email");
            String address = req.getParameter("cust_address");
            Customer cust = new Customer();
            cust.setId(id);
            cust.setName(name);
            cust.setEmail(email);
            cust.setAddress(address);
            customerList.add(cust);
            req.getSession().setAttribute("oper", "success");
            req.getSession().setAttribute("customerlist", customerList);
            resp.sendRedirect("confirmcustomer.html");
        } catch (IOException e) {
            resp.sendRedirect("/error.html");
        }
    }

    
    

}
