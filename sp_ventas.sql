SELECT
f_cliente_aleatorio() AS CLIENTE,
f_producto_aleatorio() AS PRODUCTO,
f_vendedor_aleatorio() AS VENDEDOR;

USE `empresa`;
DROP procedure IF EXISTS `sp_venta`;

DELIMITER $$
USE `empresa`$$
CREATE PROCEDURE `sp_venta` (fecha DATE, maxitems INT, maxcant INT)
BEGIN
DECLARE vcliente VARCHAR(11);
DECLARE vproducto VARCHAR(10);
DECLARE vvendedor VARCHAR(5);
DECLARE vcantidad INT;
DECLARE vprecio FLOAT;
DECLARE vitems INT;
DECLARE vnfactura INT;

SELECT MAX(NUMERO) + 1 INTO vnfactura FROM facturas;
SET vcliente = f_cliente_aleatorio();
SET vvendedor = f_vendedor_aleatorio();
INSERT INTO facutras(NUMERO, FECHA, DNI, MATRICULA, IMPUESTO)
VALUES(vnfactura, fecha, vcliente, vvendedor, 0.16);
SET vitems = f_aleatorio(1, maxitems);

END$$

DELIMITER ;

