<%-- 
    Document   : regAlumno
    Created on : 3/08/2022, 04:48:50 PM
    Author     : solan
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.RolDAO"%>
<%@page import="ModeloVO.RolVO"%>
<%@page import="ModeloVO.lunacVO"%>
<%@page import="ModeloDAO.lunacDAO"%>
<%@page import="ModeloDAO.EpsDAO"%>
<%@page import="ModeloVO.EpsVO"%>
<%@include file="Sesiones.jsp" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Alumno</title>
    </head>
    <body>
    <center>

        <% RolVO rolVO = new RolVO();
            RolDAO rolDAO = new RolDAO();
            ArrayList<RolVO> listaDatos = rolDAO.listar(usuario);

            for (int i = 0; i < listaDatos.size(); i++) {

                rolVO = listaDatos.get(i);
            }
        %>
        <a href="alumno.jsp">Volver</a><br>
        <h1>Registrar</h1>
        <form method="post" action="Alumno" class="rusu">

            <table>
                <%
     if (request.getAttribute("MensajeError") != null) { %>
                ${MensajeError}

                <%} else {%>
                ${MensajeExito}        
                <%}%>

                <input type="hidden" name="textid_usua" value="<%=rolVO.getRolId()%>"><br> 

                <br> Eps<br>
                <select name="textid_eps" class="browser-default"
                        size="1" aria-label="size 1 select example">

                    <option>Seleccione la eps</option>
                    <%
                        EpsDAO epsDAO = new EpsDAO();
                        for (EpsVO epsVO : epsDAO.listar()) {
                    %>
                    <option value="<%= epsVO.getId_eps()%>"> <%= epsVO.getNom_eps()%></option>
                    <%}%>
                </select><br> 

                <br>Lugar de Nacimiento<br>
                <select name="textid_luganaci" class="browser-default" 
                        size="1" aria-label="size 1 select example">

                    <option>Seleccione lugar de nacimiento</option>
                    <%
                        lunacDAO lunacDAO = new lunacDAO();
                        for (lunacVO lunacVO : lunacDAO.listarn()) {
                    %>
                    <option value="<%= lunacVO.getId_luganaci()%>"> <%= lunacVO.getNom_luganaci()%></option>
                    <%}%>
                </select><br>

                <br>Primer nombre <br>
                <input type="text" name="textnom1_alum"><br> 

                <br>Segundo nombre<br>
                <input type="text" name="textnom2_alum"><br> 

                <br>Primer Apellido <br>
                <input type="text" name="textapel1_alum"><br> 

                <br>Segundo Apellido<br>
                <input type="text" name="textapel2_alum"><br> 

                <br>Numero Nuip<br>
                <input type="number" name="textnuip_alumn"><br>

                <br>Fecha de nacimiento<br>
                <input type="date" id="start" name="textfechnaci_alum" 
                       value="elige" ><br>

                <br>Grupo Sanguineo<br>
                <input type="text" name="textgrupsangui_alum"><br> 

                <br>Numero de Hermanos <br>
                <input type="number" name="textnumherma_alum"><br>

                <br>Direccion Domicilio <br>
                <input type="text" name="textdirec_alum"><br> 



                <br>Telefono fijo<br>
                <input type="text" name="texttelefijo_alum"><br>  

                <br>Celular <br>
                <input type="text" name="texttelecelu_alum"><br> 

                <br>Alergias <br>
                <input type="text" name="textalerg_alum"><br>

                <br>Medicamentos <br>
                <input type="text" name="textmedica_alumd"><br> 

                <br>Peso  <br>
                <input type="text" name="textpeso_alum"><br>

                <br>Altura <br>
                <input type="text" name="textaltura_alum"><br>

                <br>Enfermedades <br>
                <input type="text" name="textenferm_alum"><br>

                <br>Describa la enfermedad <br>
                <input type="text" name="textdescenferm_alum"><br>

                

            </table><br>
            <button>Registar</button>
            <input type="hidden" value="1" name="opcion">



        </form>





    </center>

</body>
</html>
