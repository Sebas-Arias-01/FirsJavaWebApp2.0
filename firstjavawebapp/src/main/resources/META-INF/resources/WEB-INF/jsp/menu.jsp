<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<%@ page import="co.edu.uptc.firstjavawebapp.model.Employee,java.util.List" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title> Formulario Empleado</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilo.css">

</head>

<body>
    <div class="topnav">
        <a href="${pageContext.request.contextPath}/introaddemployee">Crear empleado</a>
        <a href="employees">Gestionar empleados</a>
        <a href="findemployee">Buscar empleado</a>
        <a href="logout">Cerrar Sesion</a>

        
    </div>

    <div class="content">
        <h1> EMPLOYEE APP </h1>
        <h2> Bienvenido a la aplicacion! </h2>
        <h2> Haga click en cualquiera de las opciones del menu principal! </h2>
    </div>

    <div class="footer">
        <p>© 2025 Employee App. Todos los derechos reservados.</p>
    </div>

</body>


</html>
