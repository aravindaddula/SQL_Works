create table cricket(country varchar(20),id int)
alter table cricket add id int;
insert into cricket values('India',1),('Sri Lanka',2), ('New Zealand',3), ('England',4), ('USA',5)
select * from cricket


================================	

    1. Display all the information of the EMP table?
	
	SELECT * FROM emp;

    2. Display unique Jobs from EMPtable?
	
	SELECT DISTINCT JOB FROM emp;

    3. List the emps in the asc order of their Salaries?
	SELECT * FROM emp ORDER BY sal ;

    4. List the details of the emps in asc order of the Dptnos and desc of Jobs?

	SELECT e.* FROM emp e JOIN dept d on e.DEPTNO=d.DEPTNO ORDER BY e.DEPTNO , JOB DESC

    5. Display all the unique job groups in the descending order?

	SELECT JOB FROM emp GROUP BY JOB ORDER BY JOB DESC

    6. Display all the details of all ‘Mgrs’

	SELECT m.* FROM emp e join emp m ON e.mgr=m.empno -- sol -1 
	
	SELECT * FROM emp where EMPNO IN ( SELECT MGR FROM emp ) --sol-2

    7. List the emps who joined before 1981.
	
	SELECT * FROM emp WHERE YEAR(HIREDATE)<1981

    8. List the Empno, Ename, Sal, Daily sal of all emps in the asc order of Annsal.

	   SELECT EMPNO,ENAME,SAL,( SAL/30) AS Daily_Sal FROM emp order by (sal*12)

    9. Display the Empno, Ename, Job, Hiredate, Exp of allMgrs

	SELECT Empno,Ename,Job,Hiredate,DATEDIFF(year,HIREDATE,GETDATE()) AS Experience
		FROM emp where EMPNO IN (SELECT MGR FROM emp )

    10. List the Empno, Ename, Sal, Exp of all emps working for Mgr 7369.

	SELECT Empno,Ename,Sal,Hiredate, DATEDIFF(year,HIREDATE,GETDATE()) AS Experience
		FROM emp where mgr=7369

    11. Display all the details of the emps whose Comm. Is more than theirSal.

	SELECT * FROM emp where comm>sal

    12. List the emps in the asc order of Designations of those joined after the second half of 1981.

	SELECT * FROM emp  where hiredate> convert(date,'06-30-1981',101) order by job

    13. List the emps along with their Exp and Daily Sal is more than Rs.100.
	
	SELECT Empno,Ename,Job,Hiredate,DATEDIFF(year,HIREDATE,GETDATE()) AS Experience,(sal/30) AS Daily_sal
	FROM emp where (sal/30)>100


    14. List the emps who are either ‘CLERK’ or ‘ANALYST’ in the Desc order.

	SELECT * FROM emp  where JOB IN ('CLERK','ANALYST') ORDER BY JOB DESC

    15. List the emps who joined on 1-MAY-81,3-DEC-81,17-DEC-81,19-JAN-80 in asc order of seniority.

	SELECT * FROM emp
	where HIREDATE IN  ('1-MAY-1981','3-DEC-1981','17-DEC-1981','19-JAN-1980')
	ORDER BY DATEDIFF(year,HIREDATE,GETDATE())

    16. List the emp who are working for the Deptno 10 or 20.

	SELECT * FROM emp where DEPTNO IN (10,20)

    17. List the emps who are joined in the year 81.

	SELECT * FROM emp where YEAR(HIREDATE)=1981

    18. List the emps who are joined in the month of Aug 1980.

	SELECT * FROM emp where YEAR(HIREDATE)=1980 AND MONTH(HIREDATE)=8

    19. List the emps Who Annual sal ranging from 22000 and 45000.

	SELECT * FROM emp where (SAL*12) BETWEEN 22000 AND 45000

    20. List the Enames those are having five characters in theirNames.
	
	SELECT Ename FROM emp where len(Ename)=5

    21. List the Enames those are starting with ‘S’ and with fivecharacters.

		SELECT Ename FROM emp where len(Ename)=5 AND Ename like 'S%'

    22. List the emps those are having four chars and third character must be‘r’.

	SELECT Ename FROM emp where len(Ename)=4 AND Ename like '__R%'

    23. List the Five character names starting with ‘S’ and ending with‘H’.

	SELECT Ename FROM emp where len(Ename)=5 AND Ename like 'S%H'

    24. List the emps who joined in January.

	SELECT * FROM emp where MONTH(HIREDATE)=1

    25. List the emps who joined in the month of which second character is ‘a’.

	SELECT * FROM emp where DATENAME(month,HIREDATE) LIKE '_A%'

    26. List the emps whose Sal is four digit number ending with Zero.

	SELECT * FROM emp where LEN(SAL)=4 AND SAL LIKE '%0'

    27. List the emps whose names having a character set ‘ll’ together.

	SELECT * FROM emp where Ename like '%ll%'

    28. List the emps those who joined in 80’s.

	SELECT * FROM emp where year(Hiredate)=1980

    29. List the emps who does not belong to Deptno20.

	SELECT * FROM emp where DEPTNO!=20

    30. List all the emps except ‘PRESIDENT’ & ‘MGR” in asc order of Salaries.

	SELECT * FROM emp where job not in ('PRESIDENT','MANAGER') order by sal

    31. List all the emps who joined before or after 1981.

	SELECT * FROM emp where year(hiredate) != 1981 

    32. List the emps whose Empno not starting with digit 78.

	SELECT * FROM emp where Empno not like '78%'

    33. List the emps who are working under ‘MGR’ 7839.

	SELECT * FROM emp where MGR = 7839

    34. List the emps who joined in any year but not belongs to the month of March.

	SELECT * FROM emp where MONTH(HIREDATE) !=3

    35. List all the Clerks of Deptno20.

	SELECT * FROM emp where job = 'clerk' and deptno=20

    36. List the emps of Deptno 30 or 10 joined in the year 1981.

	SELECT * FROM emp where DEPTNO IN (10,30) AND YEAR(HIREDATE)=1981

    37. Display the details of SMITH.

	SELECT * FROM emp where ENAME='SMITH'

    38. Display the location of  SMITH.

	SELECT d.LOC AS [Location] FROM emp as e join dept d on e.deptno=d.deptno
	where E.ENAME = 'SMITH'

    39. List the total information of EMP table along with DNAME and Loc of all the emps Working Under ‘ACCOUNTING’ & ‘RESEARCH’ in the asc Deptno.

	SELECT e.*,d.DNAME,d.LOC AS [Location] FROM emp as e join dept d on e.deptno=d.deptno
	where d.DNAME IN ('ACCOUNTING','RESEARCH') order by d.Deptno

    40. List the Empno, Ename, Sal, Dname of all the ‘MGRS’ and ‘ANALYST’ working in New York, Dallas 
		with an exp less than 38 years without receiving the Comm asc order of Loc.

	SELECT e.Empno,e.Ename,e.sal,d.DNAME FROM emp as e join dept d on e.deptno=d.deptno
	where E.JOB IN ('MANAGER','ANALYST') AND D.LOC IN ('NEW YORK','DALLAS')
	AND DATEDIFF(YEAR,HIREDATE,GETDATE()) <38 AND E.COMM IS NULL
	order by d.LOC	

    41. Display the Empno, Ename, Sal, Dname, Loc, Deptno, Job of all emps working at CHICAGO or working 
		for ACCOUNTING dept with Ann Sal>28000, but the Sal should not be=3000 or 2800 who doesn’t belongs to the Mgr
		and whose no is having a digit ‘7’ or ‘8’ in 3rd position in the asc order of Deptno and desc order of job.

	SELECT e.Empno,e.Ename,e.sal,d.DNAME,D.LOC,D.DEPTNO,E.JOB,(E.SAL*12) ANN_SALARY,MGR
	FROM emp as e join dept d on e.deptno=d.deptno
	where (D.LOC IN ('CHICAGO') OR D.DNAME IN ('ACCOUNTING')) AND (E.SAL*12) > 28000
	AND E.SAL NOT IN (2800,3000)
	AND (MGR NOT LIKE '__7%' OR MGR NOT LIKE '__8')
	ORDER BY D.DEPTNO , JOB DESC

    42. Display the total information of the emps along with Grades in the asc order.
	
	SELECT E.*,G.GRADE FROM EMP E join salary_grade g on e.sal between g.min_sal AND g.max_sal
	ORDER BY G.GRADE

    43. List all the Grade 2 and Grade 3 emps.

	SELECT E.*,G.GRADE FROM EMP E join salary_grade g on e.sal between g.min_sal AND g.max_sal
	WHERE G.GRADE IN ( 2,3)


    44. Display all Grade 4,5 Analyst and Mgr.

	SELECT E.*,G.GRADE FROM EMP E join salary_grade g on e.sal between g.min_sal AND g.max_sal
	WHERE G.GRADE IN ( 4,5) AND JOB IN ('MANAGER','ANALYST')

    45. List the Empno, Ename, Sal, Dname, Grade, Exp, and Ann Sal of emps working for Dept 10 or20.

	SELECT E.EMPNO,ENAME,SAL,D.DNAME,G.GRADE,DATEDIFF(YEAR,HIREDATE,GETDATE()) AS Expr,(sal*12) as Ann_Sal
	FROM EMP E join salary_grade g on e.sal between g.min_sal AND g.max_sal
	JOIN DEPT D ON E.DEPTNO=D.DEPTNO
	WHERE E.DEPTNO IN (10,20)

    46. List all the information of emp with Loc and the Grade of all the emps belong to the Grade range from 2 to 4 
	working at the Dept those are not starting with char set ‘OP’ and not ending with ‘S’ with the designation
	having a char ‘a’ any where joined in the year 1981 but not in 	the month of Mar or Sep and Sal not end with ‘00’ in
	the asc order of Grades

	SELECT E.*,D.LOC,G.GRADE
	FROM EMP E join salary_grade g on e.sal between g.min_sal AND g.max_sal
	JOIN DEPT D ON E.DEPTNO=D.DEPTNO
	WHERE (G.GRADE BETWEEN 2 AND 4)
	AND ( D.DNAME NOT LIKE 'OP%' AND D.DNAME NOT LIKE '%S' ) AND (JOB LIKE '%A%') 
	AND YEAR(HIREDATE) = 1981 AND MONTH(HIREDATE) NOT IN (3,9)
	AND SAL NOT LIKE '%00'
	ORDER BY G.GRADE
	
    47. List the details of the Depts along with Empno, Ename or without the emps

	SELECT d.DNAME,D.LOC,D.DEPTNO,e.Empno,e.Ename
	FROM emp as e join dept d on e.deptno=d.deptno

    48. List the details of the emps whose Salaries more than the employee BLAKE.

	SELECT * FROM emp where sal > ( SELECT SAL FROM emp where ENAME='BLAKE')

    49. List the emps whose Jobs are same as ALLEN.

	SELECT * FROM emp where JOB = ( SELECT JOB FROM emp where ENAME='ALLEN')

    50. List the emps who are senior to King.

	SELECT * FROM emp where EMPNO = ( SELECT MGR FROM emp where ENAME='KING')

    51. List the Emps who are senior to their own MGRS.

	SELECT * FROM emp e WHERE hiredate < (SELECT hiredate FROM emp m WHERE m.Empno = e.Mgr)

    52. List the Emps of Deptno 20 whose Jobs are same as Deptno 10.

	SELECT * FROM emp where DEPTNO =20 AND JOB IN ( SELECT JOB FROM emp where DEPTNO=10 )

    53. List the Emps whose Sal is same as FORD or SMITH in desc order of Sal.

	SELECT * FROM emp where SAL IN ( SELECT SAL FROM emp where ENAME IN ('FORD','SMITH' ))
	ORDER BY SAL DESC

    54. List the emps Whose Jobs are same as MILLER or Sal is more than ALLEN.

	SELECT * FROM emp where JOB IN ( SELECT JOB FROM emp where ENAME='MILLER' )
		OR SAL > ( SELECT SAL FROM EMP WHERE ENAME='ALLEN')

    55. List the Emps whose Sal is > the total remuneration of the SALESMAN.

	SELECT * FROM emp where SAL > ( SELECT MAX(SAL+COALESCE(COMM,0)) FROM emp where JOB='SALESMAN' )
	
    56. List the emps who are senior to BLAKE working at CHICAGO & BOSTON.

	

    57. List the Emps of Grade 3,4 belongs to the dept ACCOUNTING and RESEARCH 
		whose Sal is more than ALLEN and exp more than SMITH in the asc order of EXP.

	SELECT E.*,D.DNAME,G.GRADE
	FROM EMP E join salary_grade g on e.sal between g.min_sal AND g.max_sal
	JOIN DEPT D ON E.DEPTNO=D.DEPTNO
	WHERE G.GRADE IN (3,4) AND D.DNAME IN ('ACCOUNTING','RESEARCH')
	AND E.SAL > ( SELECT SAL FROM EMP WHERE ENAME='ALLEN')
	AND HIREDATE > ( SELECT HIREDATE AS EXPR FROM EMP WHERE ENAME='SMITH' )
	ORDER BY HIREDATE

    58. List the emps whose jobs same as SMITH or ALLEN.

	SELECT * FROM emp where JOB IN ( SELECT JOB FROM emp where ENAME IN ('ALLEN','SMITH' ) )

    59. Write a Query to display the details of emps whose Sal is same as of
    	a) ¾ Sal of any Mgr of EMP table .

		SELECT * FROM emp WHERE SAL IN ( SELECT (m.sal*0.75) FROM emp m WHERE JOB='MANAGER' )

   	 b) The sal of any person with exp of 37 years belongs to the sales dept of emp table.



     c) Any grade 2 and 3 employee working from sales dept or operations dept joined in89.


    60. Any jobs of deptno 10 those that are not found in deptno 20.

	SELECT * FROM EMP WHERE DEPTNO=10 AND JOB NOT IN ( SELECT JOB FROM EMP WHERE DEPTNO=20 )

    61. Find the highest sal of EMP table.

	SELECT MAX(SAL) FROM emp

    62. Find details of highest paid employee.

	SELECT * FROM EMP WHERE SAL = ( SELECT MAX(SAL) FROM EMP )

    63. Find the highest paid employee of sales department.

		SELECT * FROM EMP 
		WHERE SAL=(SELECT MAX (SAL) FROM EMP WHERE DEPTNO = ( SELECT DEPTNO FROM DEPT WHERE DNAME='SALES' ))

    64. List the most recently hired emp of grade3 belongs to location CHICAGO.

	SELECT *,G.GRADE FROM EMP e join salary_grade g on e.sal BETWEEN g.min_sal AND g.max_sal
	join DEPT d on e.deptno=d.deptno
	WHERE D.LOC IN ('CHICAGO') AND G.GRADE=3
	ORDER BY HIREDATE

    65. List the employees who are senior to most recently hired employee working under king.

	SELECT * FROM EMP WHERE HIREDATE > ( SELECT HIREDATE FROM EMP WHERE ENAME='KING')
	ORDER BY HIREDATE

    66. List the details of the employee belongs to new york with grade 3 to 5 except ‘PRESIDENT’ whose sal> 
		the highest paid employee of Chicago in a group where there is manager and salesman not working under king



    67. List the details of the senior employee belongs to 1981.

	SELECT * FROM EMP WHERE YEAR(HIREDATE) = 1981
	ORDER BY HIREDATE

    68. List the employees who joined in 1981 with the job same as the most senior person of the year 1981.

	SELECT * FROM EMP WHERE YEAR(HIREDATE) = 1981
	AND JOB = ( SELECT JOB FROM EMP WHERE HIREDATE = ( SELECT MIN(HIREDATE) FROM EMP WHERE YEAR(HIREDATE) = 1981 ) )
	ORDER BY HIREDATE

    69. List the most senior employees working under the king and grade is more than 3.

	   SELECT E.*,G.GRADE FROM EMP e JOIN salary_grade g ON e.sal BETWEEN g.min_sal AND g.max_sal
	   WHERE ENAME != 'KING' AND GRADE>3
	   ORDER BY HIREDATE

    70. Find the total sal given to the MGR.

	SELECT SUM(SAL) AS Total_Sal FROM EMP WHERE JOB='MANAGER'
	
    71. Find the total annual sal of emp table to distribute job wise in the year 81.

	select *,( sal*12 ) as Ann_Sal from emp where year(hiredate)=1981

    72. Display total sal employee belonging to grade 3.

	   SELECT SUM(E.SAL) FROM EMP e JOIN salary_grade g ON e.sal BETWEEN g.min_sal AND g.max_sal
	   WHERE G.GRADE = 3

    73. Display the average salaries of all the clerks.

	SELECT AVG(SAL) AS AVG_SAL FROM EMP WHERE JOB='CLERK'

    74. List the employee in dept 20 whose sal is > the average sal 0f dept 10 emps.

	SELECT * FROM EMP WHERE DEPTNO=20 AND SAL > ( SELECT AVG(SAL) FROM EMP WHERE DEPTNO=10 )

    75. Display the number of employee for each job group deptno wise.

	SELECT JOB,DEPTNO,COUNT(*) AS [COUNT] FROM EMP GROUP BY JOB,DEPTNO

    76. List the manager no and the number of employees working for those mgrs in the ascending  Mgr no.

	
    77. List the department,details where at least two emps are working.

	  SELECT d.* FROM DEPT d 
	  inner join ( SELECT DEPTNO,COUNT(*) COUNTA FROM EMP GROUP BY DEPTNO ) A
	  on d.deptno=a.deptno where counta>2

    78. Display the Grade, Number of emps, and max sal of each grade.

	SELECT G.GRADE,COUNT(*) No_Of_Emp,MAX(E.SAL) Max_Sal
	FROM EMP e JOIN salary_grade g ON e.sal BETWEEN g.min_sal AND g.max_sal
	GROUP BY G.GRADE

    79. Display dname, grade, No. of emps where at least two emps are clerks.

	SELECT D.DNAME,G.GRADE,COUNT(*) No_Of_Emp
	FROM EMP e JOIN salary_grade g ON e.sal BETWEEN g.min_sal AND g.max_sal
	JOIN DEPT d on d.deptno=e.deptno
	GROUP BY D.DNAME,G.GRADE
	HAVING COUNT('CLERK') >2

    80. List the details of the department where maximum number of emps are working.

	SELECT d.* FROM DEPT d 
	  inner join ( SELECT TOP 1 DEPTNO,COUNT(*) [COUNT] FROM EMP GROUP BY DEPTNO ORDER BY COUNT(*) DESC ) A
	  on d.deptno=a.deptno

    81. Display the emps whose manager name is jones.

	SELECT * FROM EMP WHERE MGR = ( select EMPNO from emp where ENAME='JONES' )

    82. List the employees whose salary is more than 3000 after giving 20% increment.

	SELECT *,SAL + ( SAL*0.02 ) AS INCR FROM EMP 
	WHERE (SAL + ( SAL*0.02 )) > 3000

    83. List the emps with dept names.

	SELECT E.*,D.DNAME FROM EMP E JOIN DEPT D ON E.DEPTNO=D.DEPTNO

    84. List the emps who are not working in sales dept.

	SELECT E.*,D.DNAME FROM EMP E JOIN DEPT D ON E.DEPTNO=D.DEPTNO
	WHERE D.DNAME !='SALES'

    85. List the emps name ,dept, sal and comm. For those whose salary is between 2000 and 5000 while loc is Chicago.

	SELECT E.ENAME,E.DEPTNO,E.SAL,E.COMM,D.LOC FROM EMP E JOIN DEPT D ON E.DEPTNO=D.DEPTNO
	WHERE ( E.SAL BETWEEN 2000 AND 5000 ) AND D.LOC='CHICAGO'

    86. List the emps whose sal is greater than his managers salary

	SELECT M.* FROM EMP E JOIN EMP M ON E.MGR = M.EMPNO
	WHERE E.SAL > M.SAL

    87. List the grade, EMP name for the deptno 10 or deptno 30 but sal grade is not 4 while they joined the 
		company before < ’31-dec-82’.
	
	SELECT G.GRADE,E.ENAME
	FROM EMP e JOIN salary_grade g ON e.sal BETWEEN g.min_sal AND g.max_sal
	WHERE E.DEPTNO IN (10,30) AND G.GRADE !=4
	AND HIREDATE <= '31-dec-1982' 
	
	88. List the name ,job, dname, location for those who are working as MGRS.

	SELECT ENAME,JOB,DNAME,LOC FROM EMP E JOIN DEPT D ON E.DEPTNO = D.DEPTNO
	WHERE E.JOB = 'MANAGER'

   90. List the emps whose mgr name is jones and also list their manager name.

   SELECT *,
	( SELECT ENAME FROM EMP WHERE EMPNO= ( SELECT MGR FROM EMP WHERE ENAME='JONES' ) ) AS Jones_Manager
   FROM EMP WHERE MGR = ( SELECT EMPNO FROM EMP WHERE ENAME='JONES' )

   91. List the name and salary of ford if his salary is equal to hisal of his grade.
   
	SELECT E.ENAME,G.GRADE,E.SAL,g.max_sal
	FROM EMP e JOIN salary_grade g ON e.sal BETWEEN g.min_sal AND g.max_sal
	WHERE ENAME='FORD' AND E.SAL = G.max_sal

   92. List the name, job, dname ,sal, grade dept wise

    SELECT E.ENAME,E.JOB,D.DNAME,E.SAL,G.GRADE
	FROM EMP e JOIN salary_grade g ON e.sal BETWEEN g.min_sal AND g.max_sal
	JOIN DEPT D ON D.DEPTNO = E.DEPTNO
	ORDER BY E.DEPTNO

   93. List the emp name, job, sal, grade and dname except clerks and sort on the basis of highest sal.

	SELECT E.ENAME,E.JOB,D.DNAME,E.SAL,G.GRADE
	FROM EMP e JOIN salary_grade g ON e.sal BETWEEN g.min_sal AND g.max_sal
	JOIN DEPT D ON D.DEPTNO = E.DEPTNO
	WHERE E.JOB !='CLERKS'
	ORDER BY E.SAL DESC

   94. List the emp names, job who are without manager.

   SELECT ENAME,JOB FROM emp WHERE mgr is null

   95. List the names of the emps who are getting the highest sal dept wise.

   	 SELECT ENAME,DEPTNO,SAL FROM EMP  WHERE SAL IN (SELECT MAX(SAL) H_SAL FROM EMP E GROUP BY DEPTNO )
	 ORDER BY SAL DESC
	
   96. List the emps whose sal is equal to the average of max and minimum
	
	SELECT * FROM EMP WHERE SAL = ( SELECT (MIN(SAL)+MAX(SAL))/2 FROM EMP )
	
   97. List the no. of emps in each department where the no. is more than 3.

   SELECT DEPTNO,COUNT(*) [COUNT] FROM EMP GROUP BY DEPTNO HAVING COUNT(*) > 3

   98. List the names of depts. Where atleast 3 are working in that department.

    SELECT D.DNAME,E.DEPTNO FROM DEPT D 
	JOIN ( SELECT DEPTNO FROM EMP GROUP BY DEPTNO HAVING COUNT(*) >= 3 ) E
	ON D.DEPTNO = E.DEPTNO
	
   99. List the managers whose sal is more than his employees avg salary.

   -- find all the emps under mgr
	select a.* from emp m join
	( select m.empno as mgrno, avg(e.sal) as avg_sal
   from emp e join emp m on e.mgr = m.empno
   group by m.empno ) a
   on m.mgr=a.mgrno where m.sal > a.avg_sal
   
   --solution 2

   select distinct m.empno as mgrno,m.ename, AVG(e.sal) OVER(partition by m.empno order by m.empno ) as avg_sal
   from emp e join emp m on e.mgr = m.empno
  

  100. List the name,salary,comm. For those employees whose net pay is greater than or
	equal to any other employee salary of the company.

	select ename,sal,ISNULL(comm,0) as comm,(sal+ISNULL(comm,0)) as Net_Pay
	FROM emp
	where (sal+ISNULL(comm,0)) >= ANY ( select sal from emp)
	order by empno
