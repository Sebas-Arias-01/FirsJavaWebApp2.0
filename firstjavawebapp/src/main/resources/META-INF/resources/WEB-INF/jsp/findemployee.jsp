<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <% request.setCharacterEncoding("UTF-8"); %>
        <%@ page import="java.util.*, co.edu.uptc.firstjavawebapp.model.Employee" %>
            <!DOCTYPE html>
            <html lang="es">

            <head>
                <meta charset="UTF-8">
                <title>Buscar Empleado</title>
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilo4.css">
            </head>

            <body>
                <div class="topnav">
                    <a href="${pageContext.request.contextPath}/menu"> Menu Principal</a>
                    <a href="${pageContext.request.contextPath}/introaddemployee">Crear empleado</a>
                    <a href="${pageContext.request.contextPath}/employees">Gestionar empleados</a>
                </div>

                <div class="content">
                    <h1 class="title">Buscar Empleado por ID</h1>

                    <form action="findemployee" method="post" >
                        <label for="searchId">ID del empleado:</label>
                        <input type="text" id="searchId" name="searchId" required>
                        <button type="submit">Buscar</button>
                    </form>

                    <% String searchId=request.getParameter("searchId"); if (searchId !=null &&
                        !searchId.trim().isEmpty()) { List<Employee> list = (List<Employee>)
                            session.getAttribute("employeelist");
                            Employee found = null;
                            if (list != null) {
                            for (Employee emp : list) {
                            if (String.valueOf(emp.getId()).equals(searchId)) {
                            found = emp;
                            break;
                            }
                            }
                            }
                            %>
                            <% if (found !=null) { %>
                                <table class="employee-table" style="margin-top: 20px; width: 50%;">
                                    <tr>
                                        <th>ID</th>
                                        <td>
                                            <%= found.getId() %>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Nombre</th>
                                        <td>
                                            <%= found.getName() %>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Email</th>
                                        <td>
                                            <%= found.getEmail() %>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Teléfono</th>
                                        <td>
                                            <%= found.getPhone() %>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Acciones</th>
                                        <td>
                                            <a href="edit?id=<%= found.getId() %>" class="btn edit">Modificar</a>
                                            <a href="delete?id=<%= found.getId() %>" class="btn delete">Eliminar</a>
                                        </td>
                                    </tr>
                                </table>
                                <% } else { %>
                                    <p style="margin-top: 20px;">Empleado con ID <strong>
                                            <%= searchId %>
                                        </strong> no encontrado.</p>
                                    <% } } %>
                </div>

                <div class="footer">
                    <p>© 2025 Employee App. Todos los derechos reservados.</p>
                </div>
            </body>

            </html>