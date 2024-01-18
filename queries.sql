USE industrial_records;
show tables;

#SELECT mid FROM utilized_by WHERE rid=102;

#SELECT charges FROM charging WHERE destination='chennai';

SELECT SUM(salary) FROM salaries NATURAL JOIN worker 
WHERE worker.wid IN (SELECT worker.wid FROM worker WHERE worker.wid BETWEEN 12343 AND 12349);

SELECT COUNT(*) FROM shipping WHERE shipping.destination = 'bangalore';

SELECT DISTINCT product.quantity,product.pid,shipping.order_no FROM product NATURAL JOIN shipping WHERE product.pid IN 
(SELECT DISTINCT shipping.pids WHERE shipping.no_of_products>1500);