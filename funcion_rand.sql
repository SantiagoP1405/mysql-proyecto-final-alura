SELECT RAND(); # Númmero aleatorio entre 0 y 1

# Generar un número entero entre 20 y 50
#(RAND() * (MAX-MIN+1))+MIN
SELECT FLOOR((RAND() * (250-20+1)))+20;

SET GLOBAL log_bin_trust_function_creators = 1;
USE `empresa`;
DROP function IF EXISTS `f_aleatorio`;

DELIMITER $$
USE `empresa`$$
CREATE FUNCTION `f_aleatorio` (min INT, max INT)
RETURNS INTEGER
BEGIN
DECLARE vresultado INT;
SELECT FLOOR((RAND() * (max-min+1)))+min INTO vresultado;
RETURN vresultado;
END$$

DELIMITER ;


SELECT f_aleatorio(1,10) AS RESULTADO;

