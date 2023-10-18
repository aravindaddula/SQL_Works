	
	-- ROW_NUMBER( )

	select rollno,sname,smarks,row_number() over( partition by smarks order by rollno) as Rownum
	from marks order by smarks


	--	RANK FUNCTION

	select rollno,sname,smarks,RANK() over( order by smarks) as SRank
	from marks order by smarks

	-- DENSE_RANK Function
		select rollno,sname,smarks,DENSE_RANK() over( order by smarks) as SRank
	from marks order by smarks
	
--  create table marks( rollno varchar(10),sname char(30),marks decimal(3,1))
-- 
-- 	insert into marks values (509,'Harry Styles',66),(501,'jennyfer',60),
-- (502,'sia',61),(503,'Aravind',60),(504,'john galt',60),(505,'lady gaga',62)
-- ,(505,'justin bieber',60),(506,'Rose',65),(507,'monalisa',60),(508,'Dua Lipa',66)

