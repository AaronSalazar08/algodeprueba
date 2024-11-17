<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.io.*, javax.servlet.*, javax.servlet.http.*" %>

<!DOCTYPE html>
<html lang="es">
<!--En este archivo se agregan los elementos de lo que tendra el apartado de mantenimiento. 
Se carga el formulario a manipular y se visualiza la tabla de MySQL-->
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mantenimiento del Sistema</title>
    <link rel="stylesheet" href="mantenimiento.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body>
<div class="container">
    <header class="header">
        <div class="menu container">
            <a href="menu.jsp" class="logo"><img src="imagen/simbolo-caduceo1.png" alt=""></a>
            <input type="checkbox" id="menu" />
            <label for="menu">
               
            </label>
            <nav class="navbar">
                <ul>
                    <li><a href="menu.jsp">Inicio</a></li>
                    <li><a href="mantenimiento.jsp">Pacientes</a></li>
                    <li><a href="guia.jsp">Guía</a></li>
                    <li><a href="creditos.jsp">Acerca de</a></li>
                </ul>
            </nav>
        </div>
        </header>
</div>
    <%@ include file="formulario-editar.jsp" %>

    <div>
        <table class="tabla-datos">
            <thead>
                <tr>
                    <th>Cédula</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Sexo</th>
                    <th>Edad</th>
                    <th>Trastorno</th>
                </tr>
            </thead>
            <tbody id="tablaPacientes">
                <jsp:include page="mostrar.jsp"/>
            </tbody>
        </table>
    </div>

</body>

</html>
