<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="co.edu.uptc.firstjavawebapp.model.Customer" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Lista de Cientes</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilo4.css">
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
        <h1 class="title">Clientes Registrados</h1>
        <table class="customer-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Email</th>
                    <th>Dirección</th>
                    <th>Acción</th>
                </tr>
            </thead>
            <tbody>
            <c:choose>
                <c:when test="${not empty sessionScope.customerlist}">
                    <c:forEach var="emp" items="${sessionScope.customerlist}">
                        <tr>
                            <td>${cust.id}</td>
                            <td>${cust.name}</td>
                            <td>${cust.email}</td>
                            <td>${cust.address}</td>
                            <td>
                                <form action="edit" method="post" style="display:inline;">
                                    <input type="hidden" name="cust_id" value="${cust.id}">
                                    <button type="submit" class="btn edit">Modificar</button>
                                </form>

                                <form action="delete" method="post" style="display:inline;">
                                    <input type="hidden" name="id" value="${cust.id}">
                                    <input type="hidden" name="confirm" value="false">
                                    <button type="submit" class="btn delete">Eliminar</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="5">No hay clientes registrados.</td>
                    </tr>
                </c:otherwise>
            </c:choose>
            </tbody>
        </table>
    </div>

    <div class="footer">
        <p>© 2025 Employee App. Todos los derechos reservados.</p>
    </div>
</body>
</html>