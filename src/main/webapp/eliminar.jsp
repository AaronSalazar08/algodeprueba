<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<% 
//Por medio de la cedula buscada, al presionar el boton de eliminar, se envia a este archivo y se ejecuta la sentencia SQL
String cedulaBuscada = request.getParameter("cedula-buscada");


String URL = "jdbc:mysql://localhost:3306/centro_apoyo_solissalazar?useUnicode=true&characterEncoding=utf8";
String nombreUsuario = "root";
String nombreClave = "Proverbios18.22";  

Connection conn = null;
PreparedStatement pstmt = null;

try {
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection(URL, nombreUsuario, nombreClave);

    String SQL = "DELETE FROM pacientes WHERE Cedula=?";
    pstmt = conn.prepareStatement(SQL);
    pstmt.setString(1, cedulaBuscada);

    int filaActualizada = pstmt.executeUpdate();

    if (filaActualizada > 0) {
        request.setAttribute("mensaje", "El paciente se ha eliminado correctamente!");
        response.sendRedirect("mantenimiento.jsp");
    } else {
        request.setAttribute("mensaje", "No se encontró ningún paciente con la cédula especificada.");
    }
} catch (SQLException e) {
    request.setAttribute("mensaje", "Error en la Base de Datos");
    e.printStackTrace();
} catch (ClassNotFoundException e) {
    request.setAttribute("mensaje", "No se encontro el conector a la Base de Datos");
    e.printStackTrace();
} finally {
    if (pstmt != null) {
        try { 
            pstmt.close(); 
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    if (conn != null) {
        try { 
            conn.close(); 
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
%>
