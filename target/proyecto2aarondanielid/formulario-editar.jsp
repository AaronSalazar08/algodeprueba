<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, java.io.*, javax.servlet.*, javax.servlet.http.*" %>

<% 
//Se capturan los datos para poder mostrarlos, validaros, y procesarlos
String nombre = (String) request.getAttribute("nombre");
String apellido = (String) request.getAttribute("apellido");
String sexo = (String) request.getAttribute("sexo");
String edad = (String) request.getAttribute("edad");
String cedula = (String) request.getAttribute("cedula");
String transtorno = (String) request.getAttribute("transtorno");
String mensaje = (String) request.getAttribute("mensaje");

nombre = (nombre == null) ? "" : nombre;
apellido = (apellido == null) ? "" : apellido;
sexo = (sexo == null) ? "" : sexo;
edad = (edad == null) ? "" : edad;
cedula = (cedula == null) ? "" : cedula;
transtorno = (transtorno == null) ? "" : transtorno;
mensaje = (mensaje == null) ? "" : mensaje;

if (nombre == null || nombre.trim().isEmpty() ||
apellido == null || apellido.trim().isEmpty() ||
sexo == null || sexo.trim().isEmpty() ||
edad == null || edad.trim().isEmpty() ||
cedula == null || cedula.trim().isEmpty() ||
transtorno == null || transtorno.trim().isEmpty()) {

String mensajeError = "Todos los campos son requeridos. Por favor, complete todos los campos.";
request.setAttribute("mensaje", mensajeError);
}
%>
<!--Formulario para manipular la tabla de MySQL-->
<div class="formulario-editar">
    <form id="form-editar" action="editar.jsp" method="post">
        <div class="busqueda-cedula">
            <input type="text" name="cedula-buscada" placeholder="Digite la Cedula a buscar"id="cedulaBuscada-input" value='<%= request.getParameter("cedula-editar") == null ? "" : request.getParameter("cedula-editar") %>'>
            <button type="button" id="buscar-btn"><i class="fas fa-search"></i> Buscar</button>
        </div>
        <input type="text" placeholder="Nombre" name="nombre" id="nombre-input" value="<%= nombre %>">
        <input type="text" placeholder="Apellido" name="apellido" id="apellido-input" value="<%= apellido %>">
        <input type="text" placeholder="Cedula" name="cedula" id="cedula-input" value="<%= cedula %>">
        <input type="number" placeholder="Edad" name="edad" id="edad-input" min="0" value="<%= edad %>">
        <select id="sexo-input" name="sexo">
            <option value="masculino" <%= "masculino".equals(sexo) ? "selected" : "" %>>Masculino</option>
            <option value="femenino" <%= "femenino".equals(sexo) ? "selected" : "" %>>Femenino</option>
            <option value="no-especificar" <%= "no-especificar".equals(sexo) ? "selected" : "" %>>No especificar</option>
        </select>
        <select id="trastorno-input" name="transtorno">
            <option value="depresion" <%= "depresion".equals(transtorno) ? "selected" : "" %>>Depresión</option>
            <option value="obsesivo-compulsivo" <%= "obsesivo-compulsivo".equals(transtorno) ? "selected" : "" %>>Obsesivo Compulsivo</option>
            <option value="ansiedad" <%= "ansiedad".equals(transtorno) ? "selected" : "" %>>Ansiedad</option>
            <option value="deficit-atencional" <%= "deficit-atencional".equals(transtorno) ? "selected" : "" %>>Déficit atencional</option>
            <option value="estres" <%= "estres".equals(transtorno) ? "selected" : "" %>>Estrés</option>
            <option value="autista" <%= "autista".equals(transtorno) ? "selected" : "" %>>Autista</option>
            <option value="alimentario" <%= "alimentario".equals(transtorno) ? "selected" : "" %>>Alimentario</option>
            <option value="esquizofrenia" <%= "esquizofrenia".equals(transtorno) ? "selected" : "" %>>Esquizofrenia</option>
        </select>
        <div class="formulario-botones">
            <button type="button" id="editar-btn"><i class="fas fa-edit"></i> Editar</button>
            <button type="button" id="eliminar-btn"><i class="fas fa-trash"></i> Eliminar</button>
            <button type="button" id="agregar-btn"><i class="fas fa-plus"></i> Agregar</button>
        </div>
    </form>
