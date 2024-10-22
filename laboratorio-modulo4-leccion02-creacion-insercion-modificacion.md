

<div style="text-align: center;">
  <img src="https://github.com/Hack-io-Data/Imagenes/blob/main/01-LogosHackio/logo_naranja@4x.png?raw=true" alt="esquema" />
</div>


# Laboratorio: Gestión de Bases de Datos 

## Contexto

Eres un analista de datos que trabaja para una empresa de logística que gestiona envíos y entregas para clientes en múltiples regiones. La empresa ha decidido mejorar su sistema de gestión de bases de datos para optimizar el manejo de la información relacionada con envíos, clientes, empleados y proveedores de servicios logísticos. Como parte del equipo, tu tarea es crear, modificar, insertar y actualizar los datos en la base de datos de la empresa.

### Objetivos del Laboratorio

- Crea una base de datos estructurada para gestionar la información de envíos, clientes, empleados y proveedores.

- Inserta datos en las tablas creadas, asegurando la consistencia y las relaciones entre ellas.

- Actualiza y modifica registros en función de los cambios de requisitos o nueva información.

- Elimina registros obsoletos o incorrectos manteniendo la integridad de la base de datos.

- Realiza consultas y reportes avanzados para extraer información relevante.

### Descripción del Proyecto

La empresa requiere una base de datos que contenga las siguientes entidades:

- **Clientes**: Información sobre los clientes que solicitan envíos.

- **Empleados**: Información sobre los empleados que gestionan los envíos.

- **Proveedores**: Empresas externas que proporcionan servicios de entrega y logística.

- **Envíos**: Detalles de los envíos realizados.

- **Detalle de Envíos**: Información específica sobre los productos incluidos en cada envío.

- **Regiones**: Información sobre las diferentes regiones a las que se realizan envíos.

El esquema de la BBDD es el siguiente:

![esquema](https://github.com/Hack-io-Data/Imagenes/blob/main/02-Imagenes/SQL/Esquema-lab-logistica.png?raw=true)


## Ejercicios

### Ejercicio 1: Creación de la Base de Datos y Tablas

1. **Crear una base de datos** llamada `logistica`.

2. Dentro de la base de datos, crea las siguientes tablas:

   - **Clientes**: Incluye campos como `id_cliente` (clave primaria), `nombre`, `email`, `direccion`, `telefono`, `pais`.

   - **Empleados**: Incluye campos como `id_empleado` (clave primaria), `nombre`, `cargo`, `email`.

   - **Proveedores**: Incluye campos como `id_proveedor` (clave primaria), `nombre`, `contacto`, `telefono`, `direccion`.

   - **Envíos**: Incluye campos como `id_envio` (clave primaria), `id_cliente` (clave foránea), `id_empleado` (clave foránea), `id_proveedor` (clave foránea), `fecha_envio`, `estado`, `total`.

   - **Detalle de Envíos**: Incluye campos como `id_detalle` (clave primaria), `id_envio` (clave foránea), `producto`, `cantidad`, `precio_unitario`.

   - **Regiones**: Incluye campos como `id_region` (clave primaria), `nombre`, `pais`.

### Ejercicio 2: Inserción de Datos

1. Inserta al menos **10 clientes** en la tabla `Clientes`.

2. Inserta al menos **5 empleados** en la tabla `Empleados`.

3. Inserta al menos **3 proveedores** en la tabla `Proveedores`.

4. Inserta al menos **8 envíos** en la tabla `Envíos`, asignando envíos a los clientes, empleados y proveedores registrados.

5. Inserta los detalles correspondientes en la tabla `Detalle de Envíos`, asegurando que las cantidades y precios unitarios sean consistentes con los productos y los envíos.

6. Inserta al menos **5 regiones** en la tabla `Regiones`.

### Ejercicio 3: Modificación y Actualización de Datos

1. Actualizar el Estado de un Envío. Actualiza el estado del envío con `id_envio = 3` a "Entregado".

2. Modificar el Cargo de un Empleado. Cambia el cargo del empleado con `id_empleado = 5` a "Director de Datos".

3. Incrementar el Precio Unitario de un Producto. Incrementa en un 10% el precio unitario del producto "Producto A" en la tabla `Detalle_Envíos`.

4. Actualizar la Dirección de un Cliente. Modifica la dirección del cliente con `id_cliente = 2` a "Nueva Calle B, 123".

5. Cambiar el Proveedor de un Envío. Cambia el proveedor del envío con `id_envio = 4` al proveedor con `id_proveedor = 3`.

6. Actualizar la Cantidad de un Producto en un Envío. Modifica la cantidad del producto "Producto C" en el envío con `id_envio = 2` a 5 unidades.

7. Actualizar el Total de un Envío. Incrementa el total del envío con `id_envio = 5` en 50 unidades monetarias.

8. Modificar el Contacto de un Proveedor. Cambia el contacto del proveedor con `id_proveedor = 2` a "Nuevo Contacto 2".

9. Cambiar el País de un Cliente. Actualiza el país del cliente con `id_cliente = 6` a "Portugal".

10. Actualizar la Fecha de un Envío. Modifica la fecha del envío con `id_envio = 7` a "2024-08-10".


### Ejercicio 4: Eliminación de Datos

1. Añadir una Columna. Añade una columna `fecha_nacimiento` de tipo `DATE` a la tabla `Clientes`.

2. Añadir una Columna. Añade una columna `codigo_postal` de tipo `VARCHAR(10)` a la tabla `Proveedores`.

3. Eliminar una Columna. Elimina la columna `contacto` de la tabla `Proveedores`.

4. Eliminar una Columna. Elimina la columna `pais` de la tabla `Regiones`.

5. Modificar el Tipo de Dato de una Columna. Modifica el tipo de dato de la columna `telefono` en la tabla `Clientes` a `VARCHAR(15)`.

6. Modificar el Tipo de Dato de una Columna. Modifica el tipo de dato de la columna `total` en la tabla `Envíos` a `NUMERIC(12, 2)`.

7. Añadir una Columna. Añade una columna `fecha_contrato` de tipo `DATE` a la tabla `Empleados`.

8. Eliminar una Columna. Elimina la columna `estado` de la tabla `Envíos`.

9. Modificar el Nombre de una Columna. Modifica el nombre de la columna `nombre` en la tabla `Empleados` a `nombre_completo`.



### Ejercicio 5: Contesta a las siguientes preguntas usando queries


1. Listar todos los clientes que viven en España.

2. Obtener todos los envíos realizados por un empleado específico.

3. Listar todos los productos incluidos en un envío específico.

4. Encontrar todos los proveedores con un teléfono específico.

5. Listar los empleados que tienen un cargo de "Supervisor de Envíos".

6. Obtener todos los envíos que fueron realizados por el cliente con id_cliente = 5.

7. Listar todas las regiones con su nombre y país.

8. Mostrar todos los productos cuyo precio unitario sea mayor que 50.

9. Obtener todos los envíos realizados el 2024-08-05.

10. Listar todos los clientes que tienen un número de teléfono que comienza con "6003".
