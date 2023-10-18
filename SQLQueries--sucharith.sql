--.Get the experience of all employees.

SELECT CONVERT(VARCHAR(20), DATEDIFF(MONTH, HIREDATE,GETDATE())/12) +' Years, '+
CONVERT(VARCHAR(30),DATEDIFF(MONTH,HIREDATE, GETDATE()) % 12) +' Months' AS EXPERIENCE
FROM EMP

--.get the total no of orders placed from each country.
SELECT * FROM INFORMATION_SCHEMA.TABLES
SELECT* FROM [CUSTOMER]
SELECT * FROM [ORDER]
SELECT C.Country, COUNT(O.ID) [No.Of Orders] FROM CUSTOMER C JOIN [ORDER] O ON C.ID = O.ID GROUP BY C.COUNTRY


select c.country, d.country,c.id, d.id from cricket c join cricket d on c.id > d.id

create table underscores(id int Identity(1,1), uNames varchar(20))
insert into underscores values ('ABCD_AL5'),('ABCD_AL6'),('ABCD_AL7'),('ABCD_AL8'),('ABCDAL5'),('ABCDAL6'),('ABCDAL7'),('ABCDAL8')

select uNames from underscores where uNames LIKE 'LOLL%\_%[5-8]' ESCAPE '\'
select uNames from underscores where uNames LIKE '%\_%' ESCAPE '\'
select unames from underscores

CREATE TABLE TELEPHONE ( ID INT IDENTITY(1,1), PHNO varchar(10) )
INSERT INTO TELEPHONE VALUES(1),(1),(7730061), (761615),(71615),(75)
select * from telephone
alter table telephone alter column phno varchar(10)

SELECT 
CASE
WHEN len(Phno)=NULL then concat('zzzzzzzzzz',phno)
WHEN len(Phno) = 1 then concat('zzzzzzzzz',phno)
WHEN len(Phno) = 2 then concat('zzzzzzzz',phno)
WHEN len(Phno) = 3 then concat('zzzzzzz',phno)
WHEN len(Phno) = 4 then concat('zzzzzz',phno)
WHEN len(Phno) = 5 then concat('zzzzz',phno)
WHEN len(Phno) = 6 then concat('zzzz',phno)
WHEN len(Phno) = 7 then concat('zzz',phno)
WHEN len(Phno) = 8 then concat('zz',phno)
WHEN len(Phno) = 9 then concat('z',phno)
ELSE PHNO
END AS phno
FROM telephone


-- INSERT INTO SELECT

CREATE TABLE sales.addresses (
    address_id INT IDENTITY PRIMARY KEY,
    street VARCHAR (255) NOT NULL,
    city VARCHAR (50),
    [state] VARCHAR (25),
    zip_code VARCHAR (5)
);

select * from information_schema.tables

select * from sales.customers
select * from sales.addresses
TRUNCATE TABLE sales.addresses

SET IDENTITY_INSERT itcrats.sales.addresses ON

INSERT TOP(75) PERCENT INTO SALES.ADDRESSES(address_id,street,city,[state],zip_code)
SELECT customer_id,street,city,[state],zip_code from sales.customers
where city IN ('Niagara Falls','Jamaica','Sunnyside','Forest Hills','New York','Santa Clara')

SELECT * FROM TELEPHONE

SELECT CONCAT(REPLICATE('Z',10-LEN(PHNO)),PHNO) PhoneNum  FROM TELEPHONE


select RIGHT(REPLICATE('Z', 10) + phno,10) FROM TELEPHONE;

CREATE TABLE fullname (id INT IDENTITY(1,1),username varchar(100));

INSERT INTO fullname values('Sucharith***cheruku******malli'), ('vinay**reddy******gadikota')

SELECT * FROM fullname

SELECT USERNAME FROM FULLNAME WHERE CHARINDEX('*',username) > 2

SELECT USERNAME FROM FULLNAME WHERE USERNAME LIKE '%*%'

SELECT REPLACE(USERNAME, '******','**') FROM FULLNAME

SELECT HIREDATE,EMPNO FROM EMP WHERE HIREDATE > DATEADD(DATE,-5,GETDATE())
SELECT * from emp where DATEADD(DATE, hiredate, SYSDATETIME()) <= 5;
SELECT * FROM EMP WHERE HIREDATE < GETDATE()

SELECT ENAME,HIREDATE FROM EMP WHERE HIREDATE > DATEADD(DAYOFYEAR,-5, CONVERT(date, GETDate(),111))

