--•	Converting columns into rows in SQL-- PIVOT
-- SELECT * FROM TASK28

SELECT CONCAT([USER_NUM],upper(UNAME)) PASSWORDS FROM
(select UNAME,ROW_NUMBER() over(order by UNAME) as row1 from task28) R1
INNER JOIN
(select [USER_NUM],ROW_NUMBER() over(order by [USER_NUM]) as row2 from task28) R2
on (R1.row1 = R2.row2)

--alter table task28 RENAME COLUMN UNUM TO USER_NUM

--EXEC SP_RENAME '[task28].[UNUM]','[USER_NUM]', 'COLUMN';

-- UNPIVOT
CREATE TABLE sales (jan int,feb int,march int, april int,may int,YEARS INT)
insert into sales (jan,feb,march,april,may,years) values (10,20,30,40,50,2020)
insert into sales (jan,feb,march,april,may,years) values (105,205,305,405,505,2021)
insert into sales (jan,feb,march,april,may,years) values (100,200,300,400,500,2022)
SELECT * FROM SALES

SELECT years,monthnames,salesamount FROM sales UNPIVOT (salesamount FOR monthnames in (jan,feb,march,april,may))s
--DELETE FROM SALES


--alter table dept add sal int

--select * from dept
--CREATE TABLE [tgt_emp2] (
--   [EMPNO] integer NOT NULL,
--   [ENAME] varchar(20) NOT NULL,
--   [JOB] varchar(20) NOT NULL,
--   [MGR] integer,
--   [HIREDATE] date NOT NULL,
--   [SAL] integer NOT NULL,
--   [COMM] integer,
--   [DEPTNO] integer NOT NULL,
--   );
--GO

-- update emp set sal=5000 where empno=7934
--select * from tgt_emp_two

--task-1: empname ends with 'R' and sal > 2000
select * from emp where ename like '%R' AND SAL>2000

--task2: COMM IS NOT NULL
SELECT * FROM emp where COMM IS NOT NULL

--TASK3: get emp information whose SAL>MANAGERS
--solution 1 --SELF JOIN
SELECT *
FROM emp AS M , emp AS E 
WHERE M.empno = E.mgr
AND E.sal> M.sal;

--solution 2
SELECT E.* FROM EMP AS e JOIN EMP AS m ON m.empno=e.mgr where e.sal>m.sal

--SELECT * FROM EMP
--select * from tgt_emp_two
-- SELECT * FROM EMP_LEFT_JOIN

-- task4 : deptno <= 10 -- group 1
			-- deptno <=20 -- group 2
			-- deptno <=30 -- group 3
			-- default group
SELECT * FROM tgt_emp_two
SELECT * FROM tgt_emp2


-- if salary < 1000 --increment is 10% ,
-- sal between 1000 and 1500 --inc is 5%, 
--sal between 1500 to 2000 --inc is 3%,
--sal 2000 to 3000 --inc is 2%,
--sal above 3000 --inc is 1%.

SELECT
EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,
CASE
WHEN SAL<1000 THEN SAL+SAL*0.1
WHEN SAL>1000 AND SAL<1500 THEN SAL+SAL*0.05
WHEN SAL>1500 AND SAL<200 THEN SAL+SAL*0.03
WHEN SAL>200 AND SAL<3000 THEN SAL+SAL*0.02
ELSE SAL+SAL*0.01
END AS NEWSALARY,
COMM,DEPTNO
FROM EMP


--SELECT * FROM TGT_EMP_ONE
--select * from tgt_emp_two
--select * from tgt_emp_three

--SELECT  * INTO [EMPS_STRUCTURE2] FROM EMP where 1=0
--SELECT TOP 1 * INTO EMP_STRUCTURE2 FROM EMP

-- INSERT top(10)percent INTO TargetTable SELECT COLUMNS FROM TABLE1 WHERE CONDITION;

			ALTER TABLE TGT_EMP_ONE ADD SNO INT IDENTITY(1,1)
			ALTER TABLE TGT_EMP_ONE DROP COLUMN SNO

			SELECT * FROM EMP_STRUCTURE

