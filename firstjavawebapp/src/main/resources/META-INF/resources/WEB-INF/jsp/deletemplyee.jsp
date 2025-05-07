<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Eliminar Empleado</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilo6.css">
</head>
<body>
    <div class="topnav">
        <a href="${pageContext.request.contextPath}/introaddemployee">Crear empleado</a>
        <a href="${pageContext.request.contextPath}/menu">Menu Principal</a>
        <a href="${pageContext.request.contextPath}/employees">Gestionar empleados</a>
        <a href="${pageContext.request.contextPath}/findemployee">Buscar empleado</a>
    </div>

    <c:if test="${employee == null}">
        <div class="form-container">
            <h1 class="title-delete">Empleado no encontrado</h1>
            <p>No se pudo encontrar el empleado especificado.</p>
            <a href="${pageContext.request.contextPath}/employees" class="link-back">Volver a la lista de empleados</a>
        </div>
    </c:if>

    <c:if test="${employee != null}">
        <div class="form-container">
            <h1 class="title-delete">¿Estás seguro que deseas eliminar a este empleado?</h1>
            <form action="delete" method="post">
                <input type="hidden" name="id" value="${employee.id}"/>
                <input type="hidden" name="confirm" value="true"/>

                <p><strong>Nombre:</strong> ${employee.name}</p>
                <p><strong>Email:</strong> ${employee.email}</p>
                <p><strong>Teléfono:</strong> ${employee.phone}</p>

                <button type="submit" class="btn delete-btn">Confirmar Eliminación</button>
            </form>

            <a href="${pageContext.request.contextPath}/employees" class="link-back">Cancelar</a>
        </div>
    </c:if>

    <div class="footer">
        <p>© 2025 Employee App. Todos los derechos reservados.</p>
    </div>
</body>
</html>