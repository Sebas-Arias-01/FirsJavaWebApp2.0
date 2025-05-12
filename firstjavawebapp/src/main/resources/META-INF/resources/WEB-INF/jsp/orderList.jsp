<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="co.edu.uptc.firstjavawebapp.model.Order" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Lista de Órdenes</title>
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
        <h1 class="title">Órdenes</h1>
        <table class="order-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Documento Cliente</th>
                    <th>Fecha Orden</th>
                    <th>Descripción</th>
                    <th>Estado</th>
                    <th>Acción</th>
                </tr>
            </thead>
            <tbody>
            <c:choose>
                <c:when test="${not empty sessionScope.orderlist}">
                    <c:forEach var="order" items="${sessionScope.orderlist}">
                        <tr>
                            <td>${order.orderId}</td>
                            <td>${order.customerDocument}</td>
                            <td>${order.orderDate}</td>
                            <td>${order.productDescription}</td>
                            <td>${order.orderStatus}</td>
                            <td>
                                <form action="editorder" method="post" style="display:inline;">
                                    <input type="hidden" name="order_id" value="${order.orderId}">
                                    <button type="submit" class="btn edit">Modificar</button>
                                </form>
                                
                                <form action="deleteorder" method="post" style="display:inline;">
                                    <input type="hidden" name="id" value="${order.orderId}">
                                    <input type="hidden" name="confirm" value="false">
                                    <button type="submit" class="btn delete">Eliminar</button>
                                </form>
                                
                            </td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="6">No hay órdenes registradas.</td>
                    </tr>
                </c:otherwise>
            </c:choose>
            </tbody>
        </table>
    </div>

    <div class="footer">
        <p>© 2025 Order App. Todos los derechos reservados.</p>
    </div>
</body>
</html>
