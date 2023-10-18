DECLARE @minprice int
SET @MINPRICE=1555
select * from production.products where list_price>@minprice

DECLARE @RESULT VARCHAR(10)
--SET @MAXPRICE=5000
SET @RESULT = (select COUNT(LIST_PRICE) from production.products)
PRINT 'The count of products is '+ @RESULT


DECLARE @ProductName varchar(50),@modelYear int,@price int
SELECT @ProductName=PRODUCT_NAME,@modelYear=MODEL_YEAR,@price=LIST_PRICE
FROM PRODUCTION.PRODUCTS

SELECT @ProductName AS PRODUCTNAME,@modelYear AS MODELYEAR,@price AS PRODUCT_PRICE


alter PROCedure uspGetProductList(
    @model_year SMALLINT
) AS 
BEGIN
    DECLARE @product_list VARCHAR(MAX);
    SET @product_list = '';
    SELECT
        @product_list =@product_list+product_name + char(10)
    FROM production.products WHERE model_year = @model_year
    ORDER BY product_name;
    PRINT @product_list;
END;
exec uspGetProductList 2019

GO;
ALTER PROCEDURE ACCM_VALUES(@MODELYEAR INT)
AS 
BEGIN
DECLARE @GETLIST VARCHAR(MAX)
SET @GETLIST=''
SELECT 
@GETLIST =@GETLIST + PRODUCT_NAME + CHAR(10)
FROM PRODUCTION.PRODUCTS
WHERE MODEL_YEAR=@MODELYEAR
PRINT @GETLIST
END

EXEC ACCM_VALUES 2019

SELECT * FROM PRODUCTION.PRODUCTS
CREATE PROC OUT_PARAM(@LPRICE INT, @PID INT, )
AS
BEGIN
SELECT LIST_PRICE=@LPRICE 
FROM PRODUCTION.PRODUCTS
WHERE PRODUCT_ID=@PID
END
