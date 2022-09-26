<%-- 
    Document   : ConsultarMat2
    Created on : 04-sep-2022, 20:27:30
    Author     : yoang
--%>


<%@page import="ModeloVO.RolVO"%>
<%@page import="ModeloDAO.RolDAO"%>

<%@page import="ModeloVO.UsuarioVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.MatriculaDAO"%>
<%@page import="ModeloVO.MatriculaVO"%>
<%@include file="Sesiones.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.1.3/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css">

        <link rel="stylesheet" href="Estilos/director.css">
        <title>Consultar Matricula</title>
    </head>
    <body>


        <% RolVO rolVO = new RolVO();
            RolDAO rolDAO = new RolDAO();
            ArrayList<RolVO> listaDatos = rolDAO.listar(usuario);

            for (int i = 0; i < listaDatos.size(); i++) {

                rolVO = listaDatos.get(i);
            }
        %>




        <div class="contenido">


            <a href="director.jsp" class="btn-est3">Volver</a>
            <h1>Matriculas por registradas</h1>



            <br>

            <%            if (request.getAttribute("mensajeError") != null) { %>
            ${mensajeError}

            <%} else {%>
            ${mensajeExito}        
            <%}%>


            <br>
            <table id="example" class="table table-striped" style="width:100%">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Alumno</th>
                        <th>Director</th>
                        <th>Registro</th>
                        <th>Fecha ultima modificacion</th>
                        <th>Estado</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        MatriculaVO matVO = new MatriculaVO();
                        MatriculaDAO matDAO = new MatriculaDAO();
                        ArrayList<MatriculaVO> listaMatrEst = matDAO.listarEst();
                        for (int i = 0; i < listaMatrEst.size(); i++) {
                            matVO = listaMatrEst.get(i);


                    %>
                    <tr>
                        <td><%= matVO.getIdMatr()%></td>
                        <td><%= matVO.getIdUsua()%></td>
                        <td><%= matVO.getIdAlum()%></td>
                        <td><%= matVO.getRegiMatr()%></td>
                        <td><%= matVO.getFechMatr()%></td>
                        <td><%= matVO.getEstaMatr()%></td>



                        <%
                            if (matVO.getEstaMatr().equals("activo")) {
                        %>
                        <td>
                            <form method="post" action="Matricula">
                                <input type="hidden" name="textUsua" value="<%=rolVO.getRolId()%>">
                                <button class="btn-est2" name="textMatr" value="<%= matVO.getIdMatr()%>" >Inactivar</button>

                                

                                <input type="hidden" value="3" name="opcion"> 
                            </form>

                        </td>




                        <% } else if (matVO.getEstaMatr().equals("inactivo")) {%>

                        <td>

                            <form method="post" action="Matricula">
                                <input type="hidden" name="textUsua" value="<%=rolVO.getRolId()%>">
                                
                                <button class="btn-est" name="textMatr" value="<%= matVO.getIdMatr()%>" >Activar</button>
                             
                                <input type="hidden" value="5" name="opcion"> 
                            </form>

                        </td>




                        <% }%>


                    </tr>
                </tbody>
                <% }%>
            </table>











        </div>





        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>
        <script src="https://kit.fontawesome.com/6131ecdde6.js" crossorigin="anonymous"></script>


        <script src="js/modal.js"></script>
        <script src="js/script.js"></script>
    </body>
</html>

