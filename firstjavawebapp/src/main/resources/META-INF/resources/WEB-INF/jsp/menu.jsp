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

        <div class="dropdown">
            <button class="dropbtn">Menú Empleado</button>
            <div class="dropdown-content">
                <a href="${pageContext.request.contextPath}/introaddemployee">Crear Empleado</a>
                <a href="employees">Gestionar Empleados</a>
                <a href="findemployee">Buscar Empleado</a>
            </div>
        </div>

        <div class="dropdown">
            <button class="dropbtn">Menú Cliente</button>
            <div class="dropdown-content">
                <a href="#">Crear Cliente</a>
                <a href="#">Gestionar Clientes</a>
                <a href="#">Buscar Cliente</a>
            </div>
        </div>

        <div class="dropdown">
            <button class="dropbtn">Menú Orden</button>
            <div class="dropdown-content">
                <a href="#">Crear Orden</a>
                <a href="#">Gestionar Ordenes</a>
                <a href="#">Buscar Orden</a>
            </div>
        </div>

        <div class="dropdown">
            <a class="dropbtn" href="logout">Cerrar Sesión</a>
        </div>
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
