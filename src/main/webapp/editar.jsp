<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<% 
//Al darle click al boton de editar, lo redirecciona a este archivo y ejecuta la sentencia SQL de editar
//Por medio de este archivo .jsp, segun la cedula buscada, se reciben los datos y se modifican segun las necesidades del usuario
//El usuario una vez haya ingresado los datos a modificar en la fila donde se encuentra la ceudla buscada redirecciona al mantenimiento.jsp
String entradaNombre = request.getParameter("nombre");
String entradaApellido = request.getParameter("apellido");
String entradaEdad = request.getParameter("edad");
String cedulaBuscada = request.getParameter("cedula-buscada");
String entradaSexo = request.getParameter("sexo");
String entradaTranstorno = request.getParameter("transtorno");

int edadPaciente = 0;

try {
    edadPaciente = Integer.parseInt(entradaEdad);
} catch (NumberFormatException ex) {
    ex.printStackTrace();
    request.setAttribute("mensaje", "No se encontró ningún paciente con la cédula especificada.");
    return;
}

String URL = "jdbc:mysql://localhost:3306/centro_apoyo_solissalazar?useUnicode=true&characterEncoding=utf8";
String nombreUsuario = "root";
String nombreClave = "Proverbios18.22";  

Connection conn = null;
PreparedStatement pstmt = null;

try {
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection(URL, nombreUsuario, nombreClave);

    String SQL = "UPDATE pacientes SET Nombre=?, Apellido=?, Sexo=?, Edad=?, Transtorno=? WHERE Cedula=?";
    pstmt = conn.prepareStatement(SQL);
    pstmt.setString(1, entradaNombre);
    pstmt.setString(2, entradaApellido);
    pstmt.setString(3, entradaSexo);
    pstmt.setInt(4, edadPaciente);
    pstmt.setString(5, entradaTranstorno);
    pstmt.setString(6, cedulaBuscada);

    int filaActualizada = pstmt.executeUpdate();

    if (filaActualizada > 0) {
        request.setAttribute("mensaje", "El paciente se ha editado correctamente!");
        response.sendRedirect("mantenimiento.jsp");
    } else {
        request.setAttribute("mensaje", "No se pudo editar el paciente correctamente, los datos están vacios o inválidos");
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
