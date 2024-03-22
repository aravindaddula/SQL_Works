-- Here is a SQL interview question asked in a data analyst interview.
create database interview_prep;
use interview_prep;
-- Task :
create table people
(
	id int primary key not null,
	name varchar(20),
	gender char(2)
);

create table relations
(
	child_id int,
	parent_id int,
	FOREIGN KEY (child_id) REFERENCES people(id),
	foreign key (parent_id) references people(id)
);

insert into people
	(id, name, gender)
values
	(107, 'Days', 'F'),
	(145, 'Hawbaker', 'M'),
	(155, 'Hansel', 'F'),
	(202, 'Blackston', 'M'),
	(227, 'Criss', 'F')
,
	(278, 'Keffer', 'M'),
	(305, 'Canty', 'M'),
	(329, 'Mozingo', 'M'),
	(425, 'Nolf', 'M'),
	(534, 'Waugh', 'M'),
	(586, 'Tong', 'M'),
	(618, 'Dimartino', 'M'),
	(747, 'Beane', 'M'),
	(878, 'Chatmon', 'F'),
	(904, 'Hansard', 'F');

insert into relations
	(child_id, parent_id)
values
	(145, 202),
	(145, 107),
	(278, 305),
	(278, 155),
	(329, 425),
	(329, 227),
	(534, 586),
	(534, 878),
	(618, 747),
	(618, 904);
/*
We have two tables people and relations. The people table contains the details of each individual 
and the relations table contains the parent-child relationship between two individuals.
Question : -Write a query that prints the names of a child and his parents in individual columns respectively 
in order of the name of the child as shown in the picture.
*/
-- Solution-- 145,202
-- select child details
with
	child_info
	as
	(
		select id, c.name, c.gender, r.child_id, r.parent_id as parent_id
		from people as c join relations as r on c.id=r.child_id
	),-- get parent details
	parent_info
	as
	(
		select ch.id as child_id, ch.name as child_name, ch.gender, p.name, p.gender as parent_gender, p.id
		from child_info as ch
			join people as p on ch.parent_id=p.id
	)
select child_id, child_name, gender
, max(case when parent_gender='M' then name else '' end) as father_name
, max(case when parent_gender='F' then name else '' end) as mother_name
from parent_info
group by child_id,child_name,gender
/*
Task
Here is a very interesting SQL problem asked in a fintech startup.
Write a SQL to find trade couples satisfying following conditions for each stock :

1- The trades should be within 10 seconds of window
2- The prices difference between the trades should be more than 10%
here is the ready script:
Create Table Trade_tbl(
TRADE_ID varchar(20),
Trade_Timestamp time,
Trade_Stock varchar(20),
Quantity int,
Price Float
)

Insert into Trade_tbl Values('TRADE1','10:01:05','ITJunction4All',100,20)
Insert into Trade_tbl Values('TRADE2','10:01:06','ITJunction4All',20,15)
Insert into Trade_tbl Values('TRADE3','10:01:08','ITJunction4All',150,30)
Insert into Trade_tbl Values('TRADE4','10:01:09','ITJunction4All',300,32)
Insert into Trade_tbl Values('TRADE5','10:10:00','ITJunction4All',-100,19)
Insert into Trade_tbl Values('TRADE6','10:10:01','ITJunction4All',-300,19)

*/

------------------------------------------------
/*
There is a cool SQL keyword that can reduce your subqueries.



I am talking about QUALIFY.

Suppose we have a table called 'Sales' with the following columns: 'Product', 'Region', and 'Revenue'. We want to find the top-selling product in each region based on revenue.

In traditional SQL you will write the below SQL :

select * from
(
SELECT Product, Region, Revenue
,ROW_NUMBER() OVER (PARTITION BY Region ORDER BY Revenue DESC) as rn
FROM Sales
)
where rn=1

Here's how you can use the QUALIFY keyword to achieve this:

SELECT Product, Region, Revenue
FROM Sales
QUALIFY ROW_NUMBER() OVER (PARTITION BY Region ORDER BY Revenue DESC) = 1;

So basically you can use window functions to filter the data within the QUALIFY clause and you don't have to write a sub query.

Isn't it pretty cool.

But unfortunately the QUALIFY keyword is not available in most of the databases.

It was first introduced in Teradata and few other modern databases have adopted it.

Does your database support this keyword? Let me know in the comments section.

*/
-------------------------------------------
/*
An organization is looking to hire candidates for their junior and senior positions.
They have a total quota/limit of 50000$ in all , they have to first fill up the senior positions and then fill up the junior positions.

There are 4 test cases , write a SQL query to satisfy all the testcases.

Table :
Create table candidates(
id int primary key,
positions varchar2(10) not null,
salary int not null);

Test Case 1 :
insert into candidates values(1,'junior',5000);
insert into candidates values(2,'junior',7000);
insert into candidates values(3,'junior',7000);
insert into candidates values(4,'senior',10000);
insert into candidates values(5,'senior',30000);
insert into candidates values(6,'senior',20000);

Expected O/p: In the above case the total salary of seniors is 30000$ , so id 4 and 6 should be considered , there will be enough money left to hire juniors so id 1,2 and 3 can be considered.

For all 4 test cases and solutions check out the link in the comments section.

*/
-------------------------------------------

