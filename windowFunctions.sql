	
	-- ROW_NUMBER( )
	SELECT * from interview_prep..marks;

	select rollno,sname,marks
	,row_number() over( partition by marks order by marks) as Rownum
	from interview_prep..marks order by marks


	--	RANK FUNCTION
	SELECT * from interview_prep..marks;

	select rollno,sname,marks
	,RANK() over(order by marks desc) as SRank
	from interview_prep..marks order by SRank

	-- DENSE_RANK Function
		select rollno,sname,marks
		,DENSE_RANK() over( order by marks desc) as SRank
	from interview_prep..marks


-- Lead -> Access next row value.
		select rollno,sname,marks
		,lead(marks,1) over( order by marks desc) as next_std_marks
	from interview_prep..marks

-- LAG
	select rollno,sname,marks
	,lag(marks,1) over( order by marks desc) as prev_std_marks
	from interview_prep..marks

-- ntile

select array[1,2,3]
/*	

  create table interview_prep..marks( rollno varchar(10),sname char(30),marks decimal(3,1));

 	insert into interview_prep..marks 
	values (509,'Harry Styles',66),(501,'jennyfer',60),
 	(502,'sia',61),(503,'Aravind',60),(504,'john galt',60),(505,'lady gaga',62)
 	,(505,'justin bieber',60),(506,'Rose',65),(507,'monalisa',60),(508,'Dua Lipa',66)

*/

