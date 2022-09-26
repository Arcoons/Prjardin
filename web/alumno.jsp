<%-- 
    Document   : alumno
    Created on : 21/07/2022, 07:06:29 AM
    Author     : ranyerino
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.RolDAO"%>
<%@page import="ModeloVO.RolVO"%>
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
        <%
        RolDAO rolDAO = new RolDAO();
        RolVO rolVO = new RolVO();

        ArrayList<RolVO> listaRol = rolDAO.listar(usuario);
        for (int i = 0; i < listaRol.size(); i++) {
            rolVO = listaRol.get(i);
        }
        String id_usua = rolVO.getRolId();

        AlumnoVO alumVO = new AlumnoVO();
        AlumnoDAO alumDAO = new AlumnoDAO(alumVO);
        
        alumVO = alumDAO.consultarAlumno(id_usua);
        
        String id_alumn = alumVO.getId_alum();

    %>

        <nav>
            <ul>
                <li><a href="alumno.jsp">Inicio</a></li>
                <li><a href="regAlumno.jsp">Formulario</a></li>

                <form method="post" action="Sesiones">
                    <input type="submit" value="Cerrar Sesion" >
                </form>
            </ul>
        </nav>
    <center>
        <h1>ALUMNO</h1>
        <a href="regAlumno.jsp">Registrar alumno</a><br>
        <a href="Acudiente.jsp">Registrar acudiente</a><br>
        <a href="familiar.jsp">Registrar familiar</a><br>
        <a href="documento.jsp">Registrar documento</a><br>
        <hr>

    

        <a href="actuAlumno.jsp">actualizar alumno</a><br>
        <a href="actuAcudiente.jsp">actualizar acudiente</a><br>
        
        <br>
        <a href="actuDocu.jsp">actualizar documento</a><br>
        
        <form method="post" action="Document">
            <input type="text" name="textid_alum" value="<%=rolVO.getRolId()%>">
            
            <button name="textid_alum" value="<%=rolVO.getRolId()%>" >Actualizar</button>
            
            <input type="hidden" value="3" name="opcion"> 
        </form>

        
    </center>
</body>
</html>
