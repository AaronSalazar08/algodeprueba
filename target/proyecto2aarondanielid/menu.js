document.addEventListener('DOMContentLoaded', () => {
    const panels = document.querySelectorAll('.panel');
    const menuItems = document.querySelectorAll('.nav-bar ul li a');
    const agregarBtn = document.getElementById('agregar-btn');
    const cancelarBtn = document.getElementById('cancelar-btn');
    const formularioContenedor = document.getElementById('formulario-contenedor');

    menuItems.forEach(item => {
        item.addEventListener('click', (e) => {
            e.preventDefault();

           
            panels.forEach(panel => panel.classList.remove('active'));
            menuItems.forEach(menu => menu.classList.remove('active'));

           
            const panelId = item.id.replace('-btn', '-panel');
            document.getElementById(panelId).classList.add('active');
            item.classList.add('active');
        });
    });

    
    agregarBtn.addEventListener('click', () => {
        formularioContenedor.classList.remove('oculto');
        formularioContenedor.style.display = 'block'; 
    });

   
    cancelarBtn.addEventListener('click', () => {
        formularioContenedor.classList.add('oculto');
        formularioContenedor.style.display = 'none'; 
    });
});

document.addEventListener("DOMContentLoaded", () =>{

    const aceptarbtn = document.getElementById('aceptar-btn');

    aceptarbtn.addEventListener('click', () =>{

       const form = document.getElementById('paciente-form');
       const formData = new FormData(form);

       fetch('insertar.jsp', {
        method: 'POST', 
        body: formData
       })
       .catch(error => console.error('Error', error));
    });

});

document.addEventListener("DOMContentLoaded", function(){

    fetch("mostrar.jsp")
    .then(response => response.json())
    .then(data =>{
        const tabla = document.getElementById("tablaPacientes");
        data.forEach(fila =>{

            const tr = document.createElement("tr");
            const tdCedula = document.createElement("td");
            tdCedula.textContent = fila.columna1;
            const tdNombre = document.createElement("td");
            tdCedula.textContent = fila.columna2;
            const tdApellido = document.createElement("td");
            tdCedula.textContent = fila.columna3;
            const tdSexo = document.createElement("td");
            tdCedula.textContent = fila.columna4;
            const tdEdad = document.createElement("td");
            tdCedula.textContent = fila.columna5;
            const tdTranstorno = document.createElement("td");
            tdCedula.textContent = fila.columna6;
            tr.appendChild(tdCedula);
            tr.appendChild(tdNombre);
            tr.appendChild(tdApellido);
            tr.appendChild(tdSexo);
            tr.appendChild(tdEdad);
            tr.appendChild(tdTranstorno);
            tabla.appendChild(tr);

        });
    });
});