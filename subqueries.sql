SELECT * FROM information_schema.tables
-- The following query finds the customers who bought products in 2017:

SELECT * FROM production.products
SELECT * FROM SALES.ORDERS
SELECT * FROM SALES.CUSTOMERS

--The EXISTS operator returns TRUE if the subquery return results; otherwise, it returns FALSE. 532, 512

SELECT customer_id FROM SALES.ORDERS WHERE YEAR(order_date) = 2017

SELECT CHARINDEX('st','customer')

select * from sales.customers as c where 
EXISTS (SELECT customer_id FROM SALES.ORDERS WHERE YEAR(order_date) = 2011);

select * from sales.customers as c where CUSTOMER_ID = 532
select * from (SELECT * FROM SALES.ORDERS WHERE YEAR(order_date) = 2017)


SELECT * FROM information_schema.tables
-- SALES.STAFFS, SALES.ORDERS
SELECT COUNT(ORDER_ID) as orders_count FROM SALES.ORDERS
SELECT * FROM SALES.STAFFS
SELECT * FROM SALES.ORDERS
-- find the average of the sum of orders of all sales staff.
SELECT staff_id,COUNT(order_id) AS Order_count from sales.orders group by staff_id

select AVG(Order_count) as Avg_Count from 
(SELECT staff_id,COUNT(order_id) AS Order_count from sales.orders group by staff_id) a;

SELECT * from sales.orders where staff_id=2