/*
This is a very common mistake anyone can do when working with SQLs.
Let say you are calculating a percentage value by dividing 2 columns. If both the columns are integer then you will get output as integer only.

For example 90/100 will be 0 instead of 0.9.
To fix this you need to convert any one of the column to decimal data type.

One quick trick I use is multiply anyone of the column by 1.0 to make it decimal.

Instead of doing numerator/denominator, I will do 1.0 * numerator / denominator. This will give you 0.9.

*/
-------------------------------------------

/*
Paypal SQL Interview Question asked in Data Engineer Interview for Sunday workout 💪

Table1:-employee_checkin_details

employeeid ,entry_details, timestamp_details
1000 , login , 2023-06-16 01:00:15.34
1000 , login , 2023-06-16 02:00:15.34
1000 , login , 2023-06-16 03:00:15.34
1000 , logout , 2023-06-16 12:00:15.34
1001 , login , 2023-06-16 01:00:15.34
1001 , login , 2023-06-16 02:00:15.34
1001 , login , 2023-06-16 03:00:15.34
1001 , logout , 2023-06-16 12:00:15.34

Table2:-employee_details

employeeid , phone_number , isdefault
1001 ,9999 , false
1001 ,1111 , false
1001 ,2222 , true
1003 ,3333 , false

Write an sql code to find the output table as below

employeeid ,employee_default_phone_number, totalentry,totallogin,totallogout,latestlogin,latestlogout

*/
-------------------------------------------
-------------------------------------------

/*
Let's understand slowly changing dimensions with simple examples (scd1 and scd2)

Slowly changing dimensions (SCDs) are used in data warehousing to describe how data changes over time.
In a typical data warehouse, the data is often updated, inserted, or deleted on a regular basis.
SCDs help to manage these changes and maintain a historical record of the data.

There are three types of slowly changing dimensions:

Type 1: Overwrite the Existing Data

Type 1 SCDs simply overwrite the existing data with the new data.
 In other words, they do not keep a historical record of changes. 
 This type of SCD is suitable when the changes in the data are not important, 
 and only the current state of the data is relevant.

For example, consider a table of customers where the only information that is captured is their name, and address. 
If a customer changes their address, a type 1 SCD would simply update the existing address in the table.

Current state :
customer id, name , address, last update
1, Ankit, Mangalore, 2023-01-01

new state
customerid, name , address , last update
1, Ankit, Bangalore, 2023-05-12


Type 2: Add a New Record

Type 2 SCDs keep a historical record of changes by adding a new record to the table. 
In other words, they maintain a history of changes over time. This type of SCD is useful when 
the changes in the data are important and need to be tracked.

Let's see how data looks with scd2

Current state :
customer key, customer id, name , address, effective date , end date
1, 1, Ankit, Mangalore, 2023-01-01, 9999-12-31

new state:
customer key, customer id, name, address , effective date , end date
1,1, Ankit, 18, Mangalore, 2023-01-01, 2023-05-11
2, 1, Ankit, 18, Bangalore, 2023-05-12, 9999-12-31

Few things to note here :

1- we have to add 2 extra columns start date and end date to keep the track of which record was active for 
which date range .

2 - we introduced a new column called customer key because customer id can no more be a primary key .

3- this customer key is also known as surrogate key.

4- for the current active record we keep the end date as high date (9999-12-31) so that it stays active forever
until we get any new update for the customer.

There is one more scd type 3 . Let's see who can explain it with this simple example. 
comments section is waiting for you.

*/

/*
Best practices for writing SQL queries:

1- Write SQL keywords in capital letters.

2- Use table aliases with columns when you are joining multiple tables.

3- Never use select *, always mention list of columns in select clause.

4- Add useful comments wherever you write complex logic. Avoid too many comments.

5- Use joins instead of subqueries when possible for better performance.

6- Create CTEs instead of multiple sub queries , it will make your query easy to read.

7- Join tables using JOIN keywords instead of writing join condition in where clause for better readability.

8- Never use order by in sub queries , It will unnecessary increase runtime.

9- If you know there are no duplicates in 2 tables, use UNION ALL instead of UNION for better performance.

*/

