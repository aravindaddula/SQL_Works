

create table production.brands(brand_id int,brand_name char(50))
insert into production.brands(brand_id,brand_name)
( select brand_id,brand_name from brands )

insert into production.brands values(2,'Haro'),(3,' '),(4,null)

select * from production.brands

	select brand_id, --min(brand_name) minOf_brand_name,
max(brand_name) maxOf_brand_name
from ITCRATS.production.brands
group by brand_id,brand_name

	select *
from ITCRATS.production.brands
group by brand_id,brand_name