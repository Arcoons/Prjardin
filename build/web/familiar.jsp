<%-- 
    Document   : familiar
    Created on : 7/09/2022, 11:47:33 PM
    Author     : solan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Sesiones.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Familiar</title>
    </head>
    <body>
    <center>
        <a href="alumno.jsp">Volver</a>
        <br>
        <h1>Familiar</h1>


 <%            if (request.getAttribute("MensajeError") != null) { %>
        ${MensajeError}

        <%} else {%>
        ${MensajeExito}        
        <%}%>
        <form method="post" action="Familiar" class="fami">

            <table>



                <br>Primer Nombre <br>
                <input type="text" name="textnom1_fami"><br>

                <br>Segundo Nombre <br>
                <input type="text" name="textnom2_fami"><br>

                <br>Primer Apellido <br>
                <input type="text" name="textapel1_fami"><br>

                <br> Segundo Apellido <br>
                <input type="text" name="textapel2_fami"><br>

                <br> Parentesco  <br>

                <select name="textparent_fami">
                    <option>Seleccione</option>
                    <option value="Madre">Madre</option>
                    <option value="Padre">Padre</option>
                    <option value="Hermano/a">Hermano/a</option>
                    <option value="Abuelo/a">Abuelo/a</option>
                    <option value="Otro">Otro</option>
                </select>

                <br>Numero de documento  <br>
                <input type="number" name="textnumdocu_fami"><br>

                <br>ocupacion  <br>
                <input type="text" name="textocupac_fami"><br>

                <br> lugar de trabajo <br>
                <input type="text" name="textlugatrab_fami"><br>

                <br>numero de contacto empresarial <br>
                <input type="tel" name="textteletrab_fami"><br>
                <br>

                <br> telefono celular <br>
                <input type="tel" name="texttelecel_fami"><br>

                <br>Fecha de Nacimiento <br>
                <input type="date" id="acu" name="textfechnaci_fami" 
                       value="fecha" ><br>



            </table><br>
            <button>Registar</button>
            <input type="hidden" value="1" name="opcion">


        </form>


       


    </center>



</body>
</html>
