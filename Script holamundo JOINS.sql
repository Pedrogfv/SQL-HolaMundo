CREATE TABLE products(
	id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    created_by INT NOT NULL,
    marca VARCHAR(50) NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(created_by) references user(id)
    );
    
rename TABLE products to product;

INSERT INTO product (name, created_by, marca)
values
	('ipad', 1, 'apple'), 
    ('iphone', 1, 'apple'),
    ('watch', 2, 'apple'),
    ('macbook', 1, 'apple'),
    ('imac', 3, 'apple'),
    ('ipad mini', 2, 'apple');

/* Corrí el código anterior 2 veces, por lo que los valores se duplicaron, con Chatgpt conseguí el siguiente código para eliminar los producrtos duplicados y después revisar duplicados.
DELETE FROM product 
WHERE id IN (
    SELECT id FROM (
        SELECT p1.id FROM product p1
        JOIN product p2 
        ON p1.name = p2.name 
        AND p1.created_by = p2.created_by 
        AND p1.marca = p2.marca
        AND p1.id > p2.id
    ) AS subquery 
);


SELECT name, created_by, marca, COUNT(*) as cantidad
FROM product
GROUP BY name, created_by, marca
HAVING COUNT(*) > 1;
*/

SELECT * FROM product;
SELECT * FROM user;


SELECT u.id, u.email, p.name FROM user u LEFT JOIN product p on u.id = p.created_by;
SELECT u.id, u.email, p.name FROM user u RIGHT JOIN product p on u.id = p.created_by;
SELECT u.id, u.email, p.name FROM user u INNER JOIN product p on u.id = p.created_by;
SELECT u.id, u.name, p.id, p.name FROM user u CROSS JOIN product p;

SELECT count(id), marca FROM product GROUP BY marca;

SELECT count(p.id), u.name from product p LEFT JOIN user u ON u.id = p.created_by GROUP BY p.created_by;

SELECT count(p.id), u.name from product p LEFT JOIN user u 
ON u.id = p.created_by GROUP BY p.created_by
HAVING COUNT(p.id) >= 2;


