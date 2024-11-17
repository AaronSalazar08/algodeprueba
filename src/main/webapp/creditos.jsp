<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<!--Este archivo contiene los elementos graficos de los creditos de los desarrolladores de la pagina web-->
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Credios</title>
    <link rel="stylesheet" href="creditos.css">
    
</head>

<body>
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
        <section>
    <div class="administrativo-container">
        <div id="administrativo-panel" class="panel administrativo-panel">Sección Administrativa</div>
        <div id="acerca-panel" class="panel acerca-panel active">
            <p>Esta página fue creada por los estudiantes de la Universidad de Costa Rica, José Daniel Solís Cordoncillo y Aaron Salazar Mata. Su objetivo es servir de apoyo para el registro y análisis de datos de niños que padecen trastornos mentales a nivel nacional. Con esta plataforma, se busca proporcionar una herramienta útil y accesible que permita a profesionales y organizaciones gestionar de manera más eficiente la información relevante sobre estos niños, facilitando así su seguimiento y tratamiento adecuado.</p>
           
            
            <div class="image-container">
                <div class="image-box">
                    <img src="imagen/Aaron.jpg" alt="Aaron Salazar" class="image">
                    <p class="description">Aaron Salazar</p>
                </div>
                <div class="image-box">
                    <img src="imagen/Daniel.jpg" alt="Daniel Solís" class="image">
                    <p class="description">Daniel Solís</p>
               
            </div>
            </div>
        </div>
    </section>
    
  
    </div>
</body>

</html>