select CONVERT(date, GETDate(),111)
select * from emp where HIREDATE < '30 june 81' or hiredate > '31 dec 81';
SELselect * from emp
SELECT * FROM EMP_SeQECT * from emp where DATEDIFF(year, hiredate, SYSDATETIME()) <= 5;
UPDATE EMP SET HIREDATE='2022-04-26' WHERE EMPNO IN(7521)

SELECT * FROM EMP WHERE  DATEDIFF( DAYOFYEAR, HIREDATE,CONVERT( date, GETDate(),111)) < ( 5 * 365 )

--SELECT DATEDIFF( DAY, '2022-04-26', CONVERT( date, GETDate(), 111))

SELECT CONVERT(dateTIME, GETDate(),111) - CONVERT(dateTIME, HIREDATE,111) FROM EMP

SELECT datepart(dayofyear, getdate())
SELECT * FROM EMP WHERE datediff(mi, '2022-01-22' , '2010-01-22')

-- STRING_SPLIT()

SELECT VALUE from STRING_SPLIT('APPLE,BANANA,GOA',',')
select value from STRING_SPLIT('apple,banana,lemon,kiwi,orange,coconut',',') SET compatibility_LEVEL=120
SELECT value  FROM STRING_SPLIT('red,green,,blue', ',') t --SET COMPATIBILITY_LEVEL = 130;

ALTER DATABASE [ITCRATS] SET COMPATIBILITY_LEVEL = 130

SELECT MIN(SAL) FROM EMP
SELECT * FROM EMP

--FETCH DUPLICATE RECORDS FROM TABLE
SELECT * FROM 
(SELECT *,ROW_NUMBER() OVER(PARTITION BY FIRST_NAME ORDER BY CITY) AS RowNum FROM SALES.CUSTOMERS) AS RS
WHERE RS.Rownum>1 ORDER BY CUSTOMER_ID

SELECT * FROM SALES.CUSTOMERS
SELECT CONCAT(FIRST_NAME,' ',LAST_NAME) FROM SALES.CUSTOMERS



-- split A FULLNAME as FIRST NAME, MIDDLE NAME, LAST NAME columns
--Mittelstadt,L,Hasna**
--Bracaloni,B,Rosine**
--Ostlie,P,Guo**
--Farrant,Clelia**
--Raff,Rolly**
--CREATE TABLE full_names(ID INT identity(1,1),FULL_NAME VARCHAR(50))
INSERT INTO FULL_NAMES VALUES('Mittelstadt,L,Hasna**'),
('Bracaloni,B,Rosine**'),
('Ostlie,P,Guo**'),
('Farrant,Clelia**'),
('Raff,Rolly**')
CREATE TABLE GET_INDIVIDUAL(ID INT IDENTITY(1,1),FULL_NAME VARCHAR(20),MIDDLE_NAME VARCHAR(20),LAST_NAME VARCHAR(20))
SELECT * FROM FULL_NAMES

--SELECT value FROM STRING_SPLIT('An example sentence.', ' ');

--SELECT VALUE FROM STRING_SPLIT('Ostlie,P,Guo**',',')

--SELECT full_name, CHARINDEX(',',full_name),CHARINDEX(',',REVERSE(full_name)) FROM FULL_NAMES

SELECT LEFT(ML,CHARINDEX(',',ML)) AS MIDDLE_NAME,SUBSTRING(ML,CHARINDEX(',',ML)+1,LEN(ML)-CHARINDEX(',',ML)-2) AS LAST_NAME FROM (SELECT RIGHT(FULL_NAME,LEN(FULL_NAME)-CHARINDEX(',',FULL_NAME)) AS ML FROM FULL_NAMES) AS MLA

SELECT * FROM FULL_NAMES
SELECT LEFT(FULL_NAME, CHARINDEX(',',FULL_NAME)-1) AS FIRST_NAME FROM FULL_NAMES

-- STORED PROCEDURE
go
ALTER PROC get_all_employees
AS 

(SELECT LEFT(FULL_NAME, CHARINDEX(',',FULL_NAME)-1) AS FIRST_NAME FROM FULL_NAMES)

