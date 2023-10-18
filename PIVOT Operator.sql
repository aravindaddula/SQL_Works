select * from INFORMATION_SCHEMA.tables
-- production.products, production.categories
-- finds the number of products for each product category
SELECT * FROM PRODUCTION.PRODUCTS
SELECT * FROM PRODUCTION.CATEGORIES

SELECT CATEGORY_NAME, COUNT(CATEGORY_ID) as count_categories from PRODUCTION.CATEGORIES 
group by category_name
SELECT * FROM PRODUCTION.PRODUCTS
select category_id,count(product_id) as count_categories from production.products group by category_id
SELECT Category_name, count(*) Category_count from production.products p inner join production.categories c on p.category_id = c.category_id group by category_name

SELECT * FROM   
(
    SELECT category_name, product_id, model_year FROM production.products p INNER JOIN production.categories c ON c.category_id = p.category_id ) t 
PIVOT(
    COUNT(product_id) 
    FOR category_name IN (
        [Children Bicycles], [Comfort Bicycles], [Cruisers Bicycles], [Cyclocross Bicycles], [Electric Bikes], [Mountain Bikes], [Road Bikes])
		) as pivot_table;

SELECT * FROM PRODUCTION.PRODUCTS

SELECT * FROM (SELECT model_year,category_name, product_id FROM production.products p INNER JOIN production.categories c ON c.category_id = p.category_id) AS T 
PIVOT( COUNT(product_id)
FOR category_name IN(
[Mountain Bikes],
[Cyclocross Bicycles],[Cruisers Bicycles],[Cruisers Bicycles2],[Cruisers Bicycles3],
[Cruisers Bicycles4],[Cruisers Bicycles5],[Cruisers Bicycles6],[Cruisers Bicycles7],[Cruisers Bicycles8]
)) AS PT;

SELECT * FROM SALES.CUSTOMERS
SELECT TOP 1 FIRST_NAME FROM SALES.CUSTOMERS ORDER BY LEN(FIRST_NAME)
SELECT TOP 1 FIRST_NAME FROM SALES.CUSTOMERS ORDER BY LEN(FIRST_NAME) DESC
SELECT FIRST_NAME,LEN(FIRST_NAME) FROM SALES.CUSTOMERS ORDER BY LEN(FIRST_NAME)
SELECT TOP 1 * FROM SALES.CUSTOMERS ORDER BY LEN(FIRST_NAME)

select top 1 * from sales.customers where len(first_name) = (select min(len(first_name)) from sales.customers);

select top 1* from sales.customers where len(first_name) = (select min(len(first_name)) from sales.customers ) order by first_name;

SELECT product_name,list_price,category_id FROM production.products p1
WHERE list_price IN ( SELECT MAX (p2.list_price) FROM production.products p2 WHERE p2.category_id = p1.category_id GROUP BY p2.category_id )
ORDER BY category_id, product_name;

SELECT category_name,count(*) FROM production.categories GROUP BY category_name;

SELECT * FROM (SELECT model_year,category_name, product_id FROM production.products p INNER JOIN production.categories c ON c.category_id = p.category_id) AS T
PIVOT( COUNT(product_id)
FOR category_name IN(
[Children Bicycles],[Comfort Bicycles],[Cruisers Bicycles],[Cyclocross Bicycles],[Electric Bikes],[Mountain Bikes],[Road Bikes]
)) as piv

SELECT category_name,count(*) CountOfCategory FROM production.products p INNER JOIN production.categories c ON c.category_id = p.category_id GROUP BY category_name

SELECT product_name,COUNT(*) FROM production.products group by product_name

--pivoting
SELECT * FROM SALES.ORDERS
SELECT * from sales.customers
select * from sales.customers AS Cust join production.categories CAT  

