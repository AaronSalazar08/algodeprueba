<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.sql.*, javax.servlet.*, javax.servlet.http.*" %>

<%
//Esta clase .jsp lo que hace es buscar la cedula, y si la encuentra, envia la fla (la respuesta) de esa cedula al archivo formulario-editar.jsp
String cedula_buscada = request.getParameter("cedula-buscada");

String URL = "jdbc:mysql://localhost:3306/centro_apoyo_solissalazar?useUnicode=true&characterEncoding=utf8";
String nombreUsuario = "root";
String nombreClave = "Proverbios18.22"; 

Connection conn = null;
PreparedStatement stmt = null;
ResultSet rs = null;

try {
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection(URL, nombreUsuario, nombreClave);
    
    String SQL = "SELECT * FROM pacientes WHERE Cedula = ?";
    stmt = conn.prepareStatement(SQL);
    stmt.setString(1, cedula_buscada);
    
    rs = stmt.executeQuery();
    
    if (rs.next()) {
        request.setAttribute("nombre", rs.getString("Nombre"));
        request.setAttribute("apellido", rs.getString("Apellido"));
        request.setAttribute("sexo", rs.getString("Sexo"));
        request.setAttribute("edad", rs.getString("Edad"));
        request.setAttribute("cedula", rs.getString("Cedula"));
        request.setAttribute("transtorno", rs.getString("Transtorno"));
    } else {
        request.setAttribute("mensaje", "No se encontró ningún paciente con la cédula especificada.");
    }

} catch (SQLException | ClassNotFoundException e) {
    e.printStackTrace();
    request.setAttribute("mensaje", "Error en la conexión a la base de datos.");
} finally {
    if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
    if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
    if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
}

request.getRequestDispatcher("formulario-editar.jsp").forward(request, response);
%>
