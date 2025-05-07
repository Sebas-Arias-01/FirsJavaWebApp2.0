<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="co.edu.uptc.firstjavawebapp.model.Employee,java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>


<head>
    <meta charset="UTF-8">
    <title>Formulario Empleado</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilo2.css">
</head>

<body>
    <div class="topnav">
        <a href="${pageContext.request.contextPath}/menu">Menu Principal</a>
        <a href="${pageContext.request.contextPath}/introaddemployee">Crear empleado</a>
        <a href="employees">Gestionar empleados</a>
        <a href="findemployee">Buscar empleado</a>
    </div>

    <div class="main-content">
        <div class="form-container">
            <h1>EMPLOYEE APP</h1>
            <h2 style="text-align: center; margin-bottom: 1.5rem;">Hola, por favor ingrese los datos del usuario</h2>
    
            <form action="addemployee" method="post">
                <table style="width: 100%; border-collapse: collapse;">
                    <tr>
                        <td style="text-align: right; padding: 0.5rem;">ID Empleado:</td>
                        <td><input type="number" name="emp_id" min="1" required class="input-style"></td>
                    </tr>
                    <tr>
                        <td style="text-align: right; padding: 0.5rem;">Nombre Empleado:</td>
                        <td><input type="text" name="emp_name" required pattern="[A-Za-zÁÉÍÓÚáéíóúñÑ\s]+" class="input-style"></td>
                    </tr>
                    <tr>
                        <td style="text-align: right; padding: 0.5rem;">Email empleado:</td>
                        <td><input type="email" name="emp_email" required class="input-style"></td>
                    </tr>
                    <tr>
                        <td style="text-align: right; padding: 0.5rem;">Teléfono empleado:</td>
                        <td><input type="tel" name="emp_phone" required pattern="[0-9]{7,10}" class="input-style"></td>
                    </tr>
                </table>
    
                <button type="submit">Enviar</button>
            </form>
    
            <c:choose>
                <c:when test="${not empty sessionScope.employeelist}">
                    <h2 style="text-align: center; margin-top: 2rem;">Existen empleados en el sistema!</h2>  
                </c:when>
                <c:otherwise>
                    <h2 style="text-align: center; margin-top: 2rem;">Lista de empleados vacía</h2>
                </c:otherwise>
            </c:choose>
    
            <a href="employees" class="link-back">Ver lista de empleados</a>
        </div>

    <div class="footer">
        <p>© 2025 Employee App. Todos los derechos reservados.</p>
    </div>
</body>

</html>
