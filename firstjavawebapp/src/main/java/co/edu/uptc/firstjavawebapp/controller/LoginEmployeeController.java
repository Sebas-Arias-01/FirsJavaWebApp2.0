package co.edu.uptc.firstjavawebapp.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import co.edu.uptc.firstjavawebapp.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginEmployeeController extends HttpServlet{

    private List<User> userList = new ArrayList<>();

    @Override
    public void init() throws ServletException {
        userList.add(new User("admin", "1234"));
        userList.add(new User("maria", "clave"));
        userList.add(new User("user1", "pass1"));
    }

    public LoginEmployeeController() {
        super();
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userid = req.getParameter("userid");
        String password = req.getParameter("password");

        User authenticatedUser = null;
        for (User u : userList) {
            if (u.getUserid().equals(userid) && u.getPassword().equals(password)) {
                authenticatedUser = u;
                break;
            }
        }

        if (authenticatedUser != null) {
            HttpSession session = req.getSession();
            session.setAttribute("user", authenticatedUser);
            resp.sendRedirect("/employeeapp/menu");
        } else {
            resp.sendRedirect("WEB-INF/jsp/index.jsp?error=1");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    


}