-- target table for sequence generator transformation
SELECT * FROM EMP_SEQUENCE

--Source qualifier transformation
CREATE TABLE [EMP_SeQ](
 EMPNO int NOT NULL,
 ENAME VARCHAR(10),
 JOB VARCHAR(9),
 DEPTNO INT,
 MGR int,
 RESULT INT,
);
-- For Aggregator transformation
select * from EMP_SeQ

-- use inner join and left join together
SELECT LOC AS LOCATION,count(*) FROM EMP E LEFT JOIN DEPT D ON E.DEPTNO=D.DEPTNO group by d.loc

A,1
B,2
C,3
D,4
E,5
--output
A,1
B,12
C,"123"
D,"1234"
E,1,2,3,4,5
select * from may9
select * from may9_TGT


--CREATE TABLE MAY9 (ALPHABET VARCHAR(10),NUMS INT)
--INSERT INTO MAY9 VALUES('A',1),('B',2),('C',3),('D',4),('E',5)
--ALTER TABLE MAY9_TGT RENAME COLUMN COL1 TO ALPHABET,COL2 TO NUMS
--ALTER TABLE tableName RENAME COLUMN oldColumn TO NewColumn;
--EXEC SP_RENAME 'MAY9_TGT.COL2','NUMS','COLUMN'
--ALTER TABLE MAY9_TGT ALTER COLUMN NUMS VARCHAR(10)
SELECT * FROM MAY9_tgt


				CREATE TABLE [EMP_left_join](
				 SNO int,
				 EMPNO int NOT NULL,
				 ENAME VARCHAR(10),
				 JOB VARCHAR(9),
				 MGR int,
				 HIREDATE DATE,
				 SAL int,
				 COMM int,
				 DEPTNO int,
				DLOC varchar(20)
				);

-- inner and left join use together
dept d,emp e1, emp e2
	f1,		bar b1 ,baz b2	
SELECT *
FROM dept d
LEFT JOIN (emp e1
  INNER JOIN emp e2 ON b2.d = .baz_id
) ON
  b1.id = f1.bar_id

  SELECT * FROM EMP_SEQ
  -- rank function
  select * from tgt_emp_rank

  -- get all records without selecting any group
  select * from tgt_emp_two
  select * from emp_union

  -- GET first record insted of last record 
 SELECT * FROM TGT_EMP_three
 SELECT top 1 * FROM EMP

 --INNER JOIN 
 select * from tgt_emp_three
 CREATE TABLE [EMP_DOUBLE](				 
				 EMPNO int NOT NULL,
				 ENAME VARCHAR(10),
				 JOB VARCHAR(9),
				 MGR int,
				 HIREDATE DATE,
				 SAL int,
				 COMM int,
				 DEPTNO int,
				  EMPNO1 int NOT NULL,
				 ENAME1 VARCHAR(10),
				 JOB1 VARCHAR(9),
				 MGR1 int,
				 HIREDATE1 DATE,
				 SAL1 int,
				 COMM1 int,
				 DEPTNO1 int,
				);
				SELECT * FROM EMP_DOUBLE

--

ALTER TABLE EMP_LEFT_JOIN ADD DNAME VARCHAR(20)
SELECT TOP 0 * INTO emp_joins FROM EMP_LEFT_JOIN 
select * from dept
select * from emp_JOINS
select * from emp_

SELECT * FROM DEPT,FULL_NAMES WHERE DEPT.DEPTNO=ID
SELECT * FROM FULL_NAMES,dept
ALTER TABLE FULL_NAMES ADD NUM INT IDENTITY(6,0)
ALTER TABLE FULL_NAMES DROP COLUMN NUM
--INSERT INTO FULL_NAMES VALUES(),

SELECT RANK() OVER(PARTITION BY FULL_NAME ORDER BY FULL_NAME)+5 AS SNO,* FROM FULL_NAMES

