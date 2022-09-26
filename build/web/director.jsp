<%-- 
    Document   : director
    Created on : 21/07/2022, 07:05:51 AM
    Author     : ranyerino
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="Estilos/menu.css">
        <link rel="stylesheet" href="Estilos/director.css">

        <title>JSP Page</title>
    </head>
    <body>
        
        <nav>
            <ul>
                <li><a href="">Inicio</a></li>
                <li><a href="perfil.jsp">Perfil</a></li>
                <li><a href="ConsultarMat2.jsp">Matriculas por registrar</a></li>
                
                <form method="post" action="Sesiones">

                    <input class="custom-btn btn-1"  type="submit" value="Cerrar Sesion" >
                </form>
            </ul>
        </nav>
    <center>
        <br>
        <h1>DIRECTOR<%@include file="Sesiones.jsp"%></h1>


    </center>

    

</body>
</html>
