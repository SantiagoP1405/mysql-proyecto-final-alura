USE `empresa`;
DROP function IF EXISTS `f_cliente_aleatorio`;

DELIMITER $$
USE `empresa`$$
CREATE FUNCTION `f_cliente_aleatorio` ()
RETURNS VARCHAR(11)
BEGIN
DECLARE vresultado VARCHAR(11);
DECLARE vmax INT;
DECLARE valeatoria INT;
SELECT COUNT(*) INTO vmax FROM clientes;
SET valeatoria = f_aleatorio(1, vmax);
SET valeatoria = valeatoria-1;
SELECT DNI INTO vresultado FROM clientes LIMIT valeatoria,1;
RETURN vresultado;
END$$

DELIMITER ;

SELECT f_cliente_aleatorio() AS CLIENTE;