--distinct

-- Se quiere saber a qué paises se les vende usar la tabla de clientes
SELECT distinct country FROM customers;

-- Se quiere saber a qué ciudades se les vende usar la tabla de clientes
SELECT distinct city FROM customers;

-- Se quiere saber a qué ciudades se les ha enviado una orden
SELECT distinct ship_city FROM orders;

-- Se quiere saber a qué ciudades se les vende en el pais USA usar la tabla de clientes
SELECT distinct city FROM customers WHERE country = 'USA';

--Agrupacion

-- Se quiere saber a qué paises se les vende usar la tabla de clientes nota hacerla usando group by
SELECT country FROM customers GROUP BY country;

--Cuantos clientes hay por pais
SELECT country, count(customer_id) FROM customers GROUP BY country;

--Cuantos clientes hay por ciudad en el pais USA
SELECT city, count(customer_id) FROM customers WHERE country = 'USA' GROUP BY city;

--Cuantos productos hay por proveedor de la categoria 1
SELECT supplier_id, count(product_id) FROM products WHERE category_id = 1 GROUP BY supplier_id;

--Filtro con having

-- Cuales son los proveedores que nos surten más de 1 producto, mostrar el proveedor mostrar la cantidad de productos
SELECT supplier_id, count(product_id) as num_products FROM products GROUP BY supplier_id HAVING count(product_id) > 1;

-- Cuales son los proveedores que nos surten más de 1 producto, mostrar el proveedor mostrar la cantidad de productos, pero únicamente de la categoria 1
SELECT supplier_id, count(product_id) as num_products FROM products WHERE category_id = 1 GROUP BY supplier_id HAVING count(product_id) > 1;

--CONTAR LAS ORDENES POR EMPLEADO DE LOS PAISES USA, CANADA, SPAIN (ShipCountry) MOSTRAR UNICAMENTE LOS EMPLEADOS CUYO CONTADOR DE ORDENES SEA MAYOR A 20
SELECT employee_id, count(order_id) AS num_orders FROM orders WHERE ship_country IN ('USA', 'CANADA', 'SPAIN') GROUP BY employee_id HAVING count(order_id) > 20;

--OBTENER EL PRECIO PROMEDIO DE LOS PRODUCTOS POR PROVEEDOR UNICAMENTE DE AQUELLOS CUYO PROMEDIO SEA MAYOR A 20
SELECT supplier_id, avg(unit_price) as avg_price FROM products GROUP BY supplier_id HAVING avg(unit_price) > 20;

--OBTENER LA SUMA DE LAS UNIDADES EN EXISTENCIA (UnitsInStock) POR CATEGORIA, Y TOMANDO EN CUENTA UNICAMENTE LOS PRODUCTOS CUYO PROVEEDOR (SupplierID) SEA IGUAL A 17, 19, 16 DICIONALMENTE CUYA SUMA POR CATEGORIA SEA MAYOR A 300--
SELECT category_id, sum(units_in_stock) as sum_stock FROM products WHERE supplier_id IN (16,17,19) GROUP BY category_id HAVING sum(units_in_stock) > 300;

--CONTAR LAS ORDENES POR EMPLEADO DE LOS PAISES (ShipCountry) SA, CANADA, SPAIN cuYO CONTADOR SEA MAYOR A 25
SELECT employee_id, count(order_id) as num_orders FROM orders WHERE ship_country IN ('SA', 'CANADA', 'SPAIN') GROUP BY employee_id HAVING count(order_id) > 25;

----OBTENER LAS VENTAS (Quantity * UnitPrice) AGRUPADAS POR PRODUCTO (Orders details) Y CUYA SUMA DE VENTAS SEA MAYOR A 50.000
SELECT product_id, sum(quantity) * sum(unit_price) as sales FROM order_details GROUP BY product_id HAVING sum(quantity) * sum(unit_price) > 50000;


--Mas de una tabla 

--OBTENER EL NUMERO DE ORDEN, EL ID EMPLEADO, NOMBRE Y APELLIDO DE LAS TABLAS DE ORDENES Y EMPLEADOS
SELECT o.order_id, e.employee_id, e.first_name, e.last_name FROM orders o INNER JOIN employees e ON o.employee_id = e.employee_id;

--OBTENER EL PRODUCTID, PRODUCTNAME, SUPPLIERID, COMPANYNAME DE LAS TABLAS DE PRODUCTOS Y PROVEEDORES (SUPPLIERS)
SELECT pr.product_id, pr.product_name, s.supplier_id, s.company_name FROM products pr INNER JOIN suppliers s ON pr.supplier_id = s.supplier_id;

--OBTENER LOS DATOS DEL DETALLE DE ORDENES CON EL NOMBRE DEL PRODUCTO DE LAS TABLAS DE DETALLE DE ORDENES Y DE PRODUCTOS
SELECT o.*, pr.product_name FROM order_details o INNER JOIN products pr ON o.product_id = pr.product_id;

--OBTENER DE LAS ORDENES EL ID, SHIPPERID, NOMBRE DE LA COMPAÑÍA DE ENVIO (SHIPPERS)
SELECT o.order_id, s.shipper_id, s.company_name FROM orders o INNER JOIN shippers s ON o.ship_via = s.shipper_id;

--Obtener el número de orden, país de envío (shipCountry) y el nombre del empleado de la tabla ordenes y empleados Queremos que salga el Nombre y Apellido del Empleado en una sola columna.
SELECT o.order_id, o.ship_country, e.first_name||' '||e.last_name as employee_name FROM orders o INNER JOIN employees e ON o.employee_id = e.employee_id;

--Combinando la mayoría de conceptos

--CONTAR EL NUMERO DE ORDENES POR EMPLEADO OBTENIENDO EL ID EMPLEADO Y EL NOMBRE COMPLETO DE LAS TABLAS DE ORDENES Y DE EMPLEADOS join y group by / columna calculada
SELECT e.employee_id ,e.first_name||' '||e.last_name as employee_name, count(o.order_id) FROM employees e JOIN orders o ON e.employee_id = o.employee_id GROUP BY e.employee_id;

--OBTENER LA SUMA DE LA CANTIDAD VENDIDA Y EL PRECIO PROMEDIO POR NOMBRE DE PRODUCTO DE LA TABLA DE ORDERS DETAILS Y PRODUCTS
SELECT pr.product_name, sum(od.quantity), avg(od.unit_price) FROM products pr JOIN order_details od ON pr.product_id = od.product_id GROUP BY pr.product_name;

--OBTENER LAS VENTAS (UNITPRICE * QUANTITY) POR CLIENTE DE LAS TABLAS ORDER DETAILS, ORDERS
SELECT o.customer_id, count(od.unit_price * od.quantity) as sales FROM orders o JOIN order_details od ON o.order_id = od.order_id GROUP BY o.customer_id;

--OBTENER LAS VENTAS (UNITPRICE * QUANTITY) POR EMPLEADO MOSTRANDO EL APELLIDO (LASTNAME)DE LAS TABLAS EMPLEADOS, ORDENES, DETALLE DE ORDENES
SELECT e.last_name, count(od.unit_price * od.quantity) as sales FROM order_details od JOIN orders o ON o.order_id = od.order_id JOIN employees e ON o.employee_id = e.employee_id GROUP BY e.last_name;