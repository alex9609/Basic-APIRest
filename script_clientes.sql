CREATE SCHEMA arquitectura_software;
USE arquitectura_software;

CREATE TABLE cliente (
  id INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(255) NOT NULL,
  correo VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE productos_deportivos (
  id INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(255) NOT NULL,
  descripcion VARCHAR(1000) NOT NULL,
  precio DECIMAL(10,2) NOT NULL,
  categoria VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);

-- Creamos la tabla "factura"
CREATE TABLE factura (
  id INT NOT NULL AUTO_INCREMENT,
  cliente_id INT NOT NULL,
  fecha DATE NOT NULL,
  total DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (cliente_id) REFERENCES cliente(id)
);

-- Creamos la tabla "detalle_factura"
CREATE TABLE detalle_factura (
  id INT NOT NULL AUTO_INCREMENT,
  factura_id INT NOT NULL,
  producto_id INT NOT NULL,
  cantidad INT NOT NULL,
  subtotal DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (factura_id) REFERENCES factura(id),
  FOREIGN KEY (producto_id) REFERENCES productos_deportivos(id)
);

INSERT INTO cliente (nombre, correo) VALUES
  ('Juan Pérez', 'juan@example.com'),
  ('María González', 'maria@example.com'),
  ('Pedro García', 'pedro@example.com'),
  ('Laura Martínez', 'laura@example.com'),
  ('Roberto Sánchez', 'roberto@example.com'),
  ('Ana Gutiérrez', 'ana@example.com'),
  ('Santiago Romero', 'santiago@example.com'),
  ('Lucía Ramírez', 'lucia@example.com'),
  ('Miguel Torres', 'miguel@example.com'),
  ('Carla Díaz', 'carla@example.com');


INSERT INTO productos_deportivos (nombre, descripcion, precio, categoria) VALUES
  ('Pelota de fútbol', 'Pelota oficial de la FIFA para partidos de fútbol.', 49.99, 'Fútbol'),
  ('Guantes de boxeo', 'Guantes de boxeo de cuero sintético para entrenamiento.', 29.99, 'Boxeo'),
  ('Raqueta de tenis', 'Raqueta de tenis de fibra de carbono para jugadores avanzados.', 149.99, 'Tenis'),
  ('Balón de baloncesto', 'Balón de baloncesto oficial de la NBA para partidos de interior.', 39.99, 'Baloncesto'),
  ('Casco de ciclismo', 'Casco de ciclismo con ventilación para mayor comodidad y seguridad.', 79.99, 'Ciclismo'),
  ('Tabla de surf', 'Tabla de surf de espuma para principiantes y niños.', 199.99, 'Surf'),
  ('Pesas de gimnasio', 'Set de pesas de gimnasio de hierro fundido con soporte.', 249.99, 'Fitness'),
  ('Bicicleta de montaña', 'Bicicleta de montaña de aluminio con suspensión delantera y frenos de disco.', 799.99, 'Ciclismo'),
  ('Raqueta de bádminton', 'Raqueta de bádminton de grafito para jugadores avanzados.', 89.99, 'Bádminton'),
  ('Pelota de rugby', 'Pelota oficial de la World Rugby para partidos de rugby.', 34.99, 'Rugby');

SELECT * FROM productos_deportivos;

INSERT INTO factura (cliente_id,fecha,total) VALUES
	(1,'2023-04-30',229.97);
    
INSERT INTO factura (cliente_id,fecha,total) VALUES
	(2,'2023-04-30',319.97),
    (3,'2023-04-30',1174.96),
    (4,'2023-04-30',1199.97),  
    (5,'2023-04-30',224.96),
    (6,'2023-04-30',269.97),
    (7,'2023-04-30',89.99),
    (8,'2023-04-30',219.97),
    (9,'2023-04-30',1139.97),
    (10,'2023-04-30',149.96),
    (1,'2023-04-30',1249.97),
    (2,'2023-04-30',279.98);
    
    
    
    
INSERT INTO detalle_factura (factura_id, producto_id, cantidad, subtotal) VALUES
  (1,1,1,49.99),
  (1,2,1,29.99),
  (1,3,1,149.99),
  
  (2,4,1,39.99),
  (2,5,1,79.99),
  (2,6,1,199.99),

  (3,7,1,249.99),
  (3,8,1,799.99),
  (3,9,1,89.99),
  (3,10,1,34.99),
  
  (4,3,1,149.99),
  (4,7,1,249.99),
  (4,8,1,799.99),

  (5,1,1,49.99),
  (5,9,1,89.99),
  (5,10,1,34.99),
  
  (6,3,1,149.99),
  (6,4,1,39.99),
  (6,5,1,79.99),
  
  (7,9,1,89.99),
  
  (8,2,1,29.99),
  (8,3,1,149.99),
  (8,4,1,39.99),
  
  (9,7,1,249.99),
  (9,8,1,799.99),
  (9,9,1,89.99),
  
  (10,1,1,49.99),
  (10,2,1,29.99),
  (10,9,1,34.99),


  (11,6,1,199.99),
  (11,7,1,249.99),
  (11,8,1,799.99),
  
  (12,5,1,79.99),
  (12,6,1,199.99);

SELECT c.nombre ,c.correo, p.nombre AS nombre_producto, df.cantidad, df.subtotal, f.fecha, f.total, f.id
FROM cliente c
JOIN factura f ON c.id = f.cliente_id
JOIN detalle_factura df ON f.id= df.factura_id
JOIN productos_deportivos p ON df.producto_id = p.id;