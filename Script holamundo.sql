CREATE DATABASE holamundo;
SHOW DATABASES;
USE holamundo;

CREATE TABLE animales(
	id INT,
    tipo VARCHAR(255),
    estado VARCHAR(255),
    primary key(id)
    );
    
-- ESTA LINEA NO SERÁ EJECUTADA
ALTER TABLE animales MODIFY COLUMN id INT AUTO_INCREMENT;

SHOW CREATE TABLE animales;

CREATE TABLE `animales` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(255) DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

INSERT INTO animales(tipo, estado) VALUES ('chanchito', 'feliz');
INSERT INTO animales(tipo, estado) VALUES ('dragon', 'feliz');
INSERT INTO animales(tipo, estado) VALUES ('felipe', 'triste');

SELECT * FROM animales;
SELECT * FROM animales WHERE id = 1;
SELECT * FROM animales WHERE estado = 'feliz' AND tipo = 'felipe';

UPDATE animales SET estado = 'feliz' WHERE id = 4;

SELECT * FROM animales;

DELETE FROM animales WHERE estado = 'feliz';
-- Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.

DELETE FROM animales WHERE id = 4;
DELETE FROM animales WHERE id = 2;
SELECT * FROM animales;

UPDATE animales SET estado = 'triste' WHERE tipo = 'dragon';
-- Esto también arroja en ERROR 1175.

CREATE TABLE user (
	id INT NOT NULL auto_increment, 
    name VARCHAR (50) NOT NULL,
    edad INT NOT NULL, 
    email VARCHAR(100) NOT NULL, 
    PRIMARY KEY (id)
    );

INSERT INTO user (name, edad, email) VALUES ('Oscar', 25, 'oscar@gmail.com');
INSERT INTO user (name, edad, email) VALUES ('Lyla', 15, 'layla@gmail.com');
INSERT INTO user (name, edad, email) VALUES ('Nicolas', 36, 'nico@gmail.com');
INSERT INTO user (name, edad, email) VALUES ('Chanchito', 7, 'chanchito@gmail.com');

SELECT * FROM user;
SELECT * FROM user LIMIT 1;
SELECT * FROM user WHERE edad > 15;
SELECT * FROM user WHERE edad >= 15;
SELECT * FROM user WHERE edad > 20 AND email = 'nico@gmail.com';
SELECT * FROM user WHERE edad > 20 OR email = 'layla@gmail.com';
SELECT * FROM user WHERE email != 'layla@gmail.com';
SELECT * FROM user WHERE edad BETWEEN 15 AND 30;
SELECT * FROM user WHERE email LIKE '%gmail%';
SELECT * FROM user WHERE email LIKE '%gmail';
SELECT * FROM user WHERE email LIKE 'oscar%';

SELECT * FROM user ORDER BY edad asc;
SELECT * FROM user ORDER BY edad desc;

SELECT max(edad) as mayor FROM user;
SELECT min(edad) as menor FROM user;

SELECT id, name FROM user;
SELECT id, name as chanchito FROM user;