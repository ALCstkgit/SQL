-- Sentencia Select 
--Obtener todos los registros y todos los campos de la tabla de productos
SELECT * FROM products;

-- Obtenerr una consulta con Productid, productname, supplierid, categoryId, UnistsinStock, UnitPrice
SELECT product_id, product_name, supplier_id, category_id, units_in_stock, unit_price FROM products;

--Crear una consulta para obtener el IdOrden, IdCustomer, Fecha de la orden de la tabla de ordenes.
SELECT order_id, customer_id, order_date FROM orders;

--Crear una consulta para obtener el OrderId, EmployeeId, Fecha de la orden.
SELECT order_id, employee_id, order_date FROM orders;

--Columnas calculadas 
--Obtener una consulta con Productid, productname y valor del inventario, valor inventrio (UnitsinStock * UnitPrice)
SELECT product_id, product_name, units_in_stock * unit_price as stock_price FROM products;

-- Cuanto vale el punto de reorden
SELECT unit_price * reorder_level as reorder_point FROM products;

-- Mostrar una consulta con Productid, productname y precio, el nombre del producto debe estar en mayuscula 
SELECT product_id, UPPER(product_name) as product_name, unit_price FROM products;

-- Mostrar una consulta con Productid, productname y precio, el nombre del producto debe contener unicamente 10 caracteres
SELECT product_id, LEFT(product_name,10) as product_name, unit_price FROM products;

--Obtenre una consulta que muestre la longitud del nombre del producto
SELECT LENGTH(product_name) as product_name_length FROM products;

--Obtener una consulta de la tabla de productos que muestre el nombre en minúscula
SELECT LOWER(product_name) as product_name FROM products;

-- Mostrar una consulta con Productid, productname y precio, el nombre del producto debe contener unicamente 10 caracteres y se deben mostrar en mayúscula
SELECT product_id, LEFT(UPPER(product_name),10) as product_name, unit_price FROM products;

--Filtros
--Obtener de la tabla de Customers las columnas CustomerId, CompanyName, Pais Obtener los clientes cuyo pais sea Spain
SELECT customer_id, company_name, country FROM customers WHERE country = 'Spain';

--Obtener de la tabla de Customers las columnas CustomerId, CompanyName, Pais, Obtener los clientes cuyo pais comience con la letra U
SELECT customer_id, company_name, country FROM customers WHERE country LIKE 'U%';

--Obtener de la tabla de Customers las columnas CustomerId, CompanyName, Pais, Obtener los clientes cuyo pais comience con la letra U,S,A
SELECT customer_id, company_name, country FROM customers WHERE country LIKE 'U%' OR country LIKE 'S%' OR country LIKE 'A%';

--Obtener de la tabla de Productos las columnas productid, ProductName, UnitPrice cuyos precios esten entre 50 y 150
SELECT product_id, product_name, unit_price FROM products WHERE unit_price BETWEEN 50 AND 150;

--Obtener de la tabla de Productos las columnas productid, ProductName, UnitPrice, UnitsInStock cuyas existencias esten entre 50 y 100
SELECT product_id, product_name, unit_price, units_in_stock FROM products WHERE units_in_stock BETWEEN 50 AND 150;

--Obtener las columnas OrderId, CustomerId, employeeid de la tabla de ordenes cuyos empleados sean 1, 4, 9
SELECT order_id, customer_id, employee_id FROM orders WHERE employee_id = 1 OR employee_id = 4 OR employee_id = 9;

-- ORDENAR EL RESULTADO DE LA QUERY POR ALGUNA COLUMNA Obtener la información de la tabla de Products, Ordenarlos por Nombre del Producto de forma ascendente
SELECT * FROM products ORDER BY product_name ASC;

-- Obtener la información de la tabla de Products, Ordenarlos por Categoria de forma ascendente y por precio unitario de forma descendente
SELECT * FROM products ORDER BY category_id ASC, unit_price DESC;

-- Obtener la información de la tabla de Clientes, Customerid, CompanyName, city, country ordenar por pais, ciudad de forma ascendente
SELECT customer_id, company_name, city, country FROM customers ORDER BY country ASC,city ASC;

-- Obtener los productos productid, productname, categoryid, supplierid ordenar por categoryid y supplier únicamente mostrar aquellos cuyo precio esté entre 25 y 200
SELECT product_id, product_name, category_id, supplier_id FROM products WHERE unit_price BETWEEN 25 AND 200 ORDER BY category_id, supplier_id;


