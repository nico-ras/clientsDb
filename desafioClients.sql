psql

DROP DATABASE IF EXISTS unidad2;

CREATE DATABASE unidad2;

\q

psql -U postgres unidad2 < /home/ras/talentoDigital/dbPsql/desafioClients/unidad2.sql

psql

\c unidad2

BEGIN TRANSACTION;

INSERT INTO compra (cliente_id, fecha) VALUES (1, CURRENT_DATE);
UPDATE producto SET stock = stock -5 WHERE id = 9;
INSERT INTO detalle_compra (producto_id, compra_id, cantidad) VALUES (9, (SELECT id FROM compra ORDER BY 1 DESC LIMIT 1), 5);

COMMIT;

SELECT * FROM producto WHERE id = 9;

--Requerimiento 3

BEGIN TRANSACTION;

INSERT INTO compra (cliente_id, fecha) VALUES (2, CURRENT_DATE);

UPDATE producto SET stock = stock -5 WHERE id = 1;
INSERT INTO detalle_compra (producto_id, compra_id, cantidad) VALUES (1, (SELECT id FROM compra ORDER BY 1 DESC LIMIT 1), 3);

UPDATE producto SET stock = stock -5 WHERE id = 2;
INSERT INTO detalle_compra (producto_id, compra_id, cantidad) VALUES (2, (SELECT id FROM compra ORDER BY 1 DESC LIMIT 1), 3);

UPDATE producto SET stock = stock -5 WHERE id = 8;
INSERT INTO detalle_compra (producto_id, compra_id, cantidad) VALUES (8, (SELECT id FROM compra ORDER BY 1 DESC LIMIT 1), 3);

COMMIT;

SELECT * FROM producto WHERE id = 1;
SELECT * FROM producto WHERE id = 2;
SELECT * FROM producto WHERE id = 8;



--Requerimiento 4

\set AUTOCOMMIT off

INSERT INTO cliente (nombre, email) VALUES ('usuarioNuevo1', 'nuevo01@mailmail.com');

SELECT * FROM cliente ORDER BY 1 DESC LIMIT 1;

ROLLBACK;

SELECT * FROM cliente ORDER BY 1 DESC LIMIT 1;

\set AUTOCOMMIT on

\echo :AUTOCOMMIT









