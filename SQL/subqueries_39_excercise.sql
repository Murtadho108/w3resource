-- 1 
-- Write a query to display all the orders from the orders table issued by the salesman 'Paul Adam'.
SELECT *
FROM orders
WHERE salesman_id = (SELECT salesman_id FROM salesman 
     WHERE name='Paul Adam');
     
-- 2
-- Write a query to display all the orders for the salesman who belongs to the city London.

SELECT * FROM orders
WHERE salesman_id = (SELECT salesman_id FROM salesman WHERE city='London');

-- 3
-- Write a query to find all the orders issued against the salesman who may works for customer whose id is 3007.
 
SELECT * FROM orders
WHERE salesman_id = (SELECT DISTINCT salesman_id FROM orders WHERE customer_id =3007);

-- 4
-- Write a query to display all the orders which values are greater than the average order value for 10th October 2012.

SELECT * FROM orders WHERE purch_amt > (SELECT  AVG(purch_amt) FROM orders WHERE ord_date ='10/10/2012');

-- 5
-- Write a query to find all orders attributed to a salesman in New york.

SELECT * FROM orders WHERE salesman_id IN (SELECT salesman_id FROM salesman WHERE city ='New York');

-- 6
-- Write a query to display the commission of all the salesmen servicing customers in Paris.

SELECT commission FROM salesman WHERE salesman_id IN (SELECT salesman_id FROM customer WHERE city = 'Paris');

-- 7
-- Write a query to display all the customers whose id is 2001 bellow the salesman ID of Mc Lyon.

SELECT * FROM customer WHERE customer_id = (SELECT salesman_id -2001 FROM salesman WHERE name = 'Mc Lyon');

-- 8
-- Write a query to count the customers with grades above New York's average.

SELECT grade, COUNT (*) FROM customer GROUP BY grade
HAVING grade > (SELECT AVG(grade) FROM customer WHERE city = 'New York');

-- 9
-- Write a query to display all customers with orders on October 5, 2012.

