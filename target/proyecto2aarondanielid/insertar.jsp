<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<% 

//Al darle click al boton de insertar, captura los datos de los formularios e inserta los datos en la tabla por medio de una sentencia SQL
String entrada_nombre = request.getParameter("nombre");
String entrada_apellido = request.getParameter("apellido");
String entrada_edad = request.getParameter("edad");
String entrada_cedula = request.getParameter("cedula");
String entrada_sexo = request.getParameter("sexo");
String entrada_transtorno = request.getParameter("transtorno");

int edadPaciente = 0;

try{
    edadPaciente = Integer.parseInt(entrada_edad);
} catch (NumberFormatException ex){
ex.printStackTrace();
return;
}

String URL = "jdbc:mysql://localhost:3306/centro_apoyo_solissalazar?useUnicode=true&characterEncoding=utf8";
String nombreUsuario = "root";
String nombreClave = "Proverbios18.22";  

Connection conn = null;
PreparedStatement stmt = null;

try {
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection(URL, nombreUsuario, nombreClave);

    String SQL = "INSERT INTO pacientes (Cedula, Nombre, Apellido, Sexo, Edad, Transtorno) VALUES (?, ?, ?, ?, ?, ?)";
     stmt = conn.prepareStatement(SQL);

          
     stmt.setString(1, entrada_cedula);
     stmt.setString(2, entrada_nombre);
     stmt.setString(3, entrada_apellido);
     stmt.setString(4, entrada_sexo);  
     stmt.setInt(5, edadPaciente);
     stmt.setString(6, entrada_transtorno);
            
    int filaInsertada = stmt.executeUpdate();

    if (filaInsertada > 0) {
        request.setAttribute("mensaje", "El paciente se ha agregado correctamente!");
        response.sendRedirect("mantenimiento.jsp");
    } else {
        request.setAttribute("mensaje", "No se pudo insetar el paciente correctamente, los datos están vacios o inválidos");
    }
} catch (SQLException e) {
    request.setAttribute("mensaje", "Error en la Base de Datos");
    e.printStackTrace();
} catch (ClassNotFoundException e) {
    request.setAttribute("mensaje", "No se encontro el conector a la Base de Datos");
    e.printStackTrace();
} finally {
    if (stmt != null) {
        try { 
            stmt.close(); 
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
