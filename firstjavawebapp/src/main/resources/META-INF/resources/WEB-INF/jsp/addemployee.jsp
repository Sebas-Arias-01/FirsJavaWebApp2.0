<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="co.edu.uptc.firstjavawebapp.model.Employee,java.util.List" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Formulario Empleado</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilo2.css">
</head>

<body>
    <div class="topnav">
        <a href="${pageContext.request.contextPath}/introaddemployee">Crear empleado</a>
        <a href="${pageContext.request.contextPath}/menu">Menu Principal</a>
        <a href="employees">Gestionar empleados</a>
    </div>

    <div class="main-content">
        <h1>EMPLOYEE APP</h1>
        <h2>Hola, por favor ingrese los datos del usuario</h2>

        <form action="addemployee" method="post">
            <table cellspacing="3" cellpadding="3" border="1">
                <tr>
                    <td align="right">ID Empleado:</td>
                    <td><input type="text" name="emp_id"></td>
                </tr>
                <tr>
                    <td align="right">Nombre Empleado:</td>
                    <td><input type="text" name="emp_name"></td>
                </tr>
                <tr>
                    <td align="right">Email empleado:</td>
                    <td><input type="text" name="emp_email"></td>
                </tr>
                <tr>
                    <td align="right">Teléfono empleado:</td>
                    <td><input type="text" name="emp_phone"></td>
                </tr>
            </table>
            <input type="submit" value="Enviar">
        </form>

        <% 
            List<Employee> employeeList = (List<Employee>) request.getSession().getAttribute("employeelist");
            if (employeeList != null) { 
        %>
            <h2>Existen empleados en el sistema!</h2>
        <% 
            } else { 
        %>
            <h2>Lista de empleados vacía</h2>
        <% 
            } 
        %>

        <a href="employees" class="ver-empleados">Ver lista de empleados</a>
    </div>

    <div class="footer">
        <p>© 2025 Employee App. Todos los derechos reservados.</p>
    </div>
</body>

</html>