-------------------------------------------
/*

*/
-------------------------------------------
/*
Is your salary more than your manager's salary ??


Well that's not so important.

But it's a very interesting problem to solve if you really want to understand self joins in SQL.

Moreover it is one of the very commonly asked interview question.

Some other variant of this question are :

1- Write a query to print emp name and his manager name
2- Write a query to find employees whose age is less than their manager's age
3- Write a query to find employees who joined the company before their manager.

and many more

But if you understand how exactly to think about self join all these questions will be a cake walk for you.

Well I have created a easy to understand video explaining the concept in excel first and then implemented in SQL.
=======================================
If you have ever given an SQL interview some of the questions would be definitely from below list :

1- How to find duplicates in a table
2- How to delete duplicates from a table
3- Difference between union and union all
4- Difference between rank,row_number and dense_rank
5- Find records in a table which are not present in another table
6- Find second highest salary employees in each department
7- Find employees with salary more than their manager's salary
8- Difference between inner and left join
9- update a table and swap gender values.
10- Number of records in output with different kinds of join.

If not exact at least flavor of these questions are always asked in interviews irrespective of your experience level :D

Want to know the answers of these question ? check the link in comment section.
=======================================
Let's see who can solve this SQL problem asked in the Amazon interview for a BI Engineer position..


Given the users purchase history write a query to print users who have done purchase on more than 1 day and products purchased on a given day are never repeated on any other day.

Bonus points if you solve it without using a subquery or self join.

Here is the ready script:

create table purchase_history
(userid int
,productid int
,purchasedate date
);
SET DATEFORMAT dmy;
insert into purchase_history values
(1,1,'23-01-2012')
,(1,2,'23-01-2012')
,(1,3,'25-01-2012')
,(2,1,'23-01-2012')
,(2,2,'23-01-2012')
,(2,2,'25-01-2012')
,(2,4,'25-01-2012')
,(3,4,'23-01-2012')
,(3,1,'23-01-2012')
,(4,1,'23-01-2012')
,(4,2,'25-01-2012');

=======================================
Imagine you're working for an e-commerce company that wants to analyze customer spending patterns.

The company has a large dataset containing information about the total amount spent by each customer in the past year.

Your task is to segment the customers into groups based on their spending levels.


By using the NTILE function, you can divide the dataset into, let's say, four tiles (quartiles) based on the total amount spent.

Each tile will contain approximately the same number of customers, allowing for fair and meaningful comparisons.

Here's a simplified representation of the dataset:

Customer ID Total Amount Spent
001 $500
002 $750
003 $1,200
004 $2,000
005 $800
006 $1,500
007 $1,000
008 $600
009 $1,800
010 $900

Now, let's apply the NTILE function to create four tiles:

SELECT
CustomerID,
TotalAmountSpent,
NTILE(4) OVER (ORDER BY TotalAmountSpent) AS SpendingTile
FROM
Customers;

The resulting dataset would look like this:

Customer ID Total Amount Spent Spending Tile
001 $500 1
008 $600 1
002 $750 2
005 $800 2
010 $900 2
007 $1,000 3
003 $1,200 3
006 $1,500 4
009 $1,800 4
004 $2,000 4

Now, armed with this segmentation, you can analyze the spending behavior of customers within each tile.

You may discover interesting insights, such as high spenders in the fourth tile or potential opportunities to engage with customers in the first tile to increase their spending.


NTILE function can help data scientists analyze data distribution, identify patterns, and derive insights from segmented datasets.

Moreover this is not all. Checkout my latest video on NTILE function to discover what all it can do.
=======================================
Here is a very interesting SQL problem asked in a fintech startup.

Write a SQL to find trade couples satisfying following conditions for each stock :

1- The trades should be within 10 seconds of window

2- The prices difference between the trades should be more than 10%

here is the ready script:

Create Table Trade_tbl(
TRADE_ID varchar(20),
Trade_Timestamp time,
Trade_Stock varchar(20),
Quantity int,
Price Float
)

Insert into Trade_tbl Values('TRADE1','10:01:05','ITJunction4All',100,20)
Insert into Trade_tbl Values('TRADE2','10:01:06','ITJunction4All',20,15)
Insert into Trade_tbl Values('TRADE3','10:01:08','ITJunction4All',150,30)
Insert into Trade_tbl Values('TRADE4','10:01:09','ITJunction4All',300,32)
Insert into Trade_tbl Values('TRADE5','10:10:00','ITJunction4All',-100,19)
Insert into Trade_tbl Values('TRADE6','10:10:01','ITJunction4All',-300,19)
=======================================
 Job security is not about working in a company with no history of layoffs.

❌ Job security is not about working in a company for a period of 10 or 20 years and expect loyalty from the employer.

❌ Job security is not about having a great relationship with your manager.



✅ Job security is having the confidence that you will get another job in no time after losing your current job.

✅ Job security is about upskilling yourself and having the confidence in the work that you have done.

✅ Job security is about having the emergency fund and knowing that being laidoff won't affect your financial situation.

Job security is all about your confidence, skills and a bit of financial planning.
=======================================
Let's see who can solve this interesting SQL interview problem this weekend.


The first four columns are input and the last column is the expected output.

For a person to qualify there are 2 conditions:

1- The person should have both the criteria as 'Y' .
2- There should be at least 2 people in his team who qualify for the program.

Here is the script :

create table Ameriprise_LLC
(
teamID varchar(2),
memberID varchar(10),
Criteria1 varchar(1),
Criteria2 varchar(1)
);
insert into Ameriprise_LLC values
('T1','T1_mbr1','Y','Y'),
('T1','T1_mbr2','Y','Y'),
('T1','T1_mbr3','Y','Y'),
('T1','T1_mbr4','Y','Y'),
('T1','T1_mbr5','Y','N'),
('T2','T2_mbr1','Y','Y'),
('T2','T2_mbr2','Y','N'),
('T2','T2_mbr3','N','Y'),
('T2','T2_mbr4','N','N'),
('T2','T2_mbr5','N','N'),
('T3','T3_mbr1','Y','Y'),
('T3','T3_mbr2','Y','Y'),
('T3','T3_mbr3','N','Y'),
('T3','T3_mbr4','N','Y'),
('T3','T3_mbr5','Y','N');

You can check out my 2 solutions. First one is AAM Zindagi and second one is MENTOS Zindagi.
=======================================
There is a cool SQL keyword that can reduce your subqueries.



I am talking about QUALIFY.

Suppose we have a table called 'Sales' with the following columns: 'Product', 'Region', and 'Revenue'. We want to find the top-selling product in each region based on revenue.

In traditional SQL you will write the below SQL :

select * from
(
SELECT Product, Region, Revenue
,ROW_NUMBER() OVER (PARTITION BY Region ORDER BY Revenue DESC) as rn
FROM Sales
)
where rn=1

Here's how you can use the QUALIFY keyword to achieve this:

SELECT Product, Region, Revenue
FROM Sales
QUALIFY ROW_NUMBER() OVER (PARTITION BY Region ORDER BY Revenue DESC) = 1;

So basically you can use window functions to filter the data within the QUALIFY clause and you don't have to write a sub query.

Isn't it pretty cool.

But unfortunately the QUALIFY keyword is not available in most of the databases.

It was first introduced in Teradata and few other modern databases have adopted it.

=======================================
Here is a very interesting SQL problem asked in a fintech startup.

Write a SQL to find trade couples satisfying following conditions for each stock :

1- The trades should be within 10 seconds of window

2- The prices difference between the trades should be more than 10%

here is the ready script:

Create Table Trade_tbl(
TRADE_ID varchar(20),
Trade_Timestamp time,
Trade_Stock varchar(20),
Quantity int,
Price Float
)

Insert into Trade_tbl Values('TRADE1','10:01:05','ITJunction4All',100,20)
Insert into Trade_tbl Values('TRADE2','10:01:06','ITJunction4All',20,15)
Insert into Trade_tbl Values('TRADE3','10:01:08','ITJunction4All',150,30)
Insert into Trade_tbl Values('TRADE4','10:01:09','ITJunction4All',300,32)
Insert into Trade_tbl Values('TRADE5','10:10:00','ITJunction4All',-100,19)
Insert into Trade_tbl Values('TRADE6','10:10:01','ITJunction4All',-300,19)

=======================================
Please don't do this if you are a SQL developer.


select
col1
,col2
,col3
,col4
,col5
from tbl1
join tb2 on tb1.col1=tb2.col

In this query only God knows which column is coming from which table.

Imagine you need to analyse a query with 10 tables joined together and 25 columns in the select clause without a table alias.

Before starting your analysis you first need to spend time to figure out each column is coming from which table.

Please give table aliases always. It will not only help others but yourself too when you visit the code after a few days.
=======================================
This I think is one of the most asked advanced SQL interview question.


Difference between

Rank
Dense rank
Row number

These 3 window functions are the best friends for a SQL developer.
=======================================
Let's see who can solve this hard Leetcode problem: merge overlapping events .


Write SQL to merge events with overlapping dates.

Here is the ready script

create table hall_events
(
hall_id integer,
start_date date,
end_date date
);
delete from hall_events
insert into hall_events values
(1,'2023-01-13','2023-01-14')
,(1,'2023-01-14','2023-01-17')
,(1,'2023-01-18','2023-01-25')
,(2,'2022-12-09','2022-12-23')
,(2,'2022-12-13','2022-12-17')
,(3,'2022-12-01','2023-01-30');
=======================================
Let's see who can solve this SQL problem asked in the Amazon interview for a BI Engineer position..


Given the users purchase history write a query to print users who have done purchase on more than 1 day and products purchased on a given day are never repeated on any other day.

Bonus points if you solve it without using a subquery or self join.

Here is the ready script:

create table purchase_history
(userid int
,productid int
,purchasedate date
);
SET DATEFORMAT dmy;
insert into purchase_history values
(1,1,'23-01-2012')
,(1,2,'23-01-2012')
,(1,3,'25-01-2012')
,(2,1,'23-01-2012')
,(2,2,'23-01-2012')
,(2,2,'25-01-2012')
,(2,4,'25-01-2012')
,(3,4,'23-01-2012')
,(3,1,'23-01-2012')
,(4,1,'23-01-2012')
,(4,2,'25-01-2012');
=======================================
This is a very common mistake anyone can do when working with SQLs.


Let say you are calculating a percentage value by dividing 2 columns. If both the columns are integer then you will get output as integer only.

For example 90/100 will be 0 instead of 0.9.
To fix this you need to convert any one of the column to decimal data type.

One quick trick I use is multiply anyone of the column by 1.0 to make it decimal.

Instead of doing numerator/denominator, I will do 1.0 * numerator / denominator. This will give you 0.9.

=======================================
Here is an interesting SQL puzzle asked in Infosys Interview.


The first 3 columns in the image are input and you need to derive the 4th new_value column.

Here is the ready script to create data:

create table input (
id int,
formula varchar(10),
value int
)
insert into input values (1,'1+4',10),(2,'2+1',5),(3,'3-2',40),(4,'4-1',20);

=======================================
Here is an interesting SQL problem to warm up before your next interview.


The first table in the image is input and the second table is expected output. I hope the question is clear.

I am putting the ready script to create table and data in case you want to try it out before checking out my solution.

create table entries ( 
name varchar(20),
address varchar(20),
email varchar(20),
floor int,
resources varchar(10));

insert into entries
values ('A','Bangalore','A@gmail.com',1,'CPU'),('A','Bangalore','A1@gmail.com',1,'CPU'),('A','Bangalore','A2@gmail.com',2,'DESKTOP')
,('B','Bangalore','B@gmail.com',2,'DESKTOP'),('B','Bangalore','B1@gmail.com',2,'DESKTOP'),('B','Bangalore','B2@gmail.com',1,'MONITOR')
;
select * from entries;

=======================================
Here is a very interesting SQL problem asked in a fintech startup.

Write a SQL to find trade couples satisfying following conditions for each stock :

1- The trades should be within 10 seconds of window

2- The prices difference between the trades should be more than 10%

here is the ready script:

Create Table Trade_tbl(
TRADE_ID varchar(20),
Trade_Timestamp time,
Trade_Stock varchar(20),
Quantity int,
Price Float
)

Insert into Trade_tbl Values('TRADE1','10:01:05','ITJunction4All',100,20)
Insert into Trade_tbl Values('TRADE2','10:01:06','ITJunction4All',20,15)
Insert into Trade_tbl Values('TRADE3','10:01:08','ITJunction4All',150,30)
Insert into Trade_tbl Values('TRADE4','10:01:09','ITJunction4All',300,32)
Insert into Trade_tbl Values('TRADE5','10:10:00','ITJunction4All',-100,19)
Insert into Trade_tbl Values('TRADE6','10:10:01','ITJunction4All',-300,19)

=======================================
This is my all time favourite scenario based SQL interview question.


I have asked this question many times during the interviews at different companies and only very few candidates could solve it in the first attempt.

The best part is this question looks simple at first but is not that simple 😊

Here is the script if you want to try it out.

create table icc_world_cup
(
Team_1 Varchar(20),
Team_2 Varchar(20),
Winner Varchar(20)
);

INSERT INTO icc_world_cup values('India','SL','India');
INSERT INTO icc_world_cup values('SL','Aus','Aus');
INSERT INTO icc_world_cup values('SA','Eng','Eng');
INSERT INTO icc_world_cup values('Eng','NZ','NZ');
INSERT INTO icc_world_cup values('Aus','India','India');

select * from icc_world_cup;

=======================================
Here is a hard Leetcode SQL problem challenge.

Write a SQL to find the second most recent activity for a user and if user has only 1 activity then return that as it is.

Here is the script:

create table UserActivity
(
username varchar(20) ,
activity varchar(20),
startDate Date ,
endDate Date
);

insert into UserActivity values
('Alice','Travel','2020-02-12','2020-02-20')
,('Alice','Dancing','2020-02-21','2020-02-23')
,('Alice','Travel','2020-02-24','2020-02-28')
,('Bob','Travel','2020-02-11','2020-02-18');
=======================================
Uber SQL Interview problem to test your problem solving before the next interview.

Write a query to find total rides and profit rides by each driver.
Profit ride is when the end location of the current ride is the same as the start location of the next ride.

It is not necessary that the end time of the current ride should be the same as the start time of the next ride to qualify as a profit ride.

Bonus point if you solve it without using lead and lag functions.

script :

create table drivers(id varchar(10), start_time time, end_time time, start_loc varchar(10), end_loc varchar(10));

insert into drivers values('dri_1', '09:00', '09:30', 'a','b'),('dri_1', '09:30', '10:30', 'b','c'),('dri_1','11:00','11:30', 'd','e');
insert into drivers values('dri_1', '12:00', '12:30', 'f','g'),('dri_1', '13:30', '14:30', 'c','h');
insert into drivers values('dri_2', '12:15', '12:30', 'f','g'),('dri_2', '13:30', '14:30', 'c','h');
*/
-------------------------------------------
/*
create table interview_prep..Companies(c_id int,company_name varchar(50)
	,feb1 DECIMAL(4,1),feb2 DECIMAL(4,1),feb3 DECIMAL(4,1),feb4 DECIMAL(4,1),feb5 DECIMAL(4,1));
;
insert into interview_prep..Companies values
(1, 'Quantum Innovations', 12.5, 14.5, 16.5, 18.5, 20.5),
(2, 'Stellar Solutions', 14.5, 16.5, 18.5, 20.5, 22.5),
(3, 'Nebula Dynamics', 16.5, 18.5, 20.5, 22.5, 24.5),
(4, 'Fusion Enterprises', 18.5, 20.5, 22.5, 24.5, 26.5),
(5, 'Celestial Technologies', 20.5, 22.5, 24.5, 26.5, 28.5)
;

select * from interview_prep.dbo.Companies ;

Task from pyspark:Task - The dataset includes company_id, company_name, and multiple date columns
representing the stock prices of the company. 
The task is to generate a new dataset with only three columns, 'company_name', 'Date', 'Stock_price'.
*/
;

