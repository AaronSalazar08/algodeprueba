
        document.addEventListener('DOMContentLoaded', function() {
            const buscarBtn = document.getElementById('buscar-btn');
            const editarBtn = document.getElementById('editar-btn');
            const eliminarBtn = document.getElementById('eliminar-btn');
            const agregarBtn = document.getElementById('agregar-btn');

            buscarBtn.addEventListener('click', function() {
                const cedulaBuscada = document.getElementById('cedula-editar').value;
                
               
                if (cedulaBuscada.trim() === '') {
                    alert('Por favor, ingrese una cédula para buscar.');
                    return;
                }

                fetch(`buscar.jsp?cedula-editar=${cedulaBuscada}`)
                    .then(response => {
                        if (!response.ok) {
                            throw new Error('Ocurrió un problema al realizar la búsqueda.');
                        }
                        return response.text();
                    })
                    .then(data => {
                        document.getElementById('formulario-editar').innerHTML = data;
                    })
                    .catch(error => {
                        console.error('Error en la búsqueda:', error);
                        document.getElementById('mensaje').innerHTML = '<p>Ocurrió un error en la búsqueda.</p>';
                    });
            });

            editarBtn.addEventListener('click', function() {
                const formEditar = document.getElementById('form-editar');
                formEditar.action = 'editar.jsp';
                formEditar.submit();
            });

            eliminarBtn.addEventListener('click', function() {
                const formEditar = document.getElementById('form-editar');
                formEditar.action = 'eliminar.jsp';
                formEditar.submit();
            });

            agregarBtn.addEventListener('click', function() {
                const formEditar = document.getElementById('form-editar');
                formEditar.action = 'insertar.jsp';
                formEditar.submit();
            });
        });
    