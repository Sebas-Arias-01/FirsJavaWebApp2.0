<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>Buscar Empleado</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilo4.css">
</head>

<body>
    <!-- 🔹 Menú superior -->
    <div class="topnav">
        <a href="${pageContext.request.contextPath}/menu">Menu Principal</a>
        <a href="${pageContext.request.contextPath}/introaddemployee">Crear empleado</a>
        <a href="${pageContext.request.contextPath}/employees">Gestionar empleados</a>
    </div>

    <!-- 🔹 Contenido principal -->
    <div class="content">
        <h1 class="title">Buscar Empleado por ID</h1>

        <!-- 🔹 Formulario de búsqueda -->
        <form action="findemployee" method="post" class="search-form">
            <label for="searchId">ID del empleado:</label>
            <input type="number" id="searchId" name="searchId" required min="1">
            <button type="submit">Buscar</button>
        </form>

        <!-- 🔹 Mostrar empleado si fue encontrado -->
        <c:if test="${not empty employeeFound}">
            <table class="employee-table" style="margin-top: 20px; width: 50%;">
                <tr>
                    <th>ID</th>
                    <td>${employeeFound.id}</td>
                </tr>
                <tr>
                    <th>Nombre</th>
                    <td>${employeeFound.name}</td>
                </tr>
                <tr>
                    <th>Email</th>
                    <td>${employeeFound.email}</td>
                </tr>
                <tr>
                    <th>Teléfono</th>
                    <td>${employeeFound.phone}</td>
                </tr>
                <tr>
                    <th>Acciones</th>
                    <td>
                        <a href="edit?id=${employeeFound.id}" class="btn edit">Modificar</a>
                        <a href="delete?id=${employeeFound.id}" class="btn delete">Eliminar</a>
                    </td>
                </tr>
            </table>
        </c:if>

        <!-- 🔹 Mensaje si no se encuentra empleado -->
        <c:if test="${param.searchId != null and empty employeeFound}">
            <p style="margin-top: 20px;">
                Empleado con ID <strong>${param.searchId}</strong> no encontrado.
            </p>
        </c:if>
    </div>

    <!-- 🔹 Pie de página -->
    <div class="footer">
        <p>© 2025 Employee App. Todos los derechos reservados.</p>
    </div>
</body>
</html>