SELECT c_id, company_name, Dates
,(case dates
	when '2024-02-01' then feb1
	when '2024-02-02' then feb2
	when '2024-02-03' then feb3
	when '2024-02-04' then feb4
	else feb5
end) as Stock_Price
FROM interview_prep.dbo.Companies as c
 cross join
(values ('2024-02-01'),
		('2024-02-02'),
		('2024-02-03'),
		('2024-02-04'),
		('2024-02-05'))
as dateColumn(Dates)

------------------------
/* 
CREATE TABLE interview_prep..book_issued (s_id int,sname varchar(20),book_name varchar(50));
insert into interview_prep..book_issued values
(101 ,'Mark' , 'White Tiger'),
(102 ,'Ria' , 'The Fountainhead'),
(102 ,'Ria' , 'The Seceret History'),
(101 ,'Mark' , 'Bhagwad Gita'),
(103 ,'Loi' , 'The Fountainhead')

5.Task--we have a dataset representing books issued by students, and we want to aggregate the books
for each student.Multiple books should be shown separated by ';'
*/

SELECT 
	s_id,sname,STRING_AGG(book_name,';') as all_books
from interview_prep.dbo.book_issued
GROUP by s_id,sname --,book_name


/*
create table interview_prep..arrange_nulls(id int,cust_name varchar(50),amount int);
insert into interview_prep..arrange_nulls VALUES
(1, 'Aditya Sen' , NUll),
(2, 'Bikramaditya' , 200),
(3, 'Mark T' , 100),
(4, 'D K aditya' , null),
(5, 'Danny' , 500),
(6, 'Eli' , 300)


1.'Arranging a column with null values in ascending or descending order.'
Task - Sort the salary column of the dataframe :

*/
--a) in ascending order with NULL values at the top

