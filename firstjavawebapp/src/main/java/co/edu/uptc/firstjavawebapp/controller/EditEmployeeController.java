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
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
    
            String idParam = request.getParameter("emp_id");
            String name = request.getParameter("emp_name");
            String email = request.getParameter("emp_email");
            String phoneParam = request.getParameter("emp_phone");
    
            List<Employee> list = (List<Employee>) request.getSession().getAttribute("employeelist");
    
            int id = Integer.parseInt(idParam);
    
            if (name == null || email == null || phoneParam == null) {
                // Solo llegó el ID → Mostrar el formulario de edición
                for (Employee emp : list) {
                    if (emp.getId() == id) {
                        request.setAttribute("employee", emp);
                        break;
                    }
                }
                request.getRequestDispatcher("WEB-INF/jsp/editEmployee.jsp").forward(request, response);
            } else {
                // Llegaron todos los datos → Actualizar empleado
                long phone = Long.parseLong(phoneParam);
    
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
    }
    