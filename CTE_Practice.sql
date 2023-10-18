
--- return the number of orders in 2018 by sales staff.
 -- select * from sales.orders

	select full_name ,
	avg(order_count) from(
	select a.first_name + ' ' +a.last_name as full_name,year(b.order_date) as O_Year,
	a.staff_id,count(*) order_count
from bikestores.sales.staffs as a inner join bikestores.sales.orders as b
on a.staff_id=b.staff_id
where year(b.order_date)=2018
group by a.first_name + ' ' +a.last_name ,a.staff_id,year(b.order_date)
--having year(b.order_date)=2018
) as subQ
group by full_name ;

--- using CTE
	with total_count (full_name,staff_id,order_count,O_year) 
AS (
select a.first_name + ' ' +a.last_name as full_name,a.staff_id,count(*) order_count,year(b.order_date) as O_year
from BikeStores.sales.staffs as a inner join BikeStores.sales.orders as b
on a.staff_id=b.staff_id
--where year(b.order_date)=2018
group by a.first_name + ' ' +a.last_name ,a.staff_id,year(b.order_date)
)
select avg(order_count) from total_count where O_year=2018

	-------------- Recrsive CTE's ----------------------

	
	select DATENAME(DW,0)



	-- return weakdays from datename
	with weakDays (wno,wday) AS 
	( SELECT 0,DATENAME(DW,0)
	UNION ALL
	SELECT wno+1,DATENAME(DW,WNO+1) FROM weakDays
	where wno<6 )
	select * from weakDays

	
	---------------------------------------------
	with facto(num,fact) as (
	select 1 num,1 as fact
	union all
	select num+1,(num+1)*fact from facto
	where num<6)
	select * from facto


	select s.first_name,s.staff_id,s.manager_id from sales.staffs as s
	inner join sales.staffs as rs on rs.manager_id=s.staff_id;
	select s.first_name,s.staff_id,s.manager_id from sales.staffs as s