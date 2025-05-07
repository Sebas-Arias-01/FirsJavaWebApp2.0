<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="co.edu.uptc.firstjavawebapp.model.Customer,java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>


<head>
    <meta charset="UTF-8">
    <title>Formulario Cliente</title>
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
                <a href="#">Crear Orden</a>
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
            <h1>EMPLOYEE APP</h1>
            <h2 style="text-align: center; margin-bottom: 1.5rem;">Hola, por favor ingrese los datos del cliente</h2>
    
            <form action="addcustomer" method="post">
                <table style="width: 100%; border-collapse: collapse;">
                    <tr>
                        <td style="text-align: right; padding: 0.5rem;">ID Cliente:</td>
                        <td><input type="number" name="cust_id" min="1" required pattern="^\d{7,10}$" class="input-style"></td>
                    </tr>
                    <tr>
                        <td style="text-align: right; padding: 0.5rem;">Nombre Cliente:</td>
                        <td><input type="text" name="cust_name" required pattern="[A-Za-zÁÉÍÓÚáéíóúñÑ\s]+" class="input-style"></td>
                    </tr>
                    <tr>
                        <td style="text-align: right; padding: 0.5rem;">Email Cliente:</td>
                        <td><input type="email" name="cust_email" required class="input-style"></td>
                    </tr>
                    <tr>
                        <td style="text-align: right; padding: 0.5rem;">Direccion Cliente:</td>
                        <td><input type="text" name="cust_address" required pattern="^[a-zA-Z0-9áéíóúÁÉÍÓÚñÑ\s\#\-\.\,]{10,100}$" class="input-style"></td>
                    </tr>
                </table>
    
                <button type="submit">Enviar</button>
            </form>
    
            <c:choose>
                <c:when test="${not empty sessionScope.customerlist}">
                    <h2 style="text-align: center; margin-top: 2rem;">Existen clientes en el sistema!</h2>  
                </c:when>
                <c:otherwise>
                    <h2 style="text-align: center; margin-top: 2rem;">Lista de clientes vacía</h2>
                </c:otherwise>
            </c:choose>
    
            <a href="customers" class="link-back">Ver lista de clientes</a>
        </div>

    <div class="footer">
        <p>© 2025 Employee App. Todos los derechos reservados.</p>
    </div>
</body>

</html>