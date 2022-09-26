<%-- 
    Document   : AcudienteVO
    Created on : 6/09/2022, 09:45:34 PM
    Author     : solan
--%>

<%@page import="ModeloVO.RolVO"%>
<%@page import="ModeloDAO.RolDAO"%>
<%@page import="ModeloDAO.AlumnoDAO"%>
<%@page import="ModeloVO.AlumnoVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.ProfesorDAO"%>
<%@page import="ModeloVO.ProfesorVO"%>
<%@include file="Sesiones.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Acudiente</title>
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
    <center>
             <a href="alumno.jsp">Volver</a>
        <h1>Acudiente</h1>
        
         <%
            if (request.getAttribute("MensajeError") != null) { %>
        ${MensajeError}

        <%} else {%>
        ${MensajeExito}        
        <%}%>

        
        <form method="post" action="Acudiente" class="acu">
            
            

            <table> 

                <br>Primer Nombre <br>
                <input type="text" name="textnom1_acud"><br>
                
                <br>Segundo Nombre <br>
                <input type="text" name="textnom2_acud"><br>
                
                <br>Primer Apellido <br>
                <input type="text" name="textapel1_acud"><br>
                
                <br> Segundo Apellido <br>
                <input type="text" name="textapel2_acud"><br>
                
                <br> Numero de documento <br>
                <input type="text" name="textnumdocu_acud"><br>
                
                <br>Telefono Celular  <br>
                <input type="text" name="texttele_acud"><br>
                
                <br> Direccion <br>
                <input type="text" name="textdirec_acud"><br>
                
                <br>Parentesco al alumno <br>
                
                <select name="textparent_acud">
                    <option value="1">Tio</option>
                    <option value="2">Primo</option>
                    <option value="3">Abuelo</option>
                    <option value="4">Madre</option>
                    <option value="5">Padre</option>
                </select>
                
                
                
               
                <br>Fecha de Nacimiento <br>
                <input type="date" id="acu" name="textfechnaci_acud" 
                       value="fecha" ><br>
                

                
                
                
                
            </table><br>
            <button>Registar</button>
            <input type="hidden" value="1" name="acuopcion">
            
       
        </form>


       
        </center>
        
        
        
        
    </body>
</html>
