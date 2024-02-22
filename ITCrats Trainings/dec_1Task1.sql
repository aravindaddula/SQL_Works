
--	create table dec_1Task1(colname char(1),colVal int)
--	insert into dec_1Task1 values('A',100),('B',200),('C',300),('D',400),('E',500)

-- using subquery
	select * , ( SELECT SUM(colval)  from dec_1Task1)-COLvAL AS Result from dec_1Task1
	
	-- USING join
	select b.colname,sum(a.colval) my_sum from dec_1Task1 as a join dec_1Task1 as b on a.colname!=b.colname
		group by b.colname

	---- using CTE 

	with sum_val(colname,my_sum) AS
	( SELECT colname,SUM(colval) AS my_sum  from dec_1Task1 group by colname )
	select b.colname from sum_val as a join dec_1Task1 as b on a.colname != b.colname


	with sum_val(my_sum ) AS
	( SELECT SUM(colval) AS my_sum  from dec_1Task1 )
	select b.colname,my_sum-colVal from sum_val as a ,dec_1Task1 as b --where a.colname != b.colname