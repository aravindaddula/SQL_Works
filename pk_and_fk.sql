create table persons
(id int NOT NULL PRIMARY KEY,
firstname varchar(10),lastname varchar(10),age int)

create table orders(
orderid int NOT NULL PRIMARY KEY,
ordernumber int,
id int foreign key references persons(id))

select * from persons
select * from orders

insert into persons values(2,'Aravind','Addula',23)
insert into orders values(502,102,2)