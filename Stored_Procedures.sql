USE ITCRATS
GO
ALTER PROCEDURE DBO.SP_MaxDeptSal_5
@DEPTNO int,
@maxsal nvarchar(10) OUTPUT
As
BEGIN
 SELECT @maxsal=MAX(SAL) FROM EMP
 WHERE DEPTNO=@DEPTNO
print @maxsal
END

EXEC SP_MaxDeptSal_5 10,Maxsal
--------------------------------
select * from tgt_emp_two

CREATE PROCEDURE uspUpdateEmpSalary
(
     @empId int
     ,@salary money
)
AS
BEGIN
    UPDATE dbo.Employee
    SET Salary = @salary
    WHERE EmployeeID = @empId
END
----------------------------------

ALTER PROC DEPT10 @deptno int
AS
SELECT * FROM EMP WHERE DEPTNO=30
GO
EXEC DEPT10 @DEPTNO=30

CREATE PROCEDURE get_production
AS
BEGIN
select * from production.products
END

EXEC get_production
----------------------------------
select * from production.products

CREATE PROCEDURE GET_min_price2(@minprice int,@maxprice int,@name varchar(10))
AS
BEGIN
SELECT * FROM PRODUCTION.PRODUCTS
WHERE LIST_PRICE>@minprice AND
LIST_PRICE<@MAXPRICE AND
PRODUCT_NAME LIKE @NAME+'%'
END

EXEC GET_MIN_PRICE2 @MINPRICE=500,@MAXPRICE=1000,@NAME='E'