--SELECT SUBSTRING('RAVIND',CHARINDEX('A','ARAVIND'),)
--SELECT LEN('ARAVIND')

-- Find no.of 'A' Occurances in a string.
SELECT ENAME,LEN(ENAME)-LEN(REPLACE(ENAME,'A','')) AS NO_0F_A,JOB,
LEN(JOB)-LEN(REPLACE(JOB,'A','')) AS NO_0F_A FROM EMP

--CREATE table dept_tgt (deptno int,DNAME INT,LOC VARCHAR(20),SNO INT)
SELECT * FROM NO_OF_A

-- print 0 where MGR IS EVEN, ELSE 1
SELECT 1,* FROM EMP
SELECT
CASE
WHEN MGR%2=0 THEN 0
ELSE 1
END AS NUM,MGR
FROM EMP

--JOIN TWO TABLES WITHOUT HAVING COMMON COLUMN
SELECT * FROM EMP,DEPT
SELECT * FROM DEPT
SELECT * FROM DEPT D,EMP E WHERE D.DEPTNO > E.DEPTNO

select * from may9

--Task1: Practice on Lookup Transformation
--Task2: Need to implement unconnected lookup
--Task3: Lookup Transformation without order by class
--Task4: How many caches available in Lookup

SELECT * FROM EMP
--UPDATE EMP SET COMM=200 WHERE EMPNO=7369
--UPDATE EMP SET COMM=100 WHERE EMPNO=7902
--UPDATE EMP SET COMM=150 WHERE EMPNO=7876
SELECT  * FROM TGT_EMP_TWO
SELECT  * FROM TGT_EMP_Three
--UPDATE TGT_EMP_TWO SET SAL=0

select * from dept
alter table dept add sal int
SELECT * FROM EMP order by deptno
--SELECT * FROM EMP_TCL ORDER BY deptno

--READ COMMITTED

--alter table may20_tgt add GKID INT, GCID INT
--alter table may20 alter column mymonth varchar(100)
--insert into may20 values(2019,'jan,feb,apr'),(2021,'jan,feb,mar,apr,may'),(2020,'jan,feb,mar,apr,may,jun'),(2019,'jan,feb,apr')
--2022 jan,feb,mar,apr
--2021 jan,feb,mar,apr,may
--2020 jan,feb,mar,apr,may,june
--2019 jan,feb,apr

select * from may20
select * from may20_tgt
select * from emp_sq

--jan,feb,mar,apr
--jan,feb,mar,apr,may
--jan,feb,mar,apr,may,jun

--SELECT SUBSTRING(MYMONTH,CHARINDEX(',',MYMONTH,CHARINDEX(',',MYMONTH)+3)+1,3) FROM MAY20

--truncate table may20_tgt
--CREATE table may20_WAY2_TGT (MYyear int,MYmonth varchar(50))
--create table may20_tgt(myyear int,mymonth varchar(50))
--insert into may20_WAY2 values (2022,'jan')
--insert into may20_WAY2 values (2022,'feb')
--insert into may20_WAY2 values (2022,'march')
--insert into may20_WAY2 values (2022,'april')
--insert into may20_WAY2 values (2021,'jan')
--insert into may20_WAY2 values (2021,'feb')
--insert into may20_WAY2 values (2021,'march')
--insert into may20_WAY2 values (2021,'april')
--insert into may20_WAY2 values (2021,'may')
--insert into may20_WAY2 values (2020,'jan')
--insert into may20_WAY2 values (2020,'feb')
--insert into may20_WAY2 values (2020,'march')
--insert into may20_WAY2 values (2020,'april')
--insert into may20_WAY2 values (2020,'may')
--insert into may20_WAY2 values (2020,'june')
--insert into may20_WAY2 values (2019,'jan')
--insert into may20_WAY2 values (2019,'feb')
--insert into may20_WAY2 values (2019,'march')

select * from may20_tgt

select * from may20_WAY2_TGT
select COUNT(*) from may20_WAY2 group by MYMONTH

