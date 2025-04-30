<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
%>

<%@ page import="co.edu.uptc.firstjavawebapp.model.Employee" %>
<%
    Employee emp = (Employee) request.getAttribute("employee");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Eliminar Empleado</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilo6.css">
</head>
<body>
    <div class="topnav">
        <a href="${pageContext.request.contextPath}/introaddemployee">Crear empleado</a>
        <a href="${pageContext.request.contextPath}/menu"> Menu Principal</a>
        <a href="${pageContext.request.contextPath}/employees">Gestionar empleados</a>
        <a href="findemployee">Buscar empleado</a>
    </div>

    <div class="form-container">
        <h1 class="title-delete">¿Estás seguro que deseas eliminar a este empleado?</h1>
        <form action="delete" method="post">
            <input type="hidden" name="id" value="<%= emp.getId() %>"/>

            <p><strong>Nombre:</strong> <%= emp.getName() %></p>
            <p><strong>Email:</strong> <%= emp.getEmail() %></p>
            <p><strong>Teléfono:</strong> <%= emp.getPhone() %></p>

            <button type="submit" class="btn delete-btn">Confirmar Eliminación</button>
        </form>

        <a href="${pageContext.request.contextPath}/employees" class="link-back">Cancelar</a>
    </div>

    <div class="footer">
        <p>© 2025 Employee App. Todos los derechos reservados.</p>
    </div>
</body>
</html>
