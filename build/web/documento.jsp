<%-- 
    Document   : documento
    Created on : 11/09/2022, 11:30:38 PM
    Author     : solan
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
    </head>
    <body>
    <center>
           <h1>Acudiente</h1>
        
        <% RolVO rolVO = new RolVO();
            RolDAO rolDAO = new RolDAO();
            ArrayList<RolVO> listaDatos = rolDAO.listar(usuario);

            for (int i = 0; i < listaDatos.size(); i++) {

                rolVO = listaDatos.get(i);
            }
        %>
        
        <form method="post" action="Document" >

            <table>

              
                <input type="hidden" name="textid_alum" value="<%=rolVO.getRolId()%>"><br> 

                
                                         
                <br>Nombre del Documento <br>
                <select name="texttipo_docu">
                    <option>Seleccione</option>
                    <option value="Registro Civil">Registro Civil</option>
                    <option value="Carnet Vacuna">Carnet de Vacunas</option>
                    <option value="Certificado EPS">Certificado EPS</option>
                    <option value="Vacuna Covid">Vacuna Covid</option>
                    <option value="Cedula Padres">Cedula Padres</option>
                </select>
                
                <br><br> archivo <br>
                <input type="file" name="textarchivo_docu"><br>
                
               
            </table><br>
            <button>Cargar Documentos</button>
            <input type="hidden" value="1" name="opcion">
            
            <a href="alumno.jsp">Volver</a>
        </form>


        <%
            if (request.getAttribute("MensajeError") != null) { %>
        ${MensajeError}

        <%} else {%>
        ${MensajeExito}        
        <%}%>

        
    </center>
        
        
        
    </body>
</html>
