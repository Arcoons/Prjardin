<%-- 
    Document   : roles.jsp
    Created on : 14/09/2022, 08:05:17 AM
    Author     : ranyerino
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.RolDAO"%>
<%@page import="ModeloVO.RolVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="Estilos/menu.css">
        <link rel="stylesheet" href="Estilos/index.css">
        <title>JSP Page</title>
    </head>
    <body>
        <nav>
            <ul>
                <li><a href="admin.jsp">Inicio</a></li>
                <li><a href="perfil.jsp">Perfil</a></li>
                <li><a href="registrarUsuario.jsp">Registrar usuario</a></li>
                <form method="post" action="Sesiones">
                    <input type="submit" value="Cerrar Sesion" >
                </form>
            </ul>
        </nav>
        <div class="login-box">
            <h2>Asginar roles a Usuario</h2>
            <form method="post" action="Usuario">
                <div class="user-box">
                    <h2><%=request.getAttribute("loginUsuario")%></h2><br>
                </div>
                <div class="user-box">
                    <h2><%=request.getAttribute("estadoUsuario")%></h2><br>
                </div>
                <h3>roles</h3>
                <select name="rol">
                        <option>Elija el rol</option>
                        <%RolVO rolVO = new RolVO();
                            RolDAO rolDAO = new RolDAO(rolVO);
                            ArrayList<RolVO> listarRoles = rolDAO.listarRoles();
                            for (int i = 0; i < listarRoles.size(); i++) {

                                rolVO = listarRoles.get(i);

                        %>
                        <option value="<%=rolVO.getRolId()%>"><%=rolVO.getRolTiPo()%></option>
                        <%
                            }
                        %>
                    </select><br>
                <div class="user-box">
                    <button>asignar</button> <br>
            <input type="hidden" value="<%=request.getAttribute("idUsuario")%>" name="usuarioID">
            <input type="hidden" value="9" name="opcion">
                </div>
            </form>
            <%
            if (request.getAttribute("mensajeError") != null) { %>
        ${mensajeError}

        <%} else {%>
        ${mensajeExito}        
        <%}%>
        </div>
    </body>
</html>
