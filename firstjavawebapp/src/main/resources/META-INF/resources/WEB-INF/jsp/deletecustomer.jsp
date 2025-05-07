<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Eliminar Cliente</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilo6.css">
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

    <c:if test="${customer == null}">
        <div class="form-container">
            <h1 class="title-delete">Cliente no encontrado</h1>
            <p>No se pudo encontrar el cliente especificado.</p>
            <a href="${pageContext.request.contextPath}/customers" class="link-back">Volver a la lista de clientes</a>
        </div>
    </c:if>

    <c:if test="${customer != null}">
        <div class="form-container">
            <h1 class="title-delete">¿Estás seguro que deseas eliminar a este cliente?</h1>
            <form action="deletecustomer" method="post">
                <input type="hidden" name="id" value="${customer.id}"/>
                <input type="hidden" name="confirm" value="true"/>

                <p><strong>Nombre:</strong> ${customer.name}</p>
                <p><strong>Email:</strong> ${customer.email}</p>
                <p><strong>Dirección:</strong> ${customer.address}</p>

                <button type="submit" class="btn delete-btn">Confirmar Eliminación</button>
            </form>

            <a href="${pageContext.request.contextPath}/customers" class="link-back">Cancelar</a>
        </div>
    </c:if>

    <div class="footer">
        <p>© 2025 Employee App. Todos los derechos reservados.</p>
    </div>
</body>
</html>