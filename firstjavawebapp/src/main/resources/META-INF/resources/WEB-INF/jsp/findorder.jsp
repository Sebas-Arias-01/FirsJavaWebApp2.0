<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*, co.edu.uptc.firstjavawebapp.model.Order" %>
<%
    request.setCharacterEncoding("UTF-8");

    String searchId = request.getParameter("searchId");
    Order found = null;

    if (searchId != null && !searchId.trim().isEmpty()) {
        List<Order> list = (List<Order>) session.getAttribute("orderlist");
        if (list != null) {
            for (Order ord : list) {
                if (String.valueOf(ord.getOrderId()).equals(searchId)) {
                    found = ord;
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
    <title>Buscar Orden</title>
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
        <h1 class="title">Buscar Orden por ID</h1>

        <form action="findorder" method="post" class="search-form">
            <label for="searchId">ID De La Orden:</label>
            <input type="number" id="searchId" name="searchId" required min="1">
            <button type="submit">Buscar</button>
        </form>

        <c:if test="${not empty searchId}">
            <c:choose>
                <c:when test="${not empty found}">
                    <table class="customer-table" style="margin-top: 20px; width: 50%;">
                        <tr>
                            <th>ID</th>
                            <td>${found.orderId}</td>
                        </tr>
                        <tr>
                            <th>Fecha De La Orden</th>
                            <td>${found.orderDate}</td>
                        </tr>
                        <tr>
                            <th>Descripción del Producto</th>
                            <td>${found.productDescription}</td>
                        </tr>
                        <tr>
                            <th>Estado de la Orden</th>
                            <td>${found.orderStatus}</td>
                        </tr>
                        <tr>
                            <th>Acciones</th>
                            <td>
                                <form action="editorder" method="post" style="display:inline;">
                                    <input type="hidden" name="order_id" value="${found.orderId}">
                                    <button type="submit" class="btn edit">Modificar</button>
                                </form>
                                
                                <form action="deleteorder" method="post" style="display:inline;">
                                    <input type="hidden" name="id" value="${found.orderId}">
                                    <input type="hidden" name="confirm" value="false">
                                    <button type="submit" class="btn delete">Eliminar</button>
                                </form>
                            </td>
                        </tr>
                    </table>
                </c:when>
                <c:otherwise>
                    <p style="margin-top: 20px;">
                        Orden con ID <strong>${searchId}</strong> no encontrado.
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