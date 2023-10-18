/*
--your table should contain these fields
 create table UserTable ( userId int ,password varchar(30),PasswordCreateDate date)

 insert into UserTable values
  (100,'123456','2023-07-10')
 , (101,'123456','2023-07-11')
  ,(102,'123456','2023-07-12')
   ,(103,'123456','2023-07-13')
   ,(104,'123456','2023-07-14')
    ,(105,'123456','2023-07-15')
   ,(106,'123456','2023-07-16')
   ,(107,'123456','2023-07-17')

*/


create PROCEDURE CheckPasswordExpiration
    @userId INT,
    @expirationDays INT
AS
BEGIN
    DECLARE @passwordCreateDate DATETIME
	 DECLARE   @isExpired BIT 
	  DECLARE @password NVARCHAR(100)


    -- Get the password creation date or last update date from the user table
    SELECT @passwordCreateDate = PasswordCreateDate
    FROM UserTable
    WHERE UserID = @userId

    IF @passwordCreateDate IS NULL
    BEGIN
        -- Handle the case where the password is not set or the user does not exist
        SET @isExpired = 1
        RETURN
    END

    -- Calculate the expiration date based on the password creation date and expiration days
    DECLARE @expirationDate DATETIME
    SET @expirationDate = DATEADD(DAY, @expirationDays, @passwordCreateDate)

    -- Check if the current date is greater than the expiration date
    IF GETDATE() > @expirationDate
    BEGIN
        -- The password is expired
        SET @isExpired = 1
		SET nocount on;
		print '**********  Your message is here *********'
		print 'Password Expired on ' +cast(@expirationDate as varchar);
		SET nocount off;
    END
    ELSE
    BEGIN
        -- The password is not expired
        SET @isExpired = 0
		SET nocount on;
		print '**********  Your message is here *********'
		print 'The password is not expired';
		SET nocount off;
    END

    -- Update the password last checked date in the user table
    --UPDATE UserTable SET PasswordLastCheckedDate = GETDATE() WHERE UserID=@userId
END

--> give userId, In how many days the password is going to expire
-- EXEC @userId,@expirationDays
EXEC CheckPasswordExpiration 100,2