<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Editar Empleado</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilo5.css">
</head>
<body>
    <!-- NAV -->
    <div class="topnav">
        <a href="${pageContext.request.contextPath}/introaddemployee">Crear empleado</a>
        <a href="${pageContext.request.contextPath}/menu"> Menu Principal</a>
        <a href="${pageContext.request.contextPath}/employees">Gestionar empleados</a>
        <a href="${pageContext.request.contextPath}/findemployee">Buscar empleado</a>
    </div>

    <br><br><br><br><br><br>

    <!-- Condición: si employee no existe -->
    <c:if test="${employee == null}">
        <div class="form-container">
            <h1 style="text-align: center; color: red;">Empleado no encontrado</h1>
            <a href="${pageContext.request.contextPath}/employees" class="link-back">Volver</a>
        </div>
    </c:if>

    <!-- Mostrar formulario solo si existe el empleado -->
    <c:if test="${employee != null}">
        <div class="form-container">
            <h1 style="text-align: center; color: #d4af37;">Modificar Empleado</h1>
            <form action="edit" method="post">
                <input type="hidden" name="emp_id" value="${employee.id}"/>

                <label for="emp_name">Nombre:</label>
                <input type="text" id="emp_name" name="emp_name"
                       value="${employee.name}"
                       pattern="[A-Za-zÁÉÍÓÚáéíóúñÑ\\s]+"/>

                <label for="emp_email">Email:</label>
                <input type="email" id="emp_email" name="emp_email" value="${employee.email}"/>

                <label for="emp_phone">Teléfono:</label>
                <input type="tel" id="emp_phone" name="emp_phone"
                       value="${employee.phone}" pattern="[0-9]{7,10}"/>

                <button type="submit" class="btn">Guardar cambios</button>
            </form>
            <a href="${pageContext.request.contextPath}/employees" class="link-back">Volver a la lista de empleados</a>
        </div>
    </c:if>

    <br><br><br><br>

    <div class="footer">
        <p>© 2025 Employee App. Todos los derechos reservados.</p>
    </div>
</body>
</html>
