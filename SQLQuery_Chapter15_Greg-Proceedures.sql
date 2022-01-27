--DECLARE @AccountNo int;
--SET @AccountNo = 572;

--SELECT VendorName, DefaultAccountNo
--	FROM Vendors
--	--Order BY DefaultAccountNo
--	WHERE DefaultAccountNo = 572
--	--Show me all accts tyed to 540
--	--If users keep asking for a new report by this acct then that acct, then again
--	Order By VendorName; 
--	--write a script/ proceedure to allow the user to run this when they want.

DECLARE @AccountNo int;
SET @AccountNo = 572;

SELECT VendorName, DefaultAccountNo
	FROM Vendors
	WHERE DefaultAccountNo = @AccountNo
	Order By VendorName; 

----- between
DECLARE @LowAccountNo int;
Declare @HighAccountNo int;

Set @HighAccountNo = 450;
Set @LowAccountNo = 200;

SELECT VendorName, DefaultAccountNo
	FROM Vendors
	WHERE DefaultAccountNo between @LowAccountNo and @HighAccountNo
	Order By VendorName;