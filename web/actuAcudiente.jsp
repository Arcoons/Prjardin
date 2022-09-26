<%-- 
    Document   : actuAcudiente
    Created on : 11/09/2022, 08:31:47 PM
    Author     : solan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Sesiones.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <h1>Acudiente</h1>
        
        
        
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
                <input type="text" name="textparent_acud"><br>
                
                <br>estado <br>
                <input type="text" name="textestadoauto_acud"><br>
               
           
                <br>Estado numerico <br>
                <input type="texto" id="acu" name="textesta_acud" >      <br>         
                
                <br>Fecha de Nacimiento <br>
                <input type="date" id="acu" name="textfechnaci_acud" 
                       value="fecha" > <br>
                
                 <br>id alumno <br>
                <input type="text" id="acu" name="textid_alum">
                     
               
            </table><br>
            <button>Actualizar</button>
            <input type="hidden" value="2" name="acuopcion">
            
            <a href="alumno.jsp">Volver</a>
        </form>


        <%
            if (request.getAttribute("MensajeError") != null) { %>
        ${MensajeError}

        <%} else {%>
        ${MensajeExito}        
        <%}%>

        
        
    </body>
</html>
