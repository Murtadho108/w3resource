-- 1 
-- Write a query to display all the orders from the orders table issued by the salesman 'Paul Adam'.
SELECT *
FROM orders
WHERE salesman_id = (SELECT salesman_id FROM salesman 
     WHERE name='Paul Adam');
     
-- 2
-- Write a query to display all the orders for the salesman who belongs to the city London.