SELECT 
LEFT(ML,CHARINDEX(',',ML))AS MIDDLE_NAME,
SELECT SUBSTRING(ML,CHARINDEX(',',ML)+1,LEN(ML)-CHARINDEX(',',ML)-2) AS LAST_NAME
FROM (SELECT RIGHT(FULL_NAME,LEN(FULL_NAME)-CHARINDEX(',',FULL_NAME)) AS ML FROM FULL_NAMES
go


------------------------- SOLUTION 1------------------------------------------------------------------------------------------------------------------------------------------------

SELECT SUBSTRING(FULL_NAME,1,CHARINDEX(',',FULL_NAME)-1) FIRST_NAME,
SUBSTRING(FULL_NAME,CHARINDEX(',',FULL_NAME)+1,CHARINDEX(',',FULL_NAME,CHARINDEX(',',FULL_NAME)+1)-CHARINDEX(',',FULL_NAME)-1)MIDDLE_NAME,
SUBSTRING(FULL_NAME,CHARINDEX(',',FULL_NAME,CHARINDEX(',',FULL_NAME)+2)+1,LEN(FULL_NAME)-CHARINDEX(',',FULL_NAME,CHARINDEX(',',FULL_NAME)+2)-2)LAST_NAME
FROM FULL_NAMES
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


--ALTER TABLE FULL_NAMES ADD NUM INT IDENTITY(1,1)
SELECT * FROM FULL_NAMES
SELECT  * FROM FULL_NAMES
INSERT INTO FULL_NAMES VALUES('HARVEY,PEARSON**')
DELETE FROM FULL_NAMES WHERE NUM IN(6)
SELECT CHARINDEX(',',FULL_NAME,CHARINDEX(',',FULL_NAME)+1) FROM FULL_NAMES

SELECT CHARINDEX('A','ARAVINDA',CHARINDEX('A','ARAVINDA')+2)

--exec get_all_employees

--DECLARE @EmpName NVARCHAR(50)


select substring('abd,L,Hasna**',CHARINDEX(',','abd,L,Hasna**')+1,(CHARINDEX(',','abd,L,Hasna**')+2)-1)

select CHARINDEX(',','abd,L,Hasna**')+2

--SET @EmpName = (SELECT [Name] FROM SetVsSelectDemo WHERE GroupNumber = 3)
--PRINT @EmpName
--GO
-----
--DECLARE @FIRSTNAME NVARCHAR(30)
----DECLARE @MIDDLELAST NVARCHAR(30)
--SET @FIRSTNAME = (SELECT LEFT(FULL_NAME, CHARINDEX(',',FULL_NAME)-1) AS FIRST_NAME FROM FULL_NAMES)
--SET @MIDDLELAST =(SELECT LEFT(ML,CHARINDEX(',',ML))AS MIDDLE_NAME,RIGHT(ML,LEN(ML)-CHARINDEX(',',ML)) AS LAST_NAME FROM (SELECT RIGHT(FULL_NAME,LEN(FULL_NAME)-CHARINDEX(',',FULL_NAME)) AS ML FROM FULL_NAMES) AS MLA
--)


--- PIVOTING
Source	
id fieldname	typecode	INTVALUE	FLOATVALUE   textvalue				
1	Name		3		NULL		NULL			John	--3-STRING
1	rollno		1		45			NULL			NULL	--1-INT
2	Name		3		NULL		NULL			James	
2	rollno		1		56			NULL			NULL	
1	Percentage	2		NULL		87.67			NULL	--2-FLOAT
2	Percentage	2		NULL		97.68			NULL	

Target	
Name	Rollno	Percentage
John	45		87.67	
James	56		97.68
--------------------
--CREATE TABLE STUDENT_one_TGT(Name VARCHAR(20),Rollno int,SPercent decimal(4,2))
select * from student_one_TGT
select * from student_one

UPDATE STUDENT_ONE SET FIELDNAME='NAME' where fieldname='name'

select max(IIF(Fieldname='Name',textval,NULL)) ,
max(IIF(Fieldname='ROLLNO',intvalue,NULL)) ,
max(IIF(Fieldname='Percentage',floatvalue,NULL)) 
id
from STUDENT_one group by id

select IIF(Fieldname='Name',textval,NULL) as name,
IIF(Fieldname='ROLLNO',intvalue,NULL) as rollno ,
IIF(Fieldname='Percentage',floatvalue,NULL) as percen
,id
from STUDENT_one order by 4

select max(IIF(Fieldname='Name',textval,NULL)) as name
--,
--IIF(Fieldname='ROLLNO',intvalue,NULL) as rollno ,
--IIF(Fieldname='Percentage',floatvalue,NULL) as percen
--,id
from STUDENT_one group by id 

CREATE TABLE STUDENT_one(ID INT ,fieldname VARCHAR(20),typecode int,intvalue int,floatvalue decimal(20,6),textval varchar(25))
INSERT INTO STUDENT_one VALUES('NAME',3,NULL,NULL,'JOHN',1),('ROLLNO',1,45,NULL,'NULL',1),('name',3,NULL,NULL,'JAMES',2),
('ROLLNO',1,56,NULL,NULL,2),('PERCENTAGE',2,NULL,87.67,NULL,1),('PERCENTAGE',2,NULL,97.688,NULL,2)

--truncate table student_one
--alter table student_one_tgt add id int

SELECT * FROM STUDENT_one
select title from student


SELECT  * FROM FULL_NAMES
--INSERT INTO FULL_NAMES VALUES('HARVEY,PEARSON**')
--DELETE FROM FULL_NAMES WHERE NUM=8
--CREATE TABLE GETNAME_TGT(First_Name varchar(20),Middle_Name varchar(20),Last_Name varchar(20))
------------------------- SOLUTION 2------------------------------------------------------------------------------------------------------------------------------------------------

SELECT SUBSTRING(FULL_NAME,1,CHARINDEX(',',FULL_NAME)-1) FIRST_NAME,
CASE
WHEN LEN(SUBSTRING(FULL_NAME,CHARINDEX(',',FULL_NAME)+1,CHARINDEX(',',FULL_NAME,CHARINDEX(',',FULL_NAME)+1)-CHARINDEX(',',FULL_NAME)-1))=0 THEN ' '
ELSE SUBSTRING(FULL_NAME,CHARINDEX(',',FULL_NAME)+1,CHARINDEX(',',FULL_NAME,CHARINDEX(',',FULL_NAME)+1)-CHARINDEX(',',FULL_NAME)-1)
END AS MIDDLE_NAME,
--SUBSTRING(FULL_NAME,CHARINDEX(',',FULL_NAME)+1,CHARINDEX(',',FULL_NAME,CHARINDEX(',',FULL_NAME)+1)-CHARINDEX(',',FULL_NAME)-1)MIDDLE_NAME,
SUBSTRING(FULL_NAME,CHARINDEX(',',FULL_NAME,CHARINDEX(',',FULL_NAME)+2)+1,LEN(FULL_NAME)-CHARINDEX(',',FULL_NAME,CHARINDEX(',',FULL_NAME)+2)-2)LAST_NAME
FROM FULL_NAMES
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT  * FROM FULL_NAMES
--INSERT INTO FULL_NAMES VALUES('JESSICA**'),('HARVEY,REGINALD,SPECTER**')
--DELETE FROM FULL_NAMES WHERE NUM=15

------------------------- SOLUTION 3-TEST CASES PASSED -----------------------------------------------------------------------------------------------------------------------------------------------

SELECT SUBSTRING(FULL_NAME,1,CHARINDEX(',',FULL_NAME)-1) FIRST_NAME,
CASE
WHEN CHARINDEX(',',FULL_NAME,CHARINDEX(',',FULL_NAME)+2) = 0 THEN ''
ELSE SUBSTRING(FULL_NAME,CHARINDEX(',',FULL_NAME)+1,CHARINDEX(',',FULL_NAME,CHARINDEX(',',FULL_NAME)+1)-CHARINDEX(',',FULL_NAME)-1)
END AS MIDDLE_NAME,
CASE
WHEN CHARINDEX(',',FULL_NAME,CHARINDEX(',',FULL_NAME)+2) = 0 THEN SUBSTRING(FULL_NAME,CHARINDEX(',',FULL_NAME)+1,LEN(FULL_NAME)-CHARINDEX(',',FULL_NAME)-2)
ELSE SUBSTRING(FULL_NAME,CHARINDEX(',',FULL_NAME,CHARINDEX(',',FULL_NAME)+2)+1,LEN(FULL_NAME)-CHARINDEX(',',FULL_NAME,CHARINDEX(',',FULL_NAME)+2)-2)
END AS LAST_NAME
FROM FULL_NAMES

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

select * from FULL_NAMES
select * from getname_tgt

--- CONVERT INTEGER TO DATE
--0112288 ==> MM/DD/YYYY => IF LAST TWO  digits are greater than 48 then concat 19 to it else, concat 20 to it.
--0121288
--0020189
--0111585
--0112585
--0120285
--0011686
--0072787
--0091399
--0042706
--ALTER TABLE DATES_TGT ALTER COLUMN MYDATE VARCHAR(20)
-- CREATE TABLE DATES_tgt (MYDate varchar(20))
--INSERT INTO DATES VALUES('0112288'),('0121288'),('0111585'),('0011686'),('0091399'),('0042706')
SELECT * FROM DATES
SELECT * FROM DATES_TGT


SELECT
CASE
WHEN SUBSTRING(TS,6,2) > 48 AND SUBSTRING(TS,6,2) <= 99  THEN CONCAT(SUBSTRING(TS,2,2),'/', SUBSTRING(TS,4,2),'/',19,substring(ts,6,2))
when SUBSTRING(TS,6,2) < 48 THEN CONCAT(SUBSTRING(TS,2,2),'/', SUBSTRING(TS,4,2),'/',20,substring(ts,6,2))
END AS MyDate
FROM DATES
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--ALTER TABLE DATES2 ALTER COLUMN MYDAY int
CREATE TABLE DATES2 (ID INT IDENTITY(1,1),myYear int,myday int)
--DELETE FROM DATES2
INSERT INTO DATES2 VALUES(18,02),(19,26),(26,100),(24,300),(20,366)--,('0042706')
SELECT * FROM DATES2
--SELECT SUBSTRING(MYYEAR,1,2) FROM DATES2

SELECT 
CASE
WHEN SUBSTRING(MYYEAR,1,1)=1 THEN CONCAT(19,MYYEAR)
WHEN SUBSTRING(MYYEAR,1,1)=2 THEN CONCAT(20,MYYEAR)
END AS MYYEAR
FROM DATES2

SELECT DAy(366)
select format(myday,dd/mm) from dates2
select CONVERT(DAtetime,myday) from dates2

--create table tgt2 (ID INT , LETTER VARCHAR(2))
--create table ex2 ( LETTER VARCHAR(2))
--select * from tgt2
--INSERT INTO EX1 VALUES('A'),('D'),('B'),('B'),('B'),('C'),('C')
--INSERT INTO EX2 VALUES('A'),('B'),('C'),('D'),('B'),('B'),('C')

 
select * from tgt1
SELECT * FROM TGT2

--GET BASE DATASET, APPLY PIVOOT OPERATOR
SELECT * FROM PRODUCTION.PRODUCTS
SELECT * FROM PRODUCTION.CATEGORIES
--GET NO.OF SOLDED PRODUCTS OF EACH  CATEGORY.

--First, select a base dataset for pivoting.
--Second, create a temporary result by using a derived table or common table expression (CTE)
--Third, apply the PIVOT operator.

SELECT * FROM (SELECT CATEGORY_NAME,PRODUCT_ID FROM PRODUCTION.PRODUCTS PP JOIN PRODUCTION.CATEGORIES PC
ON PP.CATEGORY_ID=PC.CATEGORY_ID) AS CP
PIVOT( COUNT(product_id)
FOR CATEGORY_NAME IN(
[Children Bicycles],[Comfort Bicycles],[Cruisers Bicycles],[Cyclocross Bicycles])) AS PT


----- CREATE A TABLE IF NOT EXISTS IN THE DATABASE  ----
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='MYPRODUCTS' )
BEGIN
CREATE TABLE ITCRATS.DBO.MYPRODUCTS(ID INT)
print 'TABLE CREATED'
END
ELSE
BEGIN
PRINT '--------- WARNING --------- ' + CHAR(10) + 'TABLE ALREADY EXISTS'
END

