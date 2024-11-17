<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<% 
String usuario = request.getParameter("usuario");
String contrasena = request.getParameter("contrasena");


String URL = "jdbc:mysql://localhost:3306/centro_apoyo_solissalazar?useUnicode=true&characterEncoding=utf8";
String nombreUsuario = "root";
String nombreClave = "Proverbios18.22";  

Connection conn = null;
PreparedStatement stmt = null;
ResultSet rs = null;

    try {
       Class.forName("com.mysql.jdbc.Driver");
       conn = DriverManager.getConnection(URL, nombreUsuario, nombreClave);

        String sql = "SELECT * FROM administrador WHERE Usuario = ? AND Clave = ?";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, usuario);
        stmt.setString(2, contrasena);
        rs = stmt.executeQuery();

        if (rs.next()) {
           %>
           <p class="welcome-message">Bienvenido, <%= usuario %>!</p>
<%
            response.sendRedirect("menu.jsp");
        } else {
            out.println("<p class='error-message'>Usuario o contraseña incorrectos</p>");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }

%>