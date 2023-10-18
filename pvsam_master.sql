--select * from
create table base_table(code int,[type] int,age int)
insert into base_table values (178,111,1)

create table codes(code int,[type] int,age int,s_idx int,factors int)
insert into codes values(178,111,1,1,0)
,(178,111,1,2,55)
,(178,111,1,3,66)
,(178,111,1,4,77)
,(178,111,1,5,88)

create table prem_entries (code int,[type] int,age int,fa_dur int,la_dur int,prem int)
insert into prem_entries values(178,111,1,0,10,100)
,(178,111,1,0,15,200)
,(178,111,1,0,16,300)