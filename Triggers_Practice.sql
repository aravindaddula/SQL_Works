CREATE TRIGGER Upd_Bal ON ITCRATS..transactions
AFTER UPDATE
AS
declare @avl_bal decimal(10,2)=(select avl_bal from ITCRATS..accounts where client_id=1);
declare @c_id int =1;
declare @amt decimal(10,2)=(select amount from ITCRATS..transactions where client_id=@c_id);
declare @trn_type char(1)=(select trn_type from ITCRATS..transactions where client_id=@c_id);
BEGIN
	IF ( select trn_type from ITCRATS..transactions where client_id=@c_id )='C'
		BEGIN
			update ITCRATS..accounts set avl_bal=@avl_bal+@amt,trn_type=@trn_type,last_updated=GETDATE() where client_id=@c_id;
		END
	ELSE
	BEGIN 
		update ITCRATS..accounts set avl_bal=@avl_bal-@amt,trn_type=@trn_type,last_updated=GETDATE() where client_id=@c_id;
	END
END



/*
create table transactions(client_id int,Amount decimal(10,2),trn_type char(1))
create table accounts( client_id int,Avl_bal decimal(10,2),trn_type char(1),last_updated datetime)
insert into transactions values (3,250,'C')
insert into accounts values(2,1000,'C',getdate())

select * from transactions;
select * from accounts;
*/
UPDATE TRANsactions set Amount=500,trn_type='C' where client_id=1





	-- select * from INFORMATION_SCHEMA.TABLES

	select *,UnitsInStock from northWind.dbo.Products
	--ALTER TABLE northWind.dbo.Products add UpdatedOn DATETIME

	ALTER TRIGGER Update_UnitsInStock
	ON NorthWind.dbo.products
	AFTER update
	AS
	BEGIN
	IF(Products.UnitsInStock<5 )
		begin 
		UPDATE northWind.dbo.Products SET UnitsInStock=10 
	END IF

	UPDATE northWind.dbo.Products set UpdatedOn=null
	UnitsInStock=5 where ProductID=5