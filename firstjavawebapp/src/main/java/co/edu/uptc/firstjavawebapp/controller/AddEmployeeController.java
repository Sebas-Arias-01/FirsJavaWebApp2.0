package co.edu.uptc.firstjavawebapp.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import co.edu.uptc.firstjavawebapp.model.Employee;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/addemployee")
public class AddEmployeeController extends HttpServlet {
    private List<Employee> employeeList = new ArrayList<Employee>();

    public AddEmployeeController() {
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
            int id = Integer.parseInt(req.getParameter("emp_id"));
            String name = req.getParameter("emp_name");
            String email = req.getParameter("emp_email");
            long phone = Long.valueOf(req.getParameter("emp_phone"));
            Employee emp = new Employee();
            emp.setId(id);
            emp.setName(name);
            emp.setEmail(email);
            emp.setPhone(phone);
            employeeList.add(emp);
            req.getSession().setAttribute("oper", "success");
            req.getSession().setAttribute("employeelist", employeeList);
            resp.sendRedirect("confirm.html");
        } catch (IOException e) {
            resp.sendRedirect("/error.html");
        }
    }
}
