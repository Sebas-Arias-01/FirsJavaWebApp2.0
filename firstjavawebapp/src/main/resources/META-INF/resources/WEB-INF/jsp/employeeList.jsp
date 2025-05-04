<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<%@ page import="java.util.*, co.edu.uptc.firstjavawebapp.model.Employee" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Lista de Empleados</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilo4.css">
</head>
<body>
    <div class="topnav">
        <a href="${pageContext.request.contextPath}/menu"> Menu Principal</a>
        <a href="${pageContext.request.contextPath}/introaddemployee">Crear empleado</a>
        <a href="${pageContext.request.contextPath}/employees">Gestionar empleados</a>
        <a href="findemployee">Buscar empleado</a>
    </div>

    <div class="content">
        <h1 class="title">Empleados</h1>
        <table class="employee-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Email</th>
                    <th>Teléfono</th>
                    <th>Acción</th>
                </tr>
            </thead>
            <tbody>
            <%
                List<Employee> list = (List<Employee>) session.getAttribute("employeelist");
                if (list != null && !list.isEmpty()) {
                    for (Employee emp : list) {
            %>
                <tr>
                    <td><%= emp.getId() %></td>
                    <td><%= emp.getName() %></td>
                    <td><%= emp.getEmail() %></td>
                    <td><%= emp.getPhone() %></td>
                    <td>
                        <!-- Botón MODIFICAR como formulario POST ocultando el ID -->
                        <form action="edit" method="post" style="display:inline;">
                            <input type="hidden" name="emp_id" value="<%= emp.getId() %>">
                            <button type="submit" class="btn edit">Modificar</button>
                        </form>

                        <form action="delete" method="post" style="display:inline;">
                            <input type="hidden" name="id" value="<%= emp.getId() %>">
                            <input type="hidden" name="confirm" value="false">
                            <button type="submit" class="btn delete">Eliminar</button>
                        </form>
                        
                    </td>
                </tr>
            <%
                    }
                } else {
            %>
                <tr>
                    <td colspan="5">No hay empleados registrados.</td>
                </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>

    <div class="footer">
        <p>© 2025 Employee App. Todos los derechos reservados.</p>
    </div>
</body>
</html>
