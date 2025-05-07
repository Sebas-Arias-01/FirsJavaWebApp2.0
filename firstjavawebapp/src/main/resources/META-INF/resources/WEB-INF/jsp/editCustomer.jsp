<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Editar Cliente</title>
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
                <a href="#">Crear Orden</a>
                <a href="#">Gestionar Ordenes</a>
                <a href="#">Buscar Orden</a>
            </div>
        </div>

        <div class="dropdown">
            <a class="dropbtn" href="logout">Cerrar Sesión</a>
        </div>
    </div>

    <br><br><br><br><br><br>

    <c:if test="${customer == null}">
        <div class="form-container">
            <h1 style="text-align: center; color: red;">Cliente no encontrado</h1>
            <a href="${pageContext.request.contextPath}/customers" class="link-back">Volver</a>
        </div>
    </c:if>


    <c:if test="${customer != null}">
        <div class="form-container">
            <h1 style="text-align: center; color: #d4af37;">Modificar Cliente</h1>
            <form action="editcustomer" method="post">
                <input type="hidden" name="cust_id" value="${customer.id}"/>

                <label for="cust_name">Nombre:</label>
                <input type="text" id="cust_name" name="cust_name"
                       value="${customer.name}"
                       pattern="[A-Za-zÁÉÍÓÚáéíóúñÑ\\s]+"/>

                <label for="cust_email">Email:</label>
                <input type="email" id="cust_email" name="cust_email" value="${customer.email}"/>

                <label for="cust_address">Dirección:</label>
                <input type="text" id="cust_address" name="cust_address"
                       value="${customer.address}" pattern="^[a-zA-Z0-9áéíóúÁÉÍÓÚñÑ\s\#\-\.\,]{10,100}$"/>

                <button type="submit" class="btn">Guardar cambios</button>
            </form>
            <a href="${pageContext.request.contextPath}/customers" class="link-back">Volver a la lista de clientes</a>
        </div>
    </c:if>

    <br><br><br><br>

    <div class="footer">
        <p>© 2025 Employee App. Todos los derechos reservados.</p>
    </div>
</body>
</html>
