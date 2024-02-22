/* DDL Scripts

create database interview_prep 
use interview_prep;
create table students(Name varchar(20),Maths int,Science int,English int);
insert into students (Name,  Maths, Science, English)
values('Tilak', 90,40,60),('Raj',30,20,10)

*/
-- Task : unpivot the dataset in the format --> Name,Subject,Marks
-- select * from interview_prep..students

--select Name,


select 
    Name,Subject
    ,(case Subject
        when 'Maths' then Maths
        when 'Science' then Science
        else English
    end) as Marks
from interview_prep..students as std
cross JOIN (values('Maths'),('Science'),('English')) AS Student(Subject)