--drop table sales_source;
--drop table sales_target;
--CREATE TABLE sales_source (
--  store_name varchar(20), 
--  sales_quarter1 int,
--  sales_quarter2 int,
--  sales_quarter3 int,
--  sales_quarter4 int
--);
--create table sales_target ( store_name varchar(20), sales int,myquarter int);
--insert into sales_source values ( 'DELHI',150, 240, 450, 100);
--insert into sales_source values ( 'MUMBAI',100, 500, 350, 340);

select * from sales_source
select * from sales_target

USE ITCRATS
GO

CREATE PROCEDURE getManagerId(
@EMPNO int,@managerId int OUTPUT ) As
BEGIN
 SELECT @managerId=mgr FROM EMP
 WHERE empno=@empno
END

declare @managerId int
EXEC getManagerId @empno=7902, @MANAGERID OUTPUT
print @managerid
---------------------------

CREATE PROCEDURE getMinSal
@DEPTNO int,
@minsal int OUTPUT
As
BEGIN
 SELECT @minsal=Min(SAL) FROM EMP
 WHERE DEPTNO=@DEPTNO
END


DECLARE @MINSAL INT
EXEC GETMINSAL @DEPTNO=30, @MINSAL OUTPUT
print @minsal


select AVG(SAL) from emp WHERE DEPTNO=30

ALTER PROC GETAVGSAL(@deptno int, @AVGSAL INT OUTPUT)
AS 
BEGIN
SELECT @AVGSAL=AVG(SAL) 
FROM EMP
WHERE DEPTNO=@DEPTNO
END

DECLARE @AVGSAL1 INT
EXEC GETAVGSAL @deptno=30,@AVGSAL=@AVGSAL1 OUTPUT
PRINT @AVGSAL1

select * from tgt_emp_two order by deptno

select count(6) from emp
select COUNT(*) from emp where deptno=10
SELECT @@ROWCOUNT

--- VARIABLES AND PARAMETERS ---
SELECT * FROM EMP where deptno=20
SELECT * FROM TGT_EMP_TWO
SELECT * FROM TGT_EMP_Three

CREATE DATABASE TEST

CREATE TABLE sales_source (
  store_name varchar(20), 
  sales_quarter1 int,
  sales_quarter2 int,
  sales_quarter3 int,
  sales_quarter4 int
);
create table sales_target ( store_name varchar(20), sales int,myquarter int);
insert into sales_source values ( 'DELHI',150, 240, 450, 100);
insert into sales_source values ( 'MUMBAI',100, 500, 350, 340);

--CREATE DATABASE ITCRATS
UPDATE EMP SET SAL=7500 WHERE EMPNO=7369
SELECT * FROM EMP
SELECT * FROM TGT_EMP_TWO

----SCD TYPE3 --------------
--CREATE TABLE SCD_TYPE3_TGT(SNO int PRIMARY KEY,EMPNO int,ENAME VARCHAR(10),JOB VARCHAR(9),MGR int,
--HIREDATE DATE, SAL int,COMM int,DEPTNO int,EFF_DATE DATE,END_DATE DATE);

SELECT SCD_TYPE3_TGT.SNO as SNO, SCD_TYPE3_TGT.ENAME as ENAME, SCD_TYPE3_TGT.JOB as JOB, SCD_TYPE3_TGT.MGR as MGR, SCD_TYPE3_TGT.HIREDATE as HIREDATE, SCD_TYPE3_TGT.SAL as SAL, SCD_TYPE3_TGT.COMM as COMM, SCD_TYPE3_TGT.DEPTNO as DEPTNO, SCD_TYPE3_TGT.EFF_DATE as EFF_DATE, SCD_TYPE3_TGT.END_DATE as END_DATE, SCD_TYPE3_TGT.EMPNO as EMPNO FROM SCD_TYPE3_TGT
where SCD_TYPE3_TGT.END_DATE=TO_DATE('06/01/2022','MM/DD/YYYY')