</div>

<% if (!mensaje.isEmpty()) { %>
    <div id="mensaje">
        <p><%= mensaje %></p>
    </div>
<% } %>

<script>
   document.addEventListener('DOMContentLoaded', function () {
    const buscarBtn = document.getElementById('buscar-btn');
    const editarBtn = document.getElementById('editar-btn');
    const eliminarBtn = document.getElementById('eliminar-btn');
    const agregarBtn = document.getElementById('agregar-btn');

    buscarBtn.addEventListener('click', function () {
        const cedulaBuscada = document.getElementById('cedulaBuscada-input').value.trim();
        if (cedulaBuscada === '') {
            alert('Por favor, ingrese una cédula para buscar.');
            return;
        }
        fetch(`buscar.jsp?cedula-buscada=${cedulaBuscada}`)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Ocurrió un problema al realizar la búsqueda.');
                }
                return response.text();
            })
            .then(data => {
                const parser = new DOMParser();
                const doc = parser.parseFromString(data, 'text/html');
                const formEditar = document.getElementById('form-editar');
                formEditar.querySelector('#nombre-input').value = doc.querySelector('#nombre-input').value;
                formEditar.querySelector('#apellido-input').value = doc.querySelector('#apellido-input').value;
                formEditar.querySelector('#edad-input').value = doc.querySelector('#edad-input').value;
                formEditar.querySelector('#cedula-input').value = doc.querySelector('#cedula-input').value;
                formEditar.querySelector('#sexo-input').value = doc.querySelector('#sexo-input').value;
                formEditar.querySelector('#trastorno-input').value = doc.querySelector('#trastorno-input').value;
            })
            .catch(error => {
                console.error('Error en la búsqueda:', error);
                document.getElementById('mensaje').innerHTML = '<p>Ocurrió un error en la búsqueda.</p>';
            });
    });

    editarBtn.addEventListener('click', function (event) {
        console.log('Editar botón clickeado');
        const formEditar = document.getElementById('form-editar');
        if (!validarCampos(formEditar)) {
            console.log('Campos no válidos');
            alert('Por favor, llene todos los campos antes de editar.');
            event.preventDefault();
        } else {
            console.log('Campos válidos, enviando formulario');
            formEditar.action = 'editar.jsp';
            formEditar.submit();
        }
    });

    eliminarBtn.addEventListener('click', function (event) {
            const cedulaBuscada = document.getElementById('cedulaBuscada-input').value.trim();
            if (cedulaBuscada === '') {
                alert('Por favor, ingrese una cédula para eliminar.');
                event.preventDefault();
                return;
            }
            const formEditar = document.getElementById('form-editar');
            formEditar.action = 'eliminar.jsp';
            formEditar.submit();
        });
    

    agregarBtn.addEventListener('click', function (event) {
        console.log('Agregar botón clickeado');
        const formEditar = document.getElementById('form-editar');
        if (!validarCampos(formEditar)) {
            console.log('Campos no válidos');
            alert('Por favor, llene todos los campos antes de agregar.');
            event.preventDefault();
        } else {
            console.log('Campos válidos, enviando formulario');
            formEditar.action = 'insertar.jsp';
            formEditar.submit();
        }
    });

    function validarCampos(formulario) {
        const nombre = formulario.querySelector('#nombre-input').value.trim();
        const apellido = formulario.querySelector('#apellido-input').value.trim();
        const edad = formulario.querySelector('#edad-input').value.trim();
        const cedula = formulario.querySelector('#cedula-input').value.trim();
        const sexo = formulario.querySelector('#sexo-input').value.trim();
        const trastorno = formulario.querySelector('#trastorno-input').value.trim();

        return nombre !== '' && apellido !== '' && edad !== '' && cedula !== '' && sexo !== '' && trastorno !== '';
    }
});

</script>
