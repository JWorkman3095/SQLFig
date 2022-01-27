CREATE OR ALTER Procedure DisplayVendorsByAccountNos
	@LowAccountNo int = 0,
	@HighAccountNo int = 1000
AS 

SELECT VendorName, DefaultAccountNo, AccountDescription
	FROM Vendors AS v
	Join GLAccounts as g
		on v.DefaultAccountNo = g.AccountNo
	WHERE DefaultAccountNo between @LowAccountNo and @HighAccountNo
	Order By VendorName;