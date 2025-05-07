<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Login</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilo7.css">
    </head>
    <body>
        <div class="centered">
            <form action="login" method="post">
                <h2>Login</h2>
                <label for="userid">Usuario:</label><br>
                <input type="text" name="userid" required><br><br>
                <label for="password">Contraseña:</label><br>
                <input type="password" name="password" required><br><br>
                <input type="submit" value="Ingresar">
                <br><br>
                <% if ("1".equals(request.getAttribute("error"))) { %>
                    <div class="error">Usuario o contraseña incorrectos</div>
                <% } %>
            </form>
        </div>
    </body>
</html>