DECLARE @LowAccountNo int;
Declare @HighAccountNo int;

Set @HighAccountNo = 450;
Set @LowAccountNo = 200;

-- rewritten

DECLARE @LowAccountNo int = 200
Declare @HighAccountNo int = 450

--Set @HighAccountNo = 450;
--Set @LowAccountNo = 200;

SELECT VendorName, DefaultAccountNo, AccountDescription
	FROM Vendors AS v
	Join GLAccounts as g
		on v.DefaultAccountNo = g.AccountNo
	WHERE DefaultAccountNo between @LowAccountNo and @HighAccountNo
	Order By VendorName; 

	--- now I wnt the acct name
	---change to a procure to put in DB