-- DECLARE @COUNT INT = 0 ;
-- while @count<6
-- BEGIN
-- SET @COUNT = @COUNT+1
-- PRINT @COUNT
-- END
----------------
-- DECLARE @COLNAME VARCHAR(50)
IF NOT EXISTS ( SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE
TABLE_NAME = 'MYPRODUCTS' AND COLUMN_NAME = (
    
))
BEGIN
ALTER TABLE ITCRATS.DBO.MYPRODUCTS 
ADD AgentName varchar(25),AgentId int,AgentAddress varchar(50),Age int
print 'COLUMNS ADDED'
END
ELSE
BEGIN
PRINT '--------- WARNING --------- ' + CHAR(10) + 'COLUMNS ALREADY EXIST or Table Doesnt Exist'
END

-- STORE ALL COLUMNS INTO A VARIABLE AND COMPARE INSIDE THAT IF COLUMNS YOU ARE GONNA CREATE EXIST OR NOT.

DECLARE @COLNAME VARCHAR(MAX),@count int = 0
-- SET @COLNAME = '';
set @COLNAME=(SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='MYPRODUCTS');
PRINT @COLNAME

SELECT 
@COLNAME=@COLNAME + CHAR(10) + COLUMN_NAME
from INFORMATION_SCHEMA.columns where TABLE_NAME='MYPRODUCTS';

while @count<=(select count(column_name) from information_schema.columns where table_name = 'myproducts')
    BEGIN

    END
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'MYPRODUCTS'