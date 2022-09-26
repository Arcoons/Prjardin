<%-- 
    Document   : profesor
    Created on : 21/07/2022, 07:06:13 AM
    Author     : ranyerino
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Sesiones.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="Estilos/menu.css">
        <title>JSP Page</title>
    </head>
    <body>
        
        
        <nav>
            <ul>
                <li><a href="profesor.jsp">Inicio</a></li>
                <li><a href="perfil.jsp">perfil</a></li>
                <li><a href="consultarAlumno.jsp">Alumnos</a></li>

                <form method="post" action="Sesiones">
                    <input type="submit" value="Cerrar Sesion" >
                </form>
            </ul>
        </nav>
    <center>
        <h1>PROFESOR</h1>
    </center>
    </body>
</html>
