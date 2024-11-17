<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<!--Archivo que contiene la guía acerca del funcionamiento de la apliacición web-->
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Guía</title>
    <link rel="stylesheet" href="guia.css">

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
    <main>
        <div class="contenedor">
            <iframe width="100%" height="100%" src="https://www.youtube.com/embed/i_fAoXp-xp8?si=hKKI1D2_lSqEtkGf" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
        </div>
        </main>
</body>

</html>