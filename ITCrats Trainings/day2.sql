SELECT * FROM INFORMATION_SCHEMA.TABLES

SELECT * FROM SALES.ORDERS
create table day2(id int)
create table day2TAB(id int)

alter table day2 add names varchar(20),allChars char(20);
insert into day2 values(27,' ',''),(26,' ',' ')--,(2),(3),(4),(NULL)
insert into day2TAB values(''),(2),(2),(3),(4),(NULL)


SELECT * FROM DAY2 D2 JOIN DAY2TAB D2T ON D2.ID = D2T.ID --- 5 
SELECT * FROM DAY2 D2 LEFT JOIN DAY2TAB D2T ON D2.ID = D2T.ID -- 6 
SELECT * FROM DAY2 D2 RIGHT JOIN DAY2TAB D2T ON D2.ID = D2T.ID --6 
SELECT * FROM DAY2TAB
SELECT LEN(NULL)

select CHARINDEX(REPLICATE('*',4), username) from fullname;