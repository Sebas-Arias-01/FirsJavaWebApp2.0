<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Eliminar Orden</title>
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
                <a href="${pageContext.request.contextPath}/introaddorder">Crear Orden</a>
                <a href="orders">Gestionar Ordenes</a>
                <a href="findorder">Buscar Orden</a>
            </div>
        </div>

        <div class="dropdown">
            <a class="dropbtn" href="logout">Cerrar Sesión</a>
        </div>
    </div>

    <c:if test="${order == null}">
        <div class="form-container">
            <h1 class="title-delete">Orden no encontrado</h1>
            <p>No se pudo encontrar la orden de pedido especificada.</p>
            <a href="${pageContext.request.contextPath}/orders" class="link-back">Volver a la lista de pedidos</a>
        </div>
    </c:if>

    <c:if test="${order != null}">
        <div class="form-container">
            <h1 class="title-delete">¿Estás seguro que deseas eliminar esta order?</h1>
            <form action="deleteorder" method="post">
                <input type="hidden" name="id" value="${order.id}"/>
                <input type="hidden" name="confirm" value="true"/>

                <p><strong>Documento del Cliente:</strong> ${order.customerId}</p>
                <p><strong>Fecha del Pedido:</strong> ${order.orderDate}</p>
                <p><strong>Descripción del Producto:</strong> ${order.productDescription}</p>
                <p><strong>Estado del Pedido:</strong> ${order.status}</p>

                <button type="submit" class="btn delete-btn">Confirmar Eliminación</button>
            </form>

            <a href="${pageContext.request.contextPath}/orders" class="link-back">Cancelar</a>
        </div>
    </c:if>

    <div class="footer">
        <p>© 2025 Employee App. Todos los derechos reservados.</p>
    </div>
</body>
</html>