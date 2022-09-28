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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
        <link href="Estilos/perfil.css" rel="stylesheet" type="text/css"/>
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
                    <%} else if (rolVO.getRolTiPo().equals("director")) {
                    %>
                <li><a href="director.jsp">Inicio</a></li>
                <li><a href="perfil.jsp">Perfil</a></li>
                <li><a href="ConsultarMat2.jsp">Matriculas por registrar</a></li>
                <li><a href="director.jsp">Volver</a></li>
                    <%} else if (rolVO.getRolTiPo().equals("profesor")) {
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
        <div class="titulo">
            <h2>Complete sus datos</h2>
        </div>
    </center>
    <form method="post" action="Usuario">
        <center>
        <div class="formulario">
            <div class="col">

                <label class="form-label" >Primer nombre</label>
                <input class="form-control" type="text" name="nombre1"><br>

                <label class="form-label" >Segundo Nombre</label>
                <input class="form-control" type="text" name="nombre2"><br>

                <label class="form-label" >Primer apellido</label>
                <input class="form-control" type="text" name="apellido1"><br>

                <label class="form-label" >Segundo apellido</label>
                <input class="form-control" type="text" name="apellido2"><br>

                <label class="form-label" >Numero de documento</label>
                <input class="form-control" type="int" name="numDocu"><br>
            </div>
            <div class="col">
                <label class="form-label" >Tipos de documento</label>
                <select class="form-select" name="tipoDocu">
                    <option>Seleccione su tipo de documento</option>
                    <option value="Cedula">Cedula de ciudadania</option>
                    <option value="T.I">Tarjeta de indentidad</option>
                    <option value="otro">Otro</option>
                </select><br>


                <label class="form-label" >Numero de telefono</label>
                <input class="form-control" type="int" name="numTel"><br>

                <label class="form-label" >Direccion</label>
                <input class="form-control" type="text" name="direcUsua"><br>

                <label class="form-label" >Correo</label>
                <input class="form-control" type="text" name="correo"><br>

                <label class="form-label" >fecha de nacimiento</label>
                <input class="form-control" type="date" name="fecha">
            </div>
        </div>
        <center>
        <div class="btn">
            <button class="btn btn-info">Ingresar</button>
        </div></center>
        </center>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
    crossorigin="anonymous"></script>
    <%
            if (request.getAttribute("mensajeError") != null) { %>
    ${mensajeError}

    <%} else {%>
    ${mensajeExito}        
    <%}%>
</center>


</body>
</html>
