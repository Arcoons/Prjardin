<%-- 
    Document   : actuDocu
    Created on : 11/09/2022, 11:30:56 PM
    Author     : solan
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.RolDAO"%>
<%@page import="ModeloVO.RolVO"%>
<%@page import="ModeloVO.docuVO"%>
<%@include file="Sesiones.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <a href="alumno.jsp">Volver</a>
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
         <h1>Documentos</h1>
        
        <% 
        docuVO doVO = (docuVO)request.getAttribute("datosConsultados");
       if(doVO !=null){
        
        %>
        
        <form method="post" action="Document" class="docu">

            <table>

                <br>Nombre del Documento <br>
                <input type="text" name="texttipo_docu" value="<%= doVO.getTipo_docu() %>"><br>
                
                <br> arcivo <br>
                <input type="file" name="textarchivo_docu"  value=" <%= doVO.getArchivo_docu() %>"><br>
               
            </table><br>
            <button>Actualizar</button>
            <input type="hidden" value="2" name="opcion">
            <input type="hidden" name="textid_alum" value="<%=rolVO.getRolId()%>">
        </form>

        <%} %>
        <%
            if (request.getAttribute("MensajeError") != null) { %>
        ${MensajeError}

        <%} else {%>
        ${MensajeExito}        
        <%}%>

        
        
        
        
        
        
    </body>
</html>
