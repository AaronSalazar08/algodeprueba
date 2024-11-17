<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<%
//Este archivo ejectura la sentencia SQL donde selecciona todas las filas de la tabla y por medio de javascript se cargan a la tabla en mantenimiento
String URL = "jdbc:mysql://localhost:3306/centro_apoyo_solissalazar?useUnicode=true&characterEncoding=utf8";
String nombreUsuario = "root";
String nombreClave = "Proverbios18.22"; 

Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

response.setContentType("application/json");
response.setCharacterEncoding("UTF-8");

try {
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection(URL, nombreUsuario, nombreClave);
    stmt = conn.createStatement();
    String SQL = "SELECT * FROM pacientes;";
    rs = stmt.executeQuery(SQL);
    
    
    while(rs.next()){
            out.print("<tr>");
            out.print("<td>" + rs.getString("Cedula") + "</td>");
            out.print("<td>" + rs.getString("Nombre") + "</td>");
            out.print("<td>" + rs.getString("Apellido") + "</td>");
            out.print("<td>" + rs.getString("Sexo") + "</td>");
            out.print("<td>" + rs.getString("Edad") + "</td>");
            out.print("<td>" + rs.getString("Transtorno") + "</td>");
            out.print("</tr>");

    }

  

} catch (SQLException | ClassNotFoundException e) {
    e.printStackTrace();
} finally {
    if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
    if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
    if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
}
%>