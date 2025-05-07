<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*, co.edu.uptc.firstjavawebapp.model.Customer" %>
<%
    request.setCharacterEncoding("UTF-8");

    String searchId = request.getParameter("searchId");
    Customer found = null;

    if (searchId != null && !searchId.trim().isEmpty()) {
        List<Customer> list = (List<Customer>) session.getAttribute("customerlist");
        if (list != null) {
            for (Customer cus : list) {
                if (String.valueOf(cus.getId()).equals(searchId)) {
                    found = cus;
                    break;
                }
            }
        }
        request.setAttribute("found", found);
        request.setAttribute("searchId", searchId); // Esta línea permite usar ${searchId} en JSTL
    }
%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>Buscar Cliente</title>
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
        <h1 class="title">Buscar Cliente por ID</h1>

        <form action="findcustomer" method="post" class="search-form">
            <label for="searchId">ID del Cliente:</label>
            <input type="number" id="searchId" name="searchId" required min="1">
            <button type="submit">Buscar</button>
        </form>

        <c:if test="${not empty searchId}">
            <c:choose>
                <c:when test="${not empty found}">
                    <table class="customer-table" style="margin-top: 20px; width: 50%;">
                        <tr>
                            <th>ID</th>
                            <td>${found.id}</td>
                        </tr>
                        <tr>
                            <th>Nombre</th>
                            <td>${found.name}</td>
                        </tr>
                        <tr>
                            <th>Dirección</th>
                            <td>${found.address}</td>
                        </tr>
                        <tr>
                            <th>Email</th>
                            <td>${found.email}</td>
                        </tr>
                        <tr>
                            <th>Acciones</th>
                            <td>
                                <a href="edit?id=${found.id}" class="btn edit">Modificar</a>
                                <a href="delete?id=${found.id}" class="btn delete">Eliminar</a>
                            </td>
                        </tr>
                    </table>
                </c:when>
                <c:otherwise>
                    <p style="margin-top: 20px;">
                        Cliente con ID <strong>${searchId}</strong> no encontrado.
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