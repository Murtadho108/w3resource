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

SELECT * FROM customer a,orders  b 
WHERE a.customer_id = b.customer_id 
AND b.ord_date='2012-10-05';

-- 10
-- Write a query to display all the customers with orders issued on date 17th August, 2012.

SELECT b.*, a.cust_name FROM orders b, customer a
WHERE a.customer_id=b.customer_id AND b.ord_date='2012-08-17';

-- 11
-- Write a query to find the name and numbers of all salesmen who had more than one customer.

SELECT salesman_id,name 
FROM salesman a 
WHERE 1 < (SELECT COUNT(*) FROM customer WHERE salesman_id=a.salesman_id);

-- 12
-- Write a query to find all orders with order amounts which are above-average amounts for their customers.

SELECT * FROM orders a
WHERE purch_amt > (SELECT AVG(purch_amt) FROM orders b WHERE b.customer_id = a.customer_id);
     
 -- 13
 -- Write a queries to find all orders with order amounts which are on or above-average amounts for their customers.

SELECT *  FROM orders a 
WHERE purch_amt >= (SELECT AVG(purch_amt) FROM orders b WHERE b.customer_id = a.customer_id);

-- 14
-- Write a query to find the sums of the amounts from the orders table, grouped by date, 
-- eliminating all those dates where the sum was not at least 1000.00 above the maximum order amount for that date.

SELECT ord_date, SUM (purch_amt) FROM orders a
GROUP BY ord_date
HAVING SUM (purch_amt) >
    (SELECT 1000.00 + MAX(purch_amt) 
     FROM orders b 
     WHERE a.ord_date = b.ord_date);

-- 15
-- Write a query to extract the data from the customer table if and only if one or more of the customers 
-- in the customer table are located in London.
 
SELECT customer_id,cust_name, city FROM customer
WHERE EXISTS (SELECT * FROM customer WHERE city='London');

-- 16
-- Write a query to find the salesmen who have multiple customers.

SELECT * FROM salesman 
WHERE salesman_id IN (SELECT DISTINCT salesman_id FROM customer a 
   WHERE EXISTS (
      SELECT * FROM customer b WHERE b.salesman_id=a.salesman_id 
      AND b.cust_name<>a.cust_name));

-- 17
-- Write a query to find all the salesmen who worked for only one customer.

        
        
 
