package co.edu.uptc.firstjavawebapp.controller;

import java.io.IOException;
import java.util.List;

import co.edu.uptc.firstjavawebapp.model.Employee;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/edit")
public class EditEmployeeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        List<Employee> list = (List<Employee>) request.getSession().getAttribute("employeelist");

        for (Employee emp : list) {
            if (emp.getId() == id) {
                request.setAttribute("employee", emp);
                break;
            }
        }

        request.getRequestDispatcher("WEB-INF/jsp/editEmployee.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("emp_id"));
        String name = request.getParameter("emp_name");
        String email = request.getParameter("emp_email");
        long phone = Long.parseLong(request.getParameter("emp_phone"));

        List<Employee> list = (List<Employee>) request.getSession().getAttribute("employeelist");
        for (Employee emp : list) {
            if (emp.getId() == id) {
                emp.setName(name);
                emp.setEmail(email);
                emp.setPhone(phone);
                break;
            }
        }

        response.sendRedirect("employees");
    }
}
