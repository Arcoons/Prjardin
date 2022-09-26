<%-- 
    Document   : perfil
    Created on : 14/08/2022, 10:48:06 AM
    Author     : ranyerino
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.RolDAO"%>
<%@page import="ModeloVO.RolVO"%>
<%@include file="Sesiones.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="Estilos/menu.css">
    </head>
    <body>
        <% RolVO rolVO = new RolVO();
            RolDAO rolDAO = new RolDAO();
            ArrayList<RolVO> listaDatos = rolDAO.listar(usuario);

            for (int i = 0; i < listaDatos.size(); i++) {

                rolVO = listaDatos.get(i);
            }
        %>
        <nav>
            <ul>
                <%if (rolVO.getRolTiPo().equals("admin")) {

                %>
                <li><a href="admin.jsp">Inicio</a></li>
                <li><a href="perfil.jsp">Perfil</a></li>
                <li><a href="registrarUsuario.jsp">Registrar usuario</a></li>
                <li><a href="admin.jsp">Volver</a></li>
                    <%} else if (rolVO.getRolTiPo().equals("director")){
                    %>
                <li><a href="director.jsp">Inicio</a></li>
                <li><a href="perfil.jsp">Perfil</a></li>
                <li><a href="ConsultarMat2.jsp">Matriculas por registrar</a></li>
                <li><a href="director.jsp">Volver</a></li>
                <%}else if (rolVO.getRolTiPo().equals("profesor")){
                %>
                 <li><a href="profesor.jsp">Inicio</a></li>
                <li><a href="consultarAlumno.jsp">alumnos</a></li>
                <li><a href="profesor.jsp">Volver</a></li>
                <% }
                %>
                <form method="post" action="Sesiones">
                    <input type="submit" value="Cerrar Sesion" >
                </form>
            </ul>
        </nav>
    <center>
        <form method="post" action="Usuario">
            <label>Primer nombre</label><br>
            <input type="text" name="nombre1"><br>

            <label>Segundo Nombre</label><br>
            <input type="text" name="nombre2"><br>

            <label>Primer apellido</label><br>
            <input type="text" name="apellido1"><br>

            <label>Segundo apellido</label><br>
            <input type="text" name="apellido2"><br>

            <label>Numero de documento</label><br>
            <input type="int" name="numDocu"><br>

            <label>Tipos de documento</label><br>
            <select name="tipoDocu">
                <option>Seleccione su tipo de documento</option>
                <option value="Cedula">Cedula de ciudadania</option>
                <option value="T.I">Tarjeta de indentidad</option>
                <option value="otro">Otro</option>
            </select><br>

            <label>Numero de telefono</label><br>
            <input type="int" name="numTel"><br>

            <label>Direccion</label><br>
            <input type="text" name="direcUsua"><br>

            <label>Correo</label><br>
            <input type="text" name="correo"><br>

            <label>fecha de nacimiento</label><br>
            <input type="text" name="fecha">

            <input type="hidden" name="textId" value="<%=rolVO.getRolId()%>">

            <button>Ingresar</button> <br>
            <input type="hidden" value="5" name="opcion"><br>

        </form>
        <%
            if (request.getAttribute("mensajeError") != null) { %>
        ${mensajeError}

        <%} else {%>
        ${mensajeExito}        
        <%}%>
    </center>

</body>
</html>
