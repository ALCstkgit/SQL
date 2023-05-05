CREATE SEQUENCE "seq_coleccion";
CREATE TABLE IF NOT EXISTS colecciones(
	id_coleccion int default nextval('seq_coleccion') NOT NULL,
	volumenes int NOT NULL,
	CONSTRAINT pk_coleccion PRIMARY KEY(id_coleccion)
);

CREATE TABLE IF NOT EXISTS libros(
	isbn varchar(13) NOT NULL,
	id_coleccion int NOT NULL,
	editorial varchar(40) NOT NULL,
	autor varchar(40) NOT NULL,
	CONSTRAINT pk_libro PRIMARY KEY(isbn),
	CONSTRAINT fk_libro_coleccion FOREIGN KEY(id_coleccion)
	REFERENCES colecciones(id_coleccion)
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE SEQUENCE "seq_provincia";
CREATE TABLE IF NOT EXISTS provincias(
	id_provincia int default nextval('seq_provincia') NOT NULL,
	ext int NOT NULL,
	CONSTRAINT pk_provincia PRIMARY KEY(id_provincia)
);

CREATE SEQUENCE "seq_almacen";
CREATE TABLE IF NOT EXISTS almacenes(
	id_almacen int default nextval('seq_almacen') NOT NULL,
	id_provincia int NOT NULL,
	fecha date NOT NULL,
	direccion varchar(40) NOT NULL,
	CONSTRAINT pk_almacen PRIMARY KEY(id_almacen),
	CONSTRAINT fk_almacen_provincia FOREIGN KEY(id_provincia)
	REFERENCES provincias(id_provincia)
	ON DELETE CASCADE ON UPDATE CASCADE
);

ALTER TABLE IF EXISTS provincias
	ADD COLUMN id_almacen int NOT NULL,
	ADD CONSTRAINT fk_provincia_almacen FOREIGN KEY(id_almacen)
	REFERENCES almacenes(id_almacen)
	ON DELETE CASCADE ON UPDATE CASCADE;

CREATE TABLE IF NOT EXISTS almacenes_libros(
	id_almacen int NOT NULL,
	isbn varchar(13) NOT NULL,
	cantidad int NOT NULL,
	CONSTRAINT fk_almacen_libro_almacen FOREIGN KEY(id_almacen)
	REFERENCES almacenes(id_almacen)
	ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_almacen_libro_libro FOREIGN KEY(isbn)
	REFERENCES libros(isbn)
	ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT pk_almacenes_libros PRIMARY KEY(id_almacen,isbn)
);

CREATE SEQUENCE "seq_poblacion";
CREATE TABLE IF NOT EXISTS poblaciones(
	id_poblacion int default nextval('seq_poblacion') NOT NULL,
	id_provincia int NOT NULL,
	habitantes int NOT NULL,
	CONSTRAINT pk_poblacion PRIMARY KEY(id_poblacion),
	CONSTRAINT fk_poblacion_provincia FOREIGN KEY(id_poblacion)
	REFERENCES provincias(id_provincia)
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS socios(
	dni varchar(9) NOT NULL,
	dni_socio varchar(9) NOT NULL,
	id_poblacion int NOT NULL,
	nombre varchar(40) NOT NULL,
	apellido varchar(40) NOT NULL,
	telefono varchar(9) NOT NULL,
	CONSTRAINT pk_socio PRIMARY KEY(dni),
	CONSTRAINT fk_socio_poblacion FOREIGN KEY(id_poblacion)
	REFERENCES poblaciones(id_poblacion)
	ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_socio_socio FOREIGN KEY(dni_socio)
	REFERENCES socios(dni)
	ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE SEQUENCE "seq_pedido";
CREATE TABLE IF NOT EXISTS pedidos(
	id_pedido int default nextval('seq_pedido') NOT NULL,
	dni varchar(9) NOT NULL,
	envio varchar(20) NOT NULL,
	pago varchar(20) NOT NULL,
	CONSTRAINT fk_pedido_socio FOREIGN KEY(dni)
	REFERENCES socios(dni)
	ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT pk_pedido PRIMARY KEY(id_pedido,dni)
);

CREATE SEQUENCE "seq_detalle";
CREATE TABLE IF NOT EXISTS detalles(
	id_detalle int default nextval('seq_detalle') NOT NULL,
	id_pedido int NOT NULL,
	dni varchar(9) NOT NULL,
	isbn varchar(13) NOT NULL,
	cantidad int NOT NULL,
	CONSTRAINT fk_detalle_pedido FOREIGN KEY(id_pedido, dni)
	REFERENCES pedidos(id_pedido,dni)
	ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_detalle_libro FOREIGN KEY(isbn)
	REFERENCES libros(isbn)
	ON DELETE CASCADE ON UPDATE CASCADE
);