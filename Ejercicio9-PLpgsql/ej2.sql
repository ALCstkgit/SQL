/*
1. función sin parametro de entrada para devolver el precio máximo
*/
CREATE OR REPLACE FUNCTION maxPrecio()
RETURNS numeric
AS $$
	DECLARE maxP numeric;
	BEGIN
		SELECT max(unit_price) into maxP FROM products;
		return maxP;
END $$ LANGUAGE plpgsql;
SELECT maxPrecio();
/*
2. Parametro de entrada. Obtener el numero de ordenes por empleado
*/
CREATE OR REPLACE FUNCTION numOrdenes(empleId int)
RETURNS int
AS $$
	DECLARE numOrders int;
	BEGIN
		SELECT count(order_id) into numOrders
		FROM orders
		WHERE employee_id = empleId;
		return numOrders;
END $$ LANGUAGE plpgsql;

SELECT numOrdenes(1);
/*
3. Obtener la venta de un empleado con un determinado producto
*/
CREATE OR REPLACE FUNCTION getVenta(empleId int, prodId int)
RETURNS int
AS $$
	DECLARE sumCantidades int;
	BEGIN
		SELECT sum(od.quantity) INTO sumCantidades
		FROM order_details od JOIN orders o
		ON od.order_id = o.order_id
		AND o.employee_id = empleId
		AND od.product_id = prodId;
		
		return sumCantidades;
END $$ LANGUAGE plpgsql;
SELECT getVenta(prodId => 1, empleId => 4);
/*
4. Crear una funcion para devolver una tabla con:
   producto_id, nombre, precio y unidades en strock.
   Debe obtener los productos terminados en n
*/
CREATE OR REPLACE FUNCTION prodLastN()
RETURNS TABLE(
	productId smallint,
	productName varchar(40),
	unitPrice real,
	unitsInStock smallint)
AS $$
	BEGIN
	RETURN QUERY
		SELECT product_id, product_name, unit_price, units_in_stock
		FROM products
		WHERE product_name LIKE '%n';
END $$ LANGUAGE plpgsql;

SELECT * FROM prodLastN();
/*
5. Creamos la función contador_ordenes_anio()
   QUE CUENTE LAS ORDENES POR AÑO devuelve una tabla con año y contador
*/
CREATE OR REPLACE FUNCTION contador_ordenes_anio()
RETURNS TABLE(
	orderDate date,
	numOrders bigint)
AS $$
	BEGIN
	RETURN QUERY
		SELECT order_date, count(order_id)
		FROM orders
		GROUP BY order_date;
END $$ LANGUAGE plpgsql;

SELECT * FROM contador_ordenes_anio();
/*
6. Lo mismo que el ejemplo anterior pero con un parametro de entrada que sea el año
*/
CREATE OR REPLACE FUNCTION contador_ordenes_un_anio(anio numeric)
RETURNS TABLE(
	orderDate numeric,
	numOrders bigint)
AS $$
	BEGIN
	RETURN QUERY
		SELECT (EXTRACT(YEAR FROM o.order_date)), count(order_id)
		FROM orders o
		WHERE (EXTRACT(YEAR FROM o.order_date)) = anio
		GROUP BY (EXTRACT(YEAR FROM o.order_date));
END $$ LANGUAGE plpgsql;

SELECT * FROM contador_ordenes_un_anio(1996);
/*
7. PROCEDIMIENTO ALMACENADO PARA OBTENER PRECIO PROMEDIO Y SUMA DE
   UNIDADES EN STOCK POR CATEGORIA
*/
CREATE OR REPLACE FUNCTION precioYStock(cId integer)
RETURNS TABLE(
	categoryId smallint,
	avgPrice double precision,
	sumStock bigint)
AS $$
	BEGIN
	RETURN QUERY
		SELECT category_id, avg(unit_price), sum(units_in_stock)
		FROM products
		WHERE category_id = cId
		GROUP BY category_id;
END $$ LANGUAGE plpgsql;
SELECT * FROM precioYStock(2);