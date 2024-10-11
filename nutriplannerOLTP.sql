CREATE TABLE usuarios (
    usuario_id INT AUTO_INCREMENT PRIMARY KEY,
    usuario VARCHAR(100) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    contraseña VARCHAR(255) NOT NULL,
    estado ENUM('ACTIVO', 'INACTIVO') NOT NULL,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    email VARCHAR(255) NOT NULL,
    telefono VARCHAR(20)
);

CREATE TABLE productos (
    producto_id INT AUTO_INCREMENT PRIMARY KEY,
    codigo_barras VARCHAR(50) NOT NULL UNIQUE,
    nombre_producto VARCHAR(255) NOT NULL,
    descripcion_producto TEXT,
    fuente VARCHAR(100) NOT NULL
);

CREATE TABLE compras (
    compra_id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    fecha_compra DATE NOT NULL,
    estado ENUM('PENDIENTE', 'COMPLETADA') NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id)
);

CREATE TABLE unidades (
    unidad_id INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(100) NOT NULL,
    abreviatura VARCHAR(10) NOT NULL
);

CREATE TABLE detalle_compras (
    detalle_id INT AUTO_INCREMENT PRIMARY KEY,
    compra_id INT NOT NULL,
    producto_id INT NOT NULL,
    fecha_vencimiento DATE,
    cantidad DECIMAL(10,2) NOT NULL,
    unidad_id INT NOT NULL,
    FOREIGN KEY (compra_id) REFERENCES compras(compra_id),
    FOREIGN KEY (producto_id) REFERENCES productos(producto_id),
    FOREIGN KEY (unidad_id) REFERENCES unidades(unidad_id)
);

CREATE TABLE menus (
    menu_id INT AUTO_INCREMENT PRIMARY KEY,
    compra_id INT NOT NULL,
    prompt_generado TEXT NOT NULL,
    json_resultado JSON NOT NULL,
    FOREIGN KEY (compra_id) REFERENCES compras(compra_id)
);