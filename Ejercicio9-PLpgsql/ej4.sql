/*
1. Cuando se añade un movimiento se modifica el saldo
*/
CREATE OR REPLACE FUNCTION update_cuenta()
RETURNS trigger
AS $$
BEGIN
	IF new.monto < 0 THEN
		RAISE SQLSTATE '22013';
	END IF;
	IF new.tipo = 'retirar' THEN
		IF (SELECT saldo FROM cuentas WHERE id_cuenta = new.id_cuenta)<new.monto THEN
			RAISE SQLSTATE '22012';
		END IF;
		UPDATE cuentas SET saldo = saldo - new.monto WHERE id_cuenta = new.id_cuenta;
	ELSIF new.tipo = 'ingresar' THEN
		UPDATE cuentas SET saldo = saldo + new.monto WHERE id_cuenta = new.id_cuenta;
	ELSE
		RAISE SQLSTATE '22014';
	END IF;
	RETURN new;
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
END $$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER up_cuenta
BEFORE INSERT
ON movimientos
for each row
execute procedure update_cuenta();

insert into movimientos(tipo,monto,id_cuenta) values ('retirar',2000.00,2);
/*
2. Cuando se actualiza el saldo se inserta un movimiento
*/
CREATE OR REPLACE FUNCTION insert_movimiento()
RETURNS trigger
AS $$
DECLARE
	dif numeric;
	tip varchar;
BEGIN
	dif := new.saldo - old.saldo;
	IF dif > 0 THEN
		tip := 'ingresar';
	ELSE
		tip := 'retirar';
		dif := -dif;
	END IF;
	INSERT INTO movimientos (tipo,monto,id_cuenta)
	VALUES (tip,dif,new.id_cuenta);
	RETURN NEW;
END $$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER in_movimiento
AFTER UPDATE
ON cuentas
for each row
execute procedure insert_movimiento();

UPDATE cuentas SET saldo = 2500 WHERE id_cuenta = 3;