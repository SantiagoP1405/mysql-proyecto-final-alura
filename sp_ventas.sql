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
DECLARE vcontador INT DEFAULT 1;
SELECT MAX(NUMERO) + 1 INTO vnfactura FROM facturas;
SET vcliente = f_cliente_aleatorio();
SET vvendedor = f_vendedor_aleatorio();
INSERT INTO facturas(NUMERO, FECHA, DNI, MATRICULA, IMPUESTO)
VALUES(vnfactura, fecha, vcliente, vvendedor, 0.16);
SET vitems = f_aleatorio(1, maxitems);
WHILE vcontador <= vitems
DO
SET vproducto = f_producto_aleatorio();
SET vcantidad = faleatorio(1, maxcantidad);
SELECT PRECIO INTO vprecio FROM productos WHERE CODIGO = vproducto;
INSERT INTO items(NUMMERO, CODIGO, CANTIDAD, PRECIO)
VALUES(vnfactura, vproducto, vcaantidad, vprecio);
SET vcontador = vcontador +1;
END WHILE;
END$$

DELIMITER ;

CALL sp_venta(20250423, 15, 100);

