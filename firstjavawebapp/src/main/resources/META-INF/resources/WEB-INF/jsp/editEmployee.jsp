<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<%@ page import="co.edu.uptc.firstjavawebapp.model.Employee" %>
<%
    Employee emp = (Employee) request.getAttribute("employee");
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Editar Empleado</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilo5.css">
</head>
<body>
    <div class="topnav">
        <a href="${pageContext.request.contextPath}/introaddemployee">Crear empleado</a>
        <a href="${pageContext.request.contextPath}/menu"> Menu Principal</a>
        <a href="employees">Gestionar empleados</a>
        <a href="findemployee">Buscar empleado</a>
    </div>
    <br><br><br><br><br><br>
    <div class="form-container">
        <h1 style="text-align: center; color: #d4af37;">Modificar Empleado</h1>
        <form action="edit" method="post">
            <input type="hidden" name="emp_id" value="<%= emp.getId() %>"/>

            <label for="emp_name">Nombre:</label>
            <input type="text" id="emp_name" name="emp_name" value="<%= emp.getName() %>"/>

            <label for="emp_email">Email:</label>
            <input type="text" id="emp_email" name="emp_email" value="<%= emp.getEmail() %>"/>

            <label for="emp_phone">Telefono:</label>
            <input type="text" id="emp_phone" name="emp_phone" value="<%= emp.getPhone() %>"/>

            <button type="submit" class="btn">Guardar cambios</button>
        </form>
        <a href="employees" class="link-back">Volver a la lista de empleados</a>
    </div>
    <br><br><br><br>
    <div class="footer">
        <p>© 2025 Employee App. Todos los derechos reservados.</p>
    </div>
</body>
</html>
