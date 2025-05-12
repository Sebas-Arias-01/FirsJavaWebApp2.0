<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Editar Orden</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilo5.css">
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

    <br><br><br><br><br><br>

    <c:if test="${order == null}">
        <div class="form-container">
            <h1 style="text-align: center; color: red;">Orden no encontrada</h1>
            <a href="${pageContext.request.contextPath}/orders" class="link-back">Volver</a>
        </div>
    </c:if>


    <c:if test="${order != null}">
        <div class="form-container">
            <h1 style="text-align: center; color: #d4af37;">Modificar Orden</h1>
            <form action="editorder" method="post">
                <input type="hidden" name="order_id" value="${order.orderId}"/>


                <label for="customer_document">Documento del Cliente:</label>
                <input type="text" id="customer_document" name="customer_document" value="${order.customerDocument}"
                       pattern="[0-9]{5,15}"/>

                <label for="order_date">Fecha del Pedido:</label>
                <input type="date" id="order_date" name="order_date"
                       value="${order.orderDate}" />

                <label for="product_description">Descripción del Producto:</label>
                <input type="text" id="product_description" name="product_description"
                        value="${order.productDescription}" />

                <label for="order_status">Estado del Pedido:</label>
                <select name="order_status" id="order_status">
                    <option value="Created">Creado</option>
                    <option value="To be shipped">Por enviarse</option>
                    <option value="Shipped">Enviado</option>
                </select>

                <button type="submit" class="btn">Guardar cambios</button>
            </form>
            <a href="${pageContext.request.contextPath}/orders" class="link-back">Volver a la lista de pedidos</a>
        </div>
    </c:if>

    <br><br><br><br>

    <div class="footer">
        <p>© 2025 Employee App. Todos los derechos reservados.</p>
    </div>
</body>
</html>
