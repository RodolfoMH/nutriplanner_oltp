CREATE TABLE dim_fecha (
  fecha_id int NOT NULL AUTO_INCREMENT,
  fecha date NOT NULL,
  anio int NOT NULL,
  mes int NOT NULL,
  dia int NOT NULL,
  dia_semana varchar(10) NOT NULL,
  semana_anio int NOT NULL,
  trimestre int NOT NULL,
  PRIMARY KEY (fecha_id)
) ;

CREATE TABLE dim_producto (
  producto_id int NOT NULL AUTO_INCREMENT,
  nombre_producto varchar(255) NOT NULL,
  codigo_barras varchar(50) NOT NULL,
  fuente varchar(100) NOT NULL,
  PRIMARY KEY (producto_id),
  UNIQUE KEY codigo_barras (codigo_barras)
) ;

CREATE TABLE dim_unidad (
  unidad_id int NOT NULL AUTO_INCREMENT,
  descripcion varchar(100) NOT NULL,
  abreviatura varchar(10) NOT NULL,
  PRIMARY KEY (unidad_id)
); 

CREATE TABLE dim_usuario (
  usuario_id int NOT NULL AUTO_INCREMENT,
  nombre varchar(100) NOT NULL,
  apellido varchar(100) NOT NULL,
  email varchar(255) NOT NULL,
  fecha_nacimiento date NOT NULL,
  estado enum('ACTIVO','INACTIVO') NOT NULL,
  PRIMARY KEY (usuario_id)
); 

CREATE TABLE fact_compras (
  fact_compra_id int NOT NULL AUTO_INCREMENT,
  fecha_compra date NOT NULL,
  usuario_id int NOT NULL,
  producto_id int NOT NULL,
  cantidad decimal(10,2) NOT NULL,
  unidad_id int NOT NULL,
  precio_unitario decimal(10,2) NOT NULL,
  fecha_id int NOT NULL,
  PRIMARY KEY (fact_compra_id),
  KEY usuario_id (usuario_id),
  KEY producto_id (producto_id),
  KEY unidad_id (unidad_id),
  KEY fk_fecha_id (fecha_id),
  CONSTRAINT fact_compras_ibfk_1 FOREIGN KEY (usuario_id) REFERENCES dim_usuario (usuario_id),
  CONSTRAINT fact_compras_ibfk_2 FOREIGN KEY (producto_id) REFERENCES dim_producto (producto_id),
  CONSTRAINT fact_compras_ibfk_3 FOREIGN KEY (unidad_id) REFERENCES dim_unidad (unidad_id),
  CONSTRAINT fk_fecha_id FOREIGN KEY (fecha_id) REFERENCES dim_fecha (fecha_id)
);