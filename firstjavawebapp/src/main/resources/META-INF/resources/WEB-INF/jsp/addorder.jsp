<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="co.edu.uptc.firstjavawebapp.model.Order,java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Formulario Orden</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilo2.css">
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
                <a href="${pageContext.request.contextPath}/order">Crear Orden</a>
                <a href="#">Gestionar Ordenes</a>
                <a href="#">Buscar Orden</a>
            </div>
        </div>

        <div class="dropdown">
            <a class="dropbtn" href="logout">Cerrar Sesión</a>
        </div>
    </div>

    <div class="main-content">
        <div class="form-container">
            <h1>ORDER APP</h1>
            <h2 style="text-align: center; margin-bottom: 1.5rem;">Hola, por favor ingrese los datos de la orden</h2>

            <form action="Addorder" method="post">
                <table style="width: 100%; border-collapse: collapse;">
                    <tr>
                        <td style="text-align: right; padding: 0.5rem;">ID Pedido:</td>
                        <td><input type="text" name="order_id" required class="input-style"></td>
                    </tr>
                    <tr>
                        <td style="text-align: right; padding: 0.5rem;">Documento del Cliente:</td>
                        <td><input type="text" name="customer_document" required pattern="[0-9]{5,15}" class="input-style"></td>
                    </tr>
                    <tr>
                        <td style="text-align: right; padding: 0.5rem;">Fecha del Pedido:</td>
                        <td><input type="date" name="order_date" required class="input-style"></td>
                    </tr>
                    <tr>
                        <td style="text-align: right; padding: 0.5rem;">Descripción del Producto:</td>
                        <td><input type="text" name="product_description" required class="input-style"></td>
                    </tr>
                    <tr>
                        <td style="text-align: right; padding: 0.5rem;">Estado del Pedido:</td>
                        <td>
                            <select name="order_status" required class="input-style">
                                <option value="">Seleccione</option>
                                <option value="Created">Creado</option>
                                <option value="To be shipped">Por enviarse</option>
                                <option value="Shipped">Enviado</option>
                            </select>
                        </td>
                    </tr>
                </table>

                <button type="submit">Enviar</button>
            </form>

            <c:choose>
                <c:when test="${not empty sessionScope.orderlist}">
                    <h2 style="text-align: center; margin-top: 2rem;">Existen pedidos en el sistema!</h2>  
                </c:when>
                <c:otherwise>
                    <h2 style="text-align: center; margin-top: 2rem;">Lista de pedidos vacía</h2>
                </c:otherwise>
            </c:choose>

            <a href="#" class="link-back">Ver lista de pedidos</a>
        </div>

    <div class="footer">
        <p>© 2025 Order App. Todos los derechos reservados.</p>
    </div>
</body>

</html>