select * from interview_prep..arrange_nulls 
ORDER by amount 

--b) in ascending order with NULL values at the bottom

	select * from interview_prep..arrange_nulls 
ORDER by (case when amount is null then 1 else 0 end)


--c) in descending order with NULL values at the top
	select * from interview_prep..arrange_nulls 
ORDER by (case when amount is null then 1 else 0 end) DESC

--d)in descending order with NULL values at the bottom
	select * from interview_prep..arrange_nulls 
ORDER by (case when amount is null then 0 else 1 end) DESC




--------------

Karen is working on a complex business requirement. She has created an Employee table with four columns (Empid, empname, Department, and Salary). She wants to display EmpID, Department, and Salary of the fifth lowest salary. How can she achieve this?
Empid	Empname	Department	Salary
1001	Bob	Sales	10000
1002	Abitom	Finance	20000
1003	Jim	Sales	14000
1004	Preston	IT	16000
1005	VictoriaFinance	11000
1006	Allen	IT	14000
1007	Sam	Finance	10000
1008	Cole	IT	12000
1009	Jerry	Sales	14000
1010	Thiery	Sales	11000

--------------
Question 12 of 15
Angela is working on a complex requirement for which she has written a query:
Order By Salary)
Select Empid, Empname, Salary, Rank() Over (Partition By Department,
From Employee.
Identify which operator will be used for this query execution.
Quick Note
If the question is same as the last one or showing blank content, please click 'Reload Question'
Assert Operator
Segment Operator
Hash Match Operator
Lazy Spool operator

--------
Problem Statement
Write a SQL query to create Points table.
This points table will contain 4 column team name, matches played by team, matches won, matches lost.

📅Table schema
create table icc_world_cup
(
Team_1 Varchar(20),
Team_2 Varchar(20),
Winner Varchar(20)
);
INSERT INTO icc_world_cup values('India','SL','India');
INSERT INTO icc_world_cup values('SL','Aus','Aus');
INSERT INTO icc_world_cup values('SA','Eng','Eng');
INSERT INTO icc_world_cup values('Eng','NZ','NZ');
INSERT INTO icc_world_cup values('Aus','India','India');


---------
𝐓𝐡𝐞 𝐂𝐡𝐚𝐥𝐥𝐞𝐧𝐠𝐞: Given a table with 'brands' and missing 'category' values, can you craft an SQL query that 
fills those gaps with the last non-null category? (Edit - Lets solve in PySpark)

My PySpark dataframe API solution is in the comment (backward fill concept using last()over()).

	CREATE TABLE interview_prep..Orders (id int,category varchar(20),brand varchar(20));
insert into interview_prep..Orders VALUES (1,'chocolates','5-star')
,(2,NULL,'dairy milk'),(3,NULL,'perk'),(4,NULL,'eclair')
,(5,'Biscuits','britannia'),(6,NULL,'good day'),(7,NULL,'boost')

Select
id,brand,category
,last_value(category) OVER(order by id) as Ncategory
 from interview_prep..Orders


-----------------

Task - You are provided with two datasets, branch1 and branch2 , representing information
 about students and their marks in different subjects across different branches. 
 Your goal is to combine these datasets into one final dataset. 
 Missing text information should be shown as 'unknown' ,
  and missing numerical information should be shown as -9999.

create table interview_prep..branch1 (Branch varchar(20),Student varchar(20),Maths_marks int);
insert into interview_prep..branch1 values ('Delhi', 'Neha', 90)
create table interview_prep..branch2 ( Student varchar(20),Branch  varchar(20),Science_marks int,Maths_marks int);
insert into interview_prep..branch2 values 
('Arav','Kolkata', 79, 83),(NULL,'Kolkata', 89, 73)

with students_union as (
	select b1.branch,b1.student,null as science_marks,b1.maths_marks 
	from interview_prep..branch1 as b1
	union all
	select b2.branch,b2.student,b2.science_marks,b2.maths_marks
	from interview_prep..branch2 as b2
)
select branch,coalesce(student,'Unknown') as student
,coalesce(science_marks,-9999) as science_marks,maths_marks
from students_union

select @@version

----------------------> from indium soft interview
create table interview_prep..teams(id int,Team varchar(20));
insert into interview_prep..teams VALUES
(1,'India'),(2,'Pakistan'),(3,'Srilanka'),(4,'Australia')

select
concat(a.team,' vs ',b.team) as matches
from interview_prep..teams as a
join interview_prep..teams as b
on a.id < b.id
order by a.team

select
concat(a.team,' vs ',b.team) as matches
from interview_prep..teams as a
,interview_prep..teams as b
where a.id < b.id

--->
Question: You have a table named "Students" with columns "StudentID", "Name", and "Score".
Write a SQL query to retrieve the top student based on their scores from each subject.
Include their names scores and subject in the result.			


create table interview_prep..students_marks (ID int ,Name varchar(20),Subject varchar (20),Marks int)
insert into interview_prep..students_marks values 
(1	,'John','Math'	    ,95),(2	,'Emily','Math'	    ,89),
(3	,'Michael','Math'	,92),(4	,'Sophia','Math'	,98),
(5	,'William','Math'	,85),(6	,'Olivia','Science' ,91),
(7	,'James','Science'  ,88),(8	,'Ava','Science'    ,94),
(9,'Benjamin','Science' ,96),(10,'Mia','Science',    87),
(11	,'Harvey','Math',98),(12,'Donna','Science',96)

select * from (select *
--,row_number() over(PARTITION by subject order by marks desc ) as rownum
--,rank() over(PARTITION by subject order by marks desc) as srank
,dense_rank() over(PARTITION by subject order by marks desc) as srank
from interview_prep..students_marks
) as one
where srank=1

------------------
/*
𝐏𝐫𝐨𝐛𝐥𝐞𝐦 𝐒𝐭𝐚𝐭𝐞𝐦𝐞𝐧𝐭:
𝐘𝐨𝐮 𝐚𝐫𝐞 𝐠𝐢𝐯𝐞𝐧 𝐭𝐡𝐞 𝐩𝐫𝐢𝐜𝐞 𝐨𝐟 𝐞𝐚𝐜𝐡 𝐬𝐤𝐮 𝐰𝐡𝐞𝐧𝐞𝐯𝐞𝐫 𝐭𝐡𝐞𝐫𝐞 𝐢𝐬 𝐚 𝐜𝐡𝐚𝐧𝐠𝐞 𝐢𝐧 𝐩𝐫𝐢𝐜𝐞.
Write an SQL query 𝐭𝐨 𝐟𝐢𝐧𝐝 𝐭𝐡𝐞 𝐩𝐫𝐢𝐜𝐞 𝐚𝐭 𝐭𝐡𝐞 𝐬𝐭𝐚𝐫𝐭 𝐨𝐟 𝐞𝐚𝐜𝐡 𝐦𝐨𝐧𝐭𝐡 & 𝐜𝐚𝐥𝐜𝐮𝐥𝐚𝐭𝐞 𝐭𝐡𝐞 𝐝𝐢𝐟𝐟𝐞𝐫𝐞𝐧𝐜𝐞 𝐟𝐫𝐨𝐦 𝐭𝐡𝐞 𝐩𝐫𝐞𝐯𝐢𝐨𝐮𝐬 𝐦𝐨𝐧𝐭𝐡'𝐬  𝐬𝐭𝐚𝐫𝐭 𝐝𝐚𝐭𝐞.

𝐓𝐚𝐛𝐥𝐞 𝐒𝐜𝐫𝐢𝐩𝐭:

create table interview_prep..sku (sku_id int,
price_date date ,
price int
);
insert into interview_prep..sku values
(1,'2023-01-01',10),(1,'2023-02-15',15),(1,'2023-03-03',18)
,(1,'2023-03-27',15),(1,'2023-04-06',20);

*/
select *  FROM interview_prep..sku

    WITH MonthlyPrices AS (
      SELECT 
        sku_id,
        FORMAT(MIN(cast(price_date as date)), 'YY-mm-01') AS start_of_month,
        MIN(price) AS starting_price
      FROM interview_prep..sku
      GROUP BY sku_id, FORMAT(cast(price_date as date), 'YY-mm-01') 
    )
    
    SELECT
      mp.sku_id,
      mp.start_of_month,
      mp.starting_price,
      LAG(mp.starting_price) OVER (PARTITION BY mp.sku_id ORDER BY mp.start_of_month) AS previous_month_starting_price,
      mp.starting_price - LAG(mp.starting_price) OVER (PARTITION BY mp.sku_id ORDER BY mp.start_of_month) AS price_difference
    FROM MonthlyPrices mp
    ORDER BY mp.sku_id, mp.start_of_month


	select format(cast('2023-01-01' as date), '25-MM-yy' )




