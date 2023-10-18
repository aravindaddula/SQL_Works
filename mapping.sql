alter table dept add sal int

select * from dept
CREATE TABLE [tgt_emp_two] (
   [EMPNO] integer NOT NULL,
   [ENAME] varchar(20) NOT NULL,
   [JOB] varchar(20) NOT NULL,
   [MGR] integer,
   [HIREDATE] date NOT NULL,
   [SAL] integer NOT NULL,
   [COMM] integer,
   [DEPTNO] integer NOT NULL,
   );
GO
select * from emp where ename like 's%'

--select * from tgt_emp_one
select * from tgt_emp_two

--task-1: empname ends with 'R' and sal > 2000
--task2: COMM IS NOT NULL
--TASK3:EMPLOYEES WHOSE SAL>MANAGERS
-- task4 : deptno <= 10 -- group 1
			-- deptno <=20 -- group 2
			-- deptno <=30 -- group 3
			-- default group -- new target