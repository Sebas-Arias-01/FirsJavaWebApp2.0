package co.edu.uptc.firstjavawebapp.controller;

import java.io.IOException;
import java.util.List;

import co.edu.uptc.firstjavawebapp.model.Employee;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/findemployee")
public class FindEmployee extends HttpServlet {

    public FindEmployee() {
        super();
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    
    String searchId = request.getParameter("searchId");

    if (searchId != null && !searchId.trim().isEmpty()) {
        List<Employee> list = (List<Employee>) request.getSession().getAttribute("employeelist");
        Employee found = null;

        if (list != null) {
            for (Employee emp : list) {
                if (String.valueOf(emp.getId()).equals(searchId)) {
                    found = emp;
                    break;
                }
            }
        }

        // Pasa el empleado encontrado (o null) al JSP
        request.setAttribute("employeeFound", found);
    }

    request.getRequestDispatcher("/findemployee.jsp").forward(request, response);
}

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("WEB-INF/jsp/findemployee.jsp").forward(req, resp);
    }

}