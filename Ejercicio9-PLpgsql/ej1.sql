-- EJERCICIOS
/*

1 - Escriba un bloque de codigo PL/pgSQL que reciba una nota como parametro
    y notifique en la consola de mensaje las letras A,B,C,D,E o F segun el valor de la nota

*/
DO $$
DECLARE nota int := 8;
BEGIN
CASE
WHEN nota >= 9 THEN
	RAISE NOTICE 'A';
WHEN  9 > nota AND nota >= 7 THEN
	RAISE NOTICE 'B';
WHEN nota = 6 THEN
	RAISE NOTICE 'C';
WHEN nota = 5 THEN
	RAISE NOTICE 'D';
WHEN nota = 4 THEN
	RAISE NOTICE 'E';
ELSE
	RAISE NOTICE 'F';
END CASE;
END $$ LANGUAGE 'plpgsql';
/*
2 - Escriba un bloque de codigo PL/pgSQL que reciba un numero como parametro
    y muestre la tabla de multiplicar de ese numero.
*/
DO $$
DECLARE num int := 7;
BEGIN
FOR n IN 1..10 LOOP
	RAISE NOTICE '% x % = %',num,n,(num*n);
END LOOP;
END $$ LANGUAGE 'plpgsql';
/*
3 - Escriba una funcion PL/pgSQL que convierta de dolares a moneda nacional.
    La funcion debe recibir dos parametros, cantidad de dolares y tasa de cambio.
    Al final debe retornar el monto convertido a moneda nacional.
*/
DO $$
DECLARE
dolars decimal := 12;
tasa decimal := 1.02;
BEGIN
RAISE NOTICE 'Intercabio a euros = %',dolars*tasa;
END $$ LANGUAGE 'plpgsql';

/*

4 - Escriba una funcion PL/pgSQL que reciba como parametro el monto de un prestamo,
    su duracion en meses y la tasa de interes, retornando el monto de la cuota a pagar.
    Aplicar el metodo de amortizacion frances.
*/
DO $$
DECLARE 
monto decimal := 1000;
N int := 12;
i decimal := 0.2/12;
BEGIN
RAISE NOTICE 'Calculado: %',(monto*i)/(1-((1+i)^(-N)));
END $$ LANGUAGE 'plpgsql';