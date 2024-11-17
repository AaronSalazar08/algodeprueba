<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<!--Este archivo contiene los elementos del menu principal-->
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu Principal</title>
    <link rel="stylesheet" href="menu.css">
</head>

<body>
    <% 
    String mensajeBienvenida = (String) session.getAttribute("mensajeBienvenida");
    if (mensajeBienvenida != null) {
%>
<script>
    alert("<%= mensajeBienvenida %>");
</script>
<% 
        session.removeAttribute("mensajeBienvenida"); 
    }
%>
    <header class="header">
        <div class="menu container">
            <a href="#" class="logo"><img src="imagen/simbolo-caduceo1.png" alt=""></a>
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
        <div class="header-content container">
            <h1>Sistema Solís Salazar</h1>
            <p>
                Nuestro sistema facilita el seguimiento y la atención personalizada de niños con trastornos mentales,
                recopilando información médica y familiar. Permite una coordinación eficiente entre
                profesionales de salud mejorando la calidad de vida de los niños y sus familias,
                garantizando la privacidad y seguridad de los datos.
            </p>
           
        </div>
    </header>
    <section class="crayola">
        <img class="crayola-img" src="imagen/crayola.png" alt="">
        <div class="crayola-content container">
            <h2>Transtornos mentales más comunes en los niños </h2>
            <p class="txt-p">
                Los niños también pueden sufrir enfermedades mentales, que afectan su pensamiento, comportamiento y
                emociones. Entre las más comunes se encuentran el Trastorno por Déficit de Atención e Hiperactividad
                (TDAH), la depresión y la ansiedad. Estas condiciones pueden impactar significativamente su rendimiento
                escolar, relaciones sociales y calidad de vida.
            </p>
            <div class="transtorno-group">
                <div class="transtorno-1">
                    <img src="imagen/ansiedad.png" alt="">
                    <h3>Ansiedad</h3>
                    <p>
                        La ansiedad infantil incluye nerviosismo y evitación de situaciones sociales. Afecta entre el 8%
                        y el 10% de los niños en Costa Rica.
                    </p>
                </div>
                <div class="transtorno-1">
                    <img src="imagen/depresion.png" alt="">
                    <h3>Depresión</h3>
                    <p>
                        La depresión infantil se caracteriza por tristeza persistente, falta de interés en actividades y
                        baja autoestima. Afecta aproximadamente al 4% de los niños en Costa Rica.
                    </p>
                </div>
                <div class="transtorno-1">
                    <img src="imagen/tdah.png" alt="">
                    <h3>TDAH</h3>
                    <p>
                        El Trastorno por Déficit de Atención e Hiperactividad (TDAH) es un trastorno neurobiológico que
                        causa inatención, hiperactividad e impulsividad. Afecta entre el 5% y el 10% de los niños en
                        Costa Rica.
                    </p>
                </div>
            </div>
           
        </div>
    </section>
    <main class="services">
        <div class="services-content container">
            <h2>Sistema Servicios</h2>
            <div class="services-group">
                <div class="Uso-1">
                    <img src="imagen/registra.png" alt="">
                    <h3>Registrar</h3>
                </div>
                <div class="Uso-1">
                    <img src="imagen/Editar.png" alt="">
                    <h3>Editar</h3>
                </div>
                <div class="Uso-1">
                    <img src="imagen/eliminar.png" alt="">
                    <h3>Eliminar</h3>
                </div>
            </div>
            <p>Este Aplicacion Web se encarga de darle mantenimiento al Sistema de Rigistro de la Clínica Solís Salazar, donde el usuario que tiene acceso a esta pagina puede manipular la información de los pacientes. 
            </p>
         
        </div>
    </main>
    <footer class="footer">
        <div class="footer-content container">
            <div class="link">
                <h3>Números de emergencias</h3>
                <ul>
                    <li><a href="#">+506 6098-8878</a></li>
                    <li><a href="#">+506 8477-5646</a></li>
                    <li><a href="#">+506 2665-0993</a></li>
                </ul>
            </div>
            <div class="link">
                <h3>Informate</h3>
                <ul>
                    <li><a href="https://www.who.int/es/news-room/fact-sheets/detail/mental-disorders">Transtornos Mentales</a></li>
                    <li><a href="https://medlineplus.gov/spanish/howtoimprovementalhealth.html">Cómo lidiar con mis transtornos mentales</a></li>
                    <li><a href="https://www.mayoclinic.org/es/healthy-lifestyle/childrens-health/in-depth/mental-illness-in-children/art-20046577">Niños con Problemas Mentales</a></li>
                </ul>
            </div>
            <div class="link">
                <h3>Sitios Web de Apoyo</h3>
                <ul>
                    <li><a href="https://www.communitascr.com/ni%C3%B1os-y-ni%C3%B1as?gclid=Cj0KCQjwv7O0BhDwARIsAC0sjWM4s947zPN7WGPNgIZQCBNvg1IVwn4qg9HqrFIXsnwSWfBkRc6FAHQaAoBrEALw_wcB">Psicología para Niños</a></li>
                    <li><a href="https://www.unisabana.edu.co/portaldenoticias/tutoriales/consejos-para-cuidar-la-salud-mental-de-los-ninos/">Cuidar la Salud Mental de mis Niños</a></li>
                    <li><a href="https://www.healthychildren.org/Spanish/healthy-living/emotional-wellness/Building-Resilience/Paginas/healthy-mental-and-emotional-development-in-children-key-building-blocks.aspx">Fortaleza de los Niños Mentales</a></li>
                </ul>
            </div>
        </div>
    </footer>
</body>

</html>