--Funciones agregación
--Cuantos productos hay en la tabla de productos
SELECT count(product_id) as num_products FROM products;

--de la tabla de productos Sumar las cantidades en existencia
SELECT sum(units_in_stock) FROM products;

--Promedio de los precios de la tabla de productos
SELECT AVG(unit_price) FROM products;

--Ordenar
--Obtener los datos de productos ordenados descendentemente por precio unitario de la categoría 1
SELECT * FROM products WHERE category_id = 1 ORDER BY unit_price DESC;

--Obtener los datos de los clientes(Customers) ordenados descendentemente por nombre(CompanyName) que se encuentren en la ciudad(city) de barcelona, Lisboa
SELECT * FROM customers WHERE city IN ('Barcelona', 'Lisboa') ORDER BY company_name DESC;

--Obtener los datos de las ordenes, ordenados descendentemente por la fecha de la orden cuyo cliente(CustomerId) sea ALFKI
SELECT * FROM orders WHERE customer_id = 'ALFKI' ORDER BY order_date DESC;

--Obtener los datos del detalle de ordenes, ordenados ascendentemente por precio cuyo producto sea 1, 5 o 20
SELECT * FROM order_details where product_id IN (1,5,20) ORDER BY unit_price ASC;

--Obtener los datos de las ordenes ordenados ascendentemente por la fecha de la orden cuyo empleado sea 2 o 4
SELECT * FROM orders WHERE employee_id IN (2,4) ORDER BY order_date ASC;

--Obtener los productos cuyo precio están entre 30 y 60 ordenado por nombre
SELECT * FROM products WHERE unit_price BETWEEN 30 AND 60 ORDER BY product_name;

--funciones de agrupacion
--OBTENER EL MAXIMO, MINIMO Y PROMEDIO DE PRECIO UNITARIO DE LA TABLA DE PRODUCTOS UTILIZANDO ALIAS
SELECT MAX(unit_price) as maximo, MIN(unit_price) as minimo, AVG(unit_price) as promedio FROM products;

--Agrupacion
--Numero de productos por categoria
SELECT category_id, count(product_id) as num_products FROM products GROUP BY category_id;

--Obtener el precio promedio por proveedor de la tabla de productos
SELECT supplier_id, AVG(unit_price) FROM products GROUP BY supplier_id;

--Obtener la suma de inventario (UnitsInStock) por SupplierID De la tabla de productos (Products)
SELECT supplier_id, sum(units_in_stock) as sum_stock FROM products GROUP BY supplier_id;

--Contar las ordenes por cliente de la tabla de orders
SELECT customer_id, count(order_id) as num_orders FROM orders GROUP BY customer_id;

--Contar las ordenes por empleado de la tabla de ordenes unicamente del empleado 1,3,5,6
SELECT employee_id, count(order_id) as num_orders FROM orders WHERE employee_id IN (1,3,5,6) GROUP BY employee_id;

--Obtener la suma del envío (freight) por cliente
SELECT customer_id, sum(freight) as sum_freight FROM orders GROUP BY customer_id;

--De la tabla de ordenes únicamente de los registros cuya ShipCity sea Madrid, Sevilla, Barcelona, Lisboa, London Ordenado por el campo de suma del envío
SELECT ship_city, sum(freight) as sum_freight FROM orders WHERE ship_city IN ('Madrid', 'Sevilla', 'Barcelona', 'Lisboa', 'London') GROUP BY ship_city ORDER BY sum_freight;

--obtener el precio promedio de los productos por categoria sin contar con los productos descontinuados (Discontinued)
SELECT category_id, AVG(unit_price) as avg_products FROM products WHERE discontinued = 1 GROUP BY category_id;

--Obtener la cantidad de productos por categoria,  aquellos cuyo precio se encuentre entre 10 y 60 que tengan más o igual a 9 productos
SELECT category_id, count(product_id) as num_products FROM products WHERE unit_price BETWEEN 10 AND 60 GROUP BY category_id HAVING count(product_id) >= 9;

--OBTENER LA SUMA DE LAS UNIDADES EN EXISTENCIA (UnitsInStock) POR CATEGORIA, Y TOMANDO EN CUENTA UNICAMENTE LOS PRODUCTOS CUYO PROVEEDOR (SupplierID) SEA IGUAL A 17, 19, 16.
--cuya categoria tenga menos de 100 unidades ordenado por unidades
SELECT category_id, sum(units_in_stock) as sum_units FROM products where supplier_id IN (16,17,19) GROUP BY category_id HAVING sum(units_in_stock) < 100 ORDER BY sum_units;