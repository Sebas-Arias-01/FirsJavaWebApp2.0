<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*, co.edu.uptc.firstjavawebapp.model.Employee" %>
<%
    request.setCharacterEncoding("UTF-8");

    String searchId = request.getParameter("searchId");
    Employee found = null;

    if (searchId != null && !searchId.trim().isEmpty()) {
        List<Employee> list = (List<Employee>) session.getAttribute("employeelist");
        if (list != null) {
            for (Employee emp : list) {
                if (String.valueOf(emp.getId()).equals(searchId)) {
                    found = emp;
                    break;
                }
            }
        }
        request.setAttribute("found", found);
        request.setAttribute("searchId", searchId);
    }
%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>Buscar Empleado</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilo4.css">
</head>

<body>
    <div class="topnav">
        <div class="dropdown">
            <a class="dropbtn" href="menu">Menu Principal</a>
        </div>

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
                <a href="${pageContext.request.contextPath}/introaddcustomer">Crear Cliente</a>
                <a href="customers">Gestionar Clientes</a>
                <a href="findcustomer">Buscar Cliente</a>
            </div>
        </div>

        <div class="dropdown">
            <button class="dropbtn">Menú Orden</button>
            <div class="dropdown-content">
                <a href="${pageContext.request.contextPath}/introaddorder">Crear Orden</a>
                <a href="orders">Gestionar Ordenes</a>
                <a href="findorder">Buscar Orden</a>
            </div>
        </div>

        <div class="dropdown">
            <a class="dropbtn" href="logout">Cerrar Sesión</a>
        </div>
    </div>

    <div class="content">
        <h1 class="title">Buscar Empleado por ID</h1>

        <form action="findemployee" method="post" class="search-form">
            <label for="searchId">ID del empleado:</label>
            <input type="number" id="searchId" name="searchId" required min="1">
            <button type="submit">Buscar</button>
        </form>

        <c:if test="${not empty param.searchId}">
            <c:choose>
                <c:when test="${not empty found}">
                    <table class="employee-table" style="margin-top: 20px; width: 50%;">
                        <tr>
                            <th>ID</th>
                            <td>${found.id}</td>
                        </tr>
                        <tr>
                            <th>Nombre</th>
                            <td>${found.name}</td>
                        </tr>
                        <tr>
                            <th>Email</th>
                            <td>${found.email}</td>
                        </tr>
                        <tr>
                            <th>Teléfono</th>
                            <td>${found.phone}</td>
                        </tr>
                        <tr>
                            <th>Acciones</th>
                            <td>
                                <form action="edit" method="post" style="display:inline;">
                                    <input type="hidden" name="emp_id" value="${found.id}">
                                    <button type="submit" class="btn edit">Modificar</button>
                                </form>
                                
                                <form action="delete" method="post" style="display:inline;">
                                    <input type="hidden" name="id" value="${found.id}">
                                    <input type="hidden" name="confirm" value="false">
                                    <button type="submit" class="btn delete">Eliminar</button>
                                </form>
                            </td>
                        </tr>
                    </table>
                </c:when>
                <c:otherwise>
                    <p style="margin-top: 20px;">
                        Empleado con ID <strong>${searchId}</strong> no encontrado.
                    </p>
                </c:otherwise>
            </c:choose>
        </c:if>
    </div>

    <div class="footer">
        <p>© 2025 Employee App. Todos los derechos reservados.</p>
    </div>
</body>

</html>