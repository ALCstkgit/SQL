CREATE OR REPLACE PROCEDURE ingresar_retirar(
	mon numeric,
	tip varchar,
	id_c int)
AS $$
BEGIN
	IF mon < 0 THEN
		RAISE SQLSTATE '22013';
	END IF;
	
	INSERT INTO movimientos(tipo, monto, id_cuenta) VALUES (tip,mon,id_c);
	IF tip = 'retirar' THEN
		IF (SELECT saldo FROM cuentas WHERE id_cuenta = id_c) < mon THEN
			RAISE SQLSTATE '22012';
		END IF;
		UPDATE cuentas SET saldo = saldo - mon WHERE id_cuenta = id_c;
	ELSIF tip = 'ingresar' THEN
		UPDATE cuentas SET saldo = saldo + mon WHERE id_cuenta = id_c;
	ELSE
		RAISE SQLSTATE '22014';
	END IF;
	
	EXCEPTION
		WHEN SQLSTATE '22012' THEN
			RAISE NOTICE 'No tiene suficientes ingresos';
			ROLLBACK;
		WHEN SQLSTATE '22013' THEN
			RAISE NOTICE 'No puedes escribir valores negativos';
			ROLLBACK;
		WHEN SQLSTATE '22014' THEN
			RAISE NOTICE 'Escriba un tipo de movimiento valido';
			ROLLBACK;
		WHEN OTHERS THEN
			RAISE NOTICE 'Ha sucedido algun error';
			ROLLBACK;
	
	COMMIT;
END $$ LANGUAGE plpgsql;

SELECT * FROM cuentas;
SELECT * FROM movimientos;
call ingresar_retirar(1000.00,'retirar',2);