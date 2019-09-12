-- 1
-- Write a query to find those customers with their name and those salesmen with their name and city who lives in the same city.

SELECT customer.cust_name, salesman.name, salesman.city
FROM salesman, customer
WHERE salesman.city = customer.city;

-- 2
-- Write a SQL statement to find the names of all customers along with the salesmen who works for them.

SELECT customer.cust_name, salesman.name FROM customer, salesman 
WHERE customer.salesman_id = salesman.salesman_id

-- 3
-- Write a SQL statement to display all those orders by the customers not located in the same cities where their salesmen live.

SELECT ord_no, cust_name, orders.customer_id, orders.salesman_id
FROM salesman, customer, orders
WHERE customer.city <> salesman.city AND orders.salesman_id = salesman.salesman_id
AND orders.customer_id = customer.customer_id;

-- 4
-- Write a SQL statement that finds out each order number followed by the name of the customers who made the order.

SELECT orders.ord_no, customer.cust_name FROM orders, customer
WHERE orders.customer_id = customer.customer_id;

-- 5
-- Write a SQL statement that sorts out the customer and their grade who made an order. 
-- Each of the customers must have a grade and served by at least a salesman, who belongs to a city.

SELECT customer.cust_name AS "customer", customer.grade AS "grade"
FROM orders, salesman, customer
WHERE orders.customer_id = customer.customer_id AND orders.salesman_id = salesman.salesman_id
AND salesman.city IS NOT NULL AND customer.grade IS NOT NULL;

-- 6
-- Write a query that produces all customers with their name, city, salesman and commission, 
-- who served by a salesman and the salesman works at a rate of the commission within 12% to 14%.

SELECT customer.cust_name AS "customer", customer.city AS "city", salesman.name AS "salesman", salesman.commission
FROM customer,salesman WHERE customer.salesman_id = salesman.salesman_id AND salesman.commission
BETWEEN 0.12 AND 0.14;

-- 7
-- Write a SQL statement that produces all orders with the order number, customer name, commission rate and earned commission amount 
-- for those customers who carry their grade is 200 or more and served by an existing salesman. 

SELECT ord_no, cust_name, commission AS "commission_%", purch_amt*commission AS "commission"
FROM salesman,orders,customer
WHERE orders.customer_id = customer.customer_id AND orders.salesman_id = salesman.salesman_id
AND customer.grade>=200;
