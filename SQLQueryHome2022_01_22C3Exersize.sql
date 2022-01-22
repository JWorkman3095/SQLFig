--Chapter 3 Exercises

--1. Write a SELECT statement that returns three columns from the Vendors table:--VendorContactFName, VendorContactLName, and VendorName. Sort the result set by last name, then by first name.SELECT VendorContactFName, VendorContactLName, VendorName
FROM Vendors
Order BY VendorContactLName, VendorContactFName

--2. Write a SELECT statement that returns four columns from the Invoices table,--	 named Number, Total, Credits,and Balance: --		Number	Column alias for the InvoiceNumber column--		Total	Column alias for the InvoiceTotal column--		Credits Sum of the PaymentTotal and CreditTotal columns--		Balance	InvoiceTotal minus the sum of PaymentTotal and CreditTotal--	  Use the AS keyword to assign column aliases.SELECT InvoiceNumber AS Number, 		InvoiceTotal AS Total, 		PaymentTotal + CreditTotal AS Credits,		InvoiceTotal - (PaymentTotal + CreditTotal) AS BalanceFROM Invoices--3. Write a SELECT statement that returns one column from the Vendors table --		named Full Name. Create this column from the VendorContactFName and --		VendorContactLName columns. Format it as follows: last name, comma, first --		name (for example, “Doe, John”). Sort the result set by last name, then by first name.SELECT VendorContactFName + ', ' + VendorContactLName AS [Full Name]FROM VendorsORDER BY VendorContactLName, VendorContactFName;--4.Select InvoiceTotal, InvoiceTotal / 10 AS [10%],	InvoiceTotal * 1.1 AS [PLus 10%]FROM InvoicesWhere InvoiceTotal - CreditTotal - PaymentTotal > 1000ORDER BY InvoiceTotal DESC;--ANSWERSELECT InvoiceTotal, InvoiceTotal / 10 AS [10%],
       InvoiceTotal * 1.1 AS [Plus 10%]
FROM Invoices
WHERE InvoiceTotal - PaymentTotal - CreditTotal > 1000
ORDER BY InvoiceTotal DESC;--5. SELECT InvoiceNumber AS Number, 		InvoiceTotal AS Total, 		PaymentTotal + CreditTotal AS Credits,		InvoiceTotal - (PaymentTotal + CreditTotal) AS BalanceFROM InvoicesWHERE InvoiceTotal >= 500 AND InvoiceTotal < 10000--ANSWERUSE AP;

SELECT InvoiceNumber AS Number,
       InvoiceTotal AS Total,
       PaymentTotal + CreditTotal AS Credits,
       InvoiceTotal - (PaymentTotal + CreditTotal) AS Balance
FROM Invoices
WHERE InvoiceTotal BETWEEN 500 AND 10000;
--Also acceptable:
--WHERE InvoiceTotal >= 500 AND InvoiceTotal <= 10000;--6.SELECT VendorContactLName + ', ' + VendorContactFName AS [Full Name]
FROM Vendors
WHERE VendorContactLName LIKE '[A-C,E]%'
--Also acceptable:
--WHERE VendorContactLName LIKE '[A-E]%' AND
--      VendorContactLName NOT LIKE 'D%'
ORDER BY VendorContactLName, VendorContactFName;--7.--Going to have to try and make since of thisSELECT *
FROM Invoices
WHERE ((InvoiceTotal - PaymentTotal - CreditTotal <= 0) AND
      PaymentDate IS NULL) OR
      ((InvoiceTotal - PaymentTotal - CreditTotal > 0) AND
      PaymentDate IS NOT NULL);