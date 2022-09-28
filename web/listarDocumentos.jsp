<%-- 
    Document   : prueba
    Created on : 21-sep-2022, 18:27:22
    Author     : yoang
--%>

<%@page import="ModeloDAO.RolDAO"%>
<%@page import="ModeloVO.RolVO"%>
<%@page import="ModeloDAO.docuDAO"%>
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
    <center>
        <a href="alumno.jsp">Volver</a>
        <br>
        <h2>Documentos</h2>
        <br><br>
        <form method="post" action="Document">

            <table border="1px">
                <tr>
                    <th>n</th>
                    <th>alumno</th>
                    <th>documento</th>
                    <th>fecha</th>
                    <th>archivo</th>
                    <th>opciones</th>
                </tr>

                <%                docuVO doVO = new docuVO();
                    docuDAO doDAO = new docuDAO();

                    ArrayList<docuVO> ListarDocumentos = doDAO.listar();
                    for (int i = 0; i < ListarDocumentos.size(); i++) {
                        doVO = ListarDocumentos.get(i);

                %>

                <tr>
                    <td><%= doVO.getId_docu() %></td>
                    <td><%= doVO.getId_alum()%></td>
                    <td><%= doVO.getTipo_docu()%></td>
                    <td><%= doVO.getFechcreac_docu()%></td>
                    <td><%= doVO.getArchivo_docu() %></td>

                    <td>
                        <form method="post" action="Document">
                            

                            <button name="textid_docu" value="<%= doVO.getId_docu() %>" >Actualizar</button>

                            <input type="hidden" value="3" name="opcion"> 
                        </form>
                    </td>
                </tr>
                <%}%>
                
                 <%
            if (request.getAttribute("mensajeError") != null) { %>
        ${mensajeError}

        <%} else {%>
        ${mensajeExito}        
        <%}%>
        
        
            </table>
        </form>
    </center>
    </body>
</html>
