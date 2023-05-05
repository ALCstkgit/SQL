CREATE SEQUENCE "seq_id_zoo";
CREATE TABLE IF NOT EXISTS zoos(
	id_zoo int default nextval('seq_id_zoo') NOT NULL,
	nombre varchar(30) NOT NULL,
	tamano int NOT NULL,
	ciudad varchar(50) NOT NULL,
	pais varchar(50) NOT NULL,
	presupuesto int NOT NULL,
	CONSTRAINT pk_zoos PRIMARY KEY(id_zoo)
);

CREATE SEQUENCE "seq_id_especie";
CREATE TABLE IF NOT EXISTS especies(
	id_especie int default nextval('seq_id_especie') NOT NULL,
	nombre_vulgar varchar(50) NOT NULL,
	nombre_cientifico varchar(50) NOT NULL,
	familia varchar(50) NOT NULL,
	p_extincion boolean NOT NULL,
	CONSTRAINT pk_especies PRIMARY KEY(id_especie)
);

CREATE SEQUENCE "seq_id_animal";
CREATE TABLE IF NOT EXISTS animales(
	id_animal int default nextval('seq_id_animal') NOT NULL,
	id_zoo int NOT NULL,
	id_especie int NOT NULL,
	pais varchar(50) NOT NULL,
	continente varchar(50) NOT NULL,
	sexo char(1) NOT NULL,
	nacimiento int NOT NULL,
	CONSTRAINT pk_animales PRIMARY KEY(id_animal),
	CONSTRAINT fk_animal_zoo FOREIGN KEY(id_zoo)
	REFERENCES zoos(id_zoo) 
	ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_animal_especie FOREIGN KEY(id_especie)
	REFERENCES especies(id_especie)
	ON DELETE CASCADE ON UPDATE CASCADE
);