--------- ADD COLUMNS IF NOT EXISTS -------------
IF EXISTS(SELECT * FROM ITCRATS.DBO.MYPRODUCTS)
BEGIN
ALTER TABLE ITCRATS.DBO.MYPRODUCTS ADD AgentName varchar(25),AgentId int,AgentAddress varchar(50)
END
ELSE
BEGIN
PRINT '--------- WARNING --------- ' + CHAR(10) + 'Table Not EXIST'
END

IF NOT EXISTS ( SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE
TABLE_NAME = 'DBO.MYPRODUCTS' AND COLUMN_NAME = 'AgentName' OR 
COLUMN_NAME ='AgentId' OR COLUMN_NAME ='AgentAddress' OR COLUMN_NAME ='Age')
BEGIN
ALTER TABLE ITCRATS.DBO.MYPRODUCTS ADD AgentName varchar(25),AgentId int,AgentAddress varchar(50),Age int
print 'COLUMNS ADDED'
END
ELSE
BEGIN
PRINT '--------- WARNING --------- ' + CHAR(10) + 'COLUMNS ALREADY EXIST or Table Doesnt Exist'
END

Select * from ITCRATS.DBO.MYPRODUCTS

Select * from sales.staffs
CREATE TABLE STAFS_TGT(staff_id int,first_name varchar(20),last_name varchar(20),pnone int)
select * from STAFS_TGT