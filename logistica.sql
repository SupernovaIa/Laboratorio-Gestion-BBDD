-- Crear las tablas

-- Crear la tabla Clientes
create table clientes (
    id_cliente SERIAL primary key,
    nombre VARCHAR(100) not null,
    email VARCHAR(100) unique not null,
    direccion VARCHAR(300) not null,
    telefono INT unique not null,
    pais VARCHAR(30) not null
);

-- Crear la tabla Empleados
create table empleados (
    id_empleado SERIAL primary key,
    nombre VARCHAR(100) not null,
    cargo VARCHAR(100) not null,
    email VARCHAR(100) unique not null
);

-- Crear la tabla Proveedores
create table proveedores (
    id_proveedor SERIAL primary key,
    nombre VARCHAR(100) not null,
    contacto VARCHAR(100) not null,
    telefono INT unique not null,
    direccion VARCHAR(100) unique not null
);

-- Crear la tabla Envíos
create table envios (
    id_cliente INT not null,
    id_empleado INT not null,
    id_proveedor INT not null,
    fecha_envio DATE not null,
    estado VARCHAR(40) not null,
    total DECIMAL(10, 2) not null,
    foreign key (id_cliente) references clientes(id_cliente)
    	on delete restrict
        on update cascade,
    foreign key (id_empleado) references empleados(id_empleado)
    	on delete restrict
        on update cascade,
	foreign key (id_proveedor) references proveedores(id_proveedor)
    	on delete restrict
        on update cascade
);

-- Crear la tabla Detalle de Envíos
create table detalle_envios (
    id_detalle SERIAL primary key,
    id_envio INT not null,
    producto VARCHAR(100) not null,
    cantidad INT check (cantidad > 0),
    precio_unitario DECIMAL(10, 2) check (precio_unitario >= 0),
    foreign key (id_envio) references envios(id_envio)
    	on delete restrict
        on update cascade
);

-- Crear la tabla Regiones
create table regiones (
    id_region SERIAL primary key,
    nombre VARCHAR(100) unique not null,
    pais VARCHAR(100) not null
);

-- Inserción de clientes
insert into clientes (nombre, email, direccion, telefono, pais)
values 
('YanRu', 'yanru@gmail.com', 'Calle Falsa 123', 111222333, 'China'),
('Lin', 'lin@gmail.com', 'Calle Verdadera 222', 111222444, 'China'),
('Víctor', 'victor@gmail.com', 'Calle Falsa 11', 111222555, 'España'),
('David', 'david@gmail.com', 'Calle Falsa 13', 222333444, 'España'),
('Lucas', 'luks@gmail.com', 'Calle Verdadera 12', 666111222, 'España'),
('Andrea', 'andrea@gmail.com', 'Avenida Central 101', 333444555, 'Italia'),
('Sergio', 'sergio@gmail.com', 'Calle Luna 55', 444555666, 'México'),
('Ana', 'ana@gmail.com', 'Calle Sol 12', 555666777, 'Brasil'),
('María', 'maria@gmail.com', 'Calle Estrella 7', 666777888, 'Argentina'),
('Omar', 'omar@gmail.com', 'Avenida de la Paz 89', 777888999, 'Egipto');

-- Inserción empleados
insert into empleados (nombre, cargo, email)
values 
('Yancha', 'Data Artist', 'yancha@data.com'),
('Ana', 'Biologist', 'ana@phd.com'),
('Jauma', 'Politologyst', 'jauma@hackio.com'),
('Silvia', 'Data Analyst', 'silvia@hackio.com'),
('Víctor', 'Business Analyst', 'victor@hackio.com'),
('Iván', 'Developer', 'ivan@hackio.com'),
('Gonzalo', 'Prompt Engineer', 'gon@hackio.com'),
('Miguel', 'Data Scientist', 'miguel@hackio.com');

-- Inserción proveedores
insert into proveedores (nombre, contacto, telefono, direccion)
values 
('ThePower', 'Tabatha', 999333111, 'Calle Arturo Soria 245'),
('Patrio', 'Raúl', 999777111, 'Calle Arturo Soria 243'),
('RockTheCode', 'Alberto', 222777111, 'Calle Arturo Soria 244');

-- Inserción envíos
insert into envios (id_cliente, id_empleado, id_proveedor, fecha_envio, estado, total)
values 
(3, 1, 1, '2024-05-12', 'entregado', 54),
(7, 1, 1, '2024-05-13', 'entregado', 56),
(1, 1, 1, '2024-05-14', 'entregado', 52),
(5, 4, 1, '2024-05-15', 'entregado', 52),
(2, 3, 1, '2024-05-15', 'pendiente', 57),
(4, 5, 1, '2024-05-15', 'pendiente', 58),
(6, 5, 1, '2024-05-16', 'entregado', 59);

-- Inserción detalle envíos
insert into detalle_envios (id_envio, producto, cantidad, precio_unitario)
values 
(1, 'patatas', 1, 55),
(2, 'zanahorias', 1, 54),
(3, 'EDA', 1, 56),
(4, 'opel corsa', 1, 52),
(5, 'iphone', 1, 52),
(6, 'macbook pro m3', 1, 57);

-- Inserción regiones
insert into regiones (nombre, pais)
values 
('Galicia', 'España'),
('Madrid', 'España'),
('Toscana', 'Italia'),
('Roma', 'Italia'),
('Cognac', 'Francia');

-- Actualizar tablas
-- Actualizar el Estado de un Envío. Actualiza el estado del envío con `id_envio = 3` a "Entregado".
update envios 
set estado = 'Entregado'
WHERE id_envio = 3;

-- Modificar el Cargo de un Empleado. Cambia el cargo del empleado con `id_empleado = 5` a "Director de Datos".
update empleados 
set cargo = 'Director de Datos'
where id_empleado = 5;

-- Incrementar el Precio Unitario de un Producto. Incrementa en un 10% el precio unitario del producto "Producto A" en la tabla `Detalle_Envíos`.
update detalle_envios 
set precio_unitario = precio_unitario * 1.1
where producto = 'patatas'

-- Actualizar la Dirección de un Cliente. Modifica la dirección del cliente con `id_cliente = 2` a "Nueva Calle B, 123".
update clientes 
set direccion = 'Nueva Calle B, 123'
where id_cliente = 2

-- Cambiar el Proveedor de un Envío. Cambia el proveedor del envío con `id_envio = 4` al proveedor con `id_proveedor = 3`.
update envios 
set id_proveedor = 3
where id_envio = 4

-- Actualizar la Cantidad de un Producto en un Envío. Modifica la cantidad del producto "Producto C" en el envío con `id_envio = 2` a 5 unidades.
update detalle_envios 
set cantidad = 5
where id_envio = 2

-- Actualizar el Total de un Envío. Incrementa el total del envío con `id_envio = 5` en 50 unidades monetarias.
update envios
set total = total + 50
where id_envio = 5

-- Modificar el Contacto de un Proveedor. Cambia el contacto del proveedor con `id_proveedor = 2` a "Nuevo Contacto 2".
update proveedores
set contacto = 'Nuevo Contacto 2'
where id_proveedor = 2

-- Cambiar el País de un Cliente. Actualiza el país del cliente con `id_cliente = 6` a "Portugal".
update clientes
set pais = 'Portugal'
where id_cliente = 6

-- Actualizar la Fecha de un Envío. Modifica la fecha del envío con `id_envio = 7` a "2024-08-10".
update envios
set fecha_envio = '2024-08-10'
where id_envio = 7


-- Eliminación de Datos
-- Añadir una Columna. Añade una columna `fecha_nacimiento` de tipo `DATE` a la tabla `Clientes`.
alter table clientes 
add column fecha_nacimiento DATE;

-- Añadir una Columna. Añade una columna `codigo_postal` de tipo `VARCHAR(10)` a la tabla `Proveedores`.
alter table proveedores
add column codigo_postal VARCHAR(10);

--Eliminar una Columna. Elimina la columna `contacto` de la tabla `Proveedores`.
alter table proveedores
drop column contacto;

-- Eliminar una Columna. Elimina la columna `pais` de la tabla `Regiones`.
alter table regiones 
drop column pais;

-- Modificar el Tipo de Dato de una Columna. Modifica el tipo de dato de la columna `telefono` en la tabla `Clientes` a `VARCHAR(15)`.
alter table clientes 
alter column telefono type VARCHAR(15);

-- Modificar el Tipo de Dato de una Columna. Modifica el tipo de dato de la columna `total` en la tabla `Envíos` a `NUMERIC(12, 2)`.
alter table envios 
alter column total type NUMERIC(12, 2);

-- Añadir una Columna. Añade una columna `fecha_contrato` de tipo `DATE` a la tabla `Empleados`.
alter table empleados 
add column fecha_contrato DATE;

-- Eliminar una Columna. Elimina la columna `estado` de la tabla `Envíos`.
alter table envios 
drop column estado;

-- Modificar el Nombre de una Columna. Modifica el nombre de la columna `nombre` en la tabla `Empleados` a `nombre_completo`.
alter table empleados 
rename column nombre to nombre_completo;

-- Queries
-- Listar todos los clientes que viven en España.
select nombre 
from clientes c 
where pais = 'España' ;

-- Obtener todos los envíos realizados por un empleado específico.
select id_envio 
from envios e 
where id_empleado = 1 ;

-- Listar todos los productos incluidos en un envío específico.
select producto 
from detalle_envios de 
where id_envio = 2 ;

-- Encontrar todos los proveedores con un teléfono específico.
select nombre 
from proveedores p 
where telefono = 999333111 ;

-- Listar los empleados que tienen un cargo de "Supervisor de Envíos".
select nombre_completo
from empleados e 
where cargo = 'Supervisor de Envíos' ;

-- Obtener todos los envíos que fueron realizados por el cliente con id_cliente = 5.
select nombre 
from clientes c 
where id_cliente = 5 ;

-- Listar todas las regiones con su nombre y país. (país se ha eliminado)
select nombre 
from regiones r ;

-- Mostrar todos los productos cuyo precio unitario sea mayor que 50.
select producto 
from detalle_envios de 
where precio_unitario > 50 ;

-- Obtener todos los envíos realizados el 2024-08-05.
select id_envio 
from envios e
where fecha_envio = '2024-05-15' ;

-- Listar todos los clientes que tienen un número de teléfono que comienza con "6003".
select nombre 
from clientes c 
where telefono like '1112%' ;