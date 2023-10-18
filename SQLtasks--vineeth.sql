
-- Update the sal by 10% for the employees whose comm is null
select * from emp
UPDATE EMP SET SAL=SAL+(SAL*10/100) where COMM IS NULL ;

-- Update the sal to 1000 for the emp whose manager empid is not equal to 7566.

UPDATE EMP SET SAL=1000 WHERE MGR != 7566

-- Display the names of employees whose name starts with alphabet S. 

SELECT ENAME FROM EMP WHERE ENAME LIKE '[S]%'

-- Display the names of employees whose names have second alphabet A in their names.

SELECT ENAME FROM EMP WHERE ENAME LIKE '_A%'

-- Display the sum of sal of all job types

SELECT JOB,SUM(SAL) SALARY_SUM FROM EMP GROUP BY JOB

-- Display the sum sal of all deptpno types
SELECT DEPTNO,SUM(SAL) DEPT_SUM FROM EMP GROUP BY DEPTNO

-- Display the emp records , whose comm is more than 20% of their salry.
SELECT * FROM EMP WHERE comm > (SAL * 0.2)

--Display the sum of sal of all employes under each MGR(manager)
SELECT MGR AS Manager,SUM(SAL) [Sum] FROM EMP GROUP BY MGR

-- Get the deptno whose total sum of sal is highest
select top 1 dept,Salary from (select deptno as dept ,sum(sal) as salary from emp group by deptno ) as tt order by salary  desc

-- Display the records from highest to lowest order of mgr and with in that lowest to highest order of empno.
--And there comm should be not null.
select * from emp WHERE COMM IS NOT NULL order by mgr,empno

-- Get the emp information whose loc is "Dallas"
select e.*, d.DName, d.loc as [Location] from emp e inner join dept d on e.deptno=d.deptno where d.loc='Dallas'

-- Get the Dept numbers with no employees.
select ENAME,deptno from emp where DEPTNO IS NULL

--Get the emp information with highest salary.
select * from emp where sal = ( select max(sal) from emp )

--Get the highest salaried emp information under each department.
select deptno,MAX(SAL) Max_Salary FROM EMP group by deptno

--Get the emp information under each manager.

select sup.job SuperiorRole, sup.empno SupriorID, sup.ename SuperiorName, sub.empno SubOrdinateNo,
sub.ename SubordianateName,sub.job SubordinateJob
from emp SUB INNER JOIN EMP SUP on SUB.mgr = SUP.empno order by sup.empno

--Get the sum sal of all employees under each manager.
SELECT MGR Manager, sum(sal) Salary_sum from emp group by mgr
SELECT SUB.MGR Manager, SUM(sub.SAL) SalarySum FROM emp SUB INNER JOIN EMP SUP on SUB.mgr = SUP.empno group by SUB.MGR

--Get the emp information whose manager is in different department compared their emp department. -->
 

--Display employee number and total salary for each employee.
SELECT EMPNO,SAL SALARY FROM EMP

--Display employee name and annual salary for all employees.
SELECT ENAME, ( SAL * 12 ) Annual_Sal from emp

--Display the names of all employees working as clerks and drawing a salary more than 3000.
select ename,job from emp where job='CLERK' AND SAL > 3000

--Display employee number and names for employees who earn commission.
SELECT EMPNO,ENAME,COMM FROM EMP WHERE COMM IS NOT NULL AND COMM !=0

--Display the names of employees who are working as clerk, salesman or analyst and drawing a salary more than 3000.
SELECT ENAME,JOB,SAL FROM EMP WHERE JOB IN ('ANALYST','CLERK','SALESMAN') AND SAL > 3000

-- Display the names of employees who are working in the company for the past 5 years.	 
SELECT ENAME,HIREDATE FROM EMP WHERE HIREDATE > DATEADD(YEAR,-5,GETDATE())

--Display the list of employees who have joined the company before 30th June 90 or after 31st dec 90.
select * from emp where hiredate < '1990-06-30' OR HIREDATE > '1990-12-31'
SELECT * FROM EMP
--Display the names of employees working in department number 10 or 20 or 40 or employees working as clerks, salesman or analyst.
SELECT ENAME, DEPTNO FROM EMP WHERE DEPTNO IN (10,20,40) OR JOB IN('ANALYST','CLERK','SALESMAN')

--Display the names of employees who are not working as managers.
SELECT ENAME,JOB FROM EMP WHERE JOB != 'MANAGER'

--Display the names of employees who are not working as SALESMAN or CLERK or ANALYST.
SELECT ENAME,JOB FROM EMP WHERE JOB NOT IN ('ANALYST','CLERK','SALESMAN')

--Select the employees whose sal is greater than their department avg sal
SELECT ENAME, SAL, DEPTNO FROM EMP E WHERE SAL > ( SELECT AVG(SAL) FROM EMP F WHERE F.DEPTNO = E.DEPTNO GROUP BY DEPTNO )

create table cricket(country varchar(20),id int)
alter table cricket add id int;
insert into cricket values('India',1),('Sri Lanka',2), ('New Zealand',3), ('England',4), ('USA',5)
select * from cricket