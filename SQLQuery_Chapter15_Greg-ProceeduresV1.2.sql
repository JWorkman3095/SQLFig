CREATE OR ALTER Procedure DisVendorsByAccountNos
AS 
--Created a Procedure useing V1.1
--Now stored in AP/Programmablity/Store Procedures

DECLARE @LowAccountNo int = 200
Declare @HighAccountNo int = 450

SELECT VendorName, DefaultAccountNo, AccountDescription
	FROM Vendors AS v
	Join GLAccounts as g
		on v.DefaultAccountNo = g.AccountNo
	WHERE DefaultAccountNo between @LowAccountNo and @HighAccountNo
	Order By VendorName; 