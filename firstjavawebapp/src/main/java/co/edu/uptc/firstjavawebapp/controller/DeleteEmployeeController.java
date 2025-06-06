package co.edu.uptc.firstjavawebapp.controller;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import co.edu.uptc.firstjavawebapp.model.Employee;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/delete")
public class DeleteEmployeeController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String confirm = request.getParameter("confirm");
        List<Employee> list = (List<Employee>) request.getSession().getAttribute("employeelist");

        if (confirm == null || confirm.equals("false")) {

            for (Employee emp : list) {
                if (emp.getId() == id) {
                    request.setAttribute("employee", emp);
                    break;
                }
            }
            request.getRequestDispatcher("WEB-INF/jsp/deletemplyee.jsp").forward(request, response);
        } else {

            Iterator<Employee> iterator = list.iterator();
            while (iterator.hasNext()) {
                Employee emp = iterator.next();
                if (emp.getId() == id) {
                    iterator.remove();
                    break;
                }
            }

            response.sendRedirect("employees");
        }
    }

}
