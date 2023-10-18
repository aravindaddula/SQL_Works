exec sp_columns managers
select * from information_schema.table_constraints
GO
CREATE PROC allinone
AS 
SELECT * FROM emp
GO;
EXEC allinone
GO

ALTER PROCEDURE get_all_employees @job nvarchar(30)
AS 
SELECT * FROM emp WHERE JOB = @job
EXEC get_all_employees @job = 'SALESMAN'
GO
--WHILE Loops
DECLARE @counter INT = 1;
WHILE @counter <= 5
BEGIN
    PRINT @counter;
    SET @counter = @counter + 1;
END
