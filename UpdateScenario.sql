
select * from Northwind.INFORMATION_SCHEMA.COLUMNS where table_name='Order details'

select * from Northwind.INFORMATION_SCHEMA.TABLE_CONSTRAINTS where table_name='Order details'

select * from Northwind.dbo.[Order Details]




select Column_name from Northwind.INFORMATION_SCHEMA.columns
where table_name='Order details'
AND  ( select TOP(1)CONSTRAINT_TYPE from Northwind.INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
	where table_name='Order details') = 'PRIMARY KEY'


