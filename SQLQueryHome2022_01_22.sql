
--Figure 1-12
SELECT InvoiceNumber, InvoiceDate, InvoiceTotal, PaymentTotal, CreditTotal,  
	InvoiceTotal - PaymentTotal - CreditTotal AS BalanceDue
FROM Invoices
Where InvoiceTotal - PaymentTotal - CreditTotal > 0
ORDER BY InvoiceDate;

--Figure 1-13
Select VendorName, InvoiceNumber, InvoiceDate, InvoiceTotal
FROM Vendors INNER JOIN Invoices
	ON Vendors.VendorID = Invoices.VendorID
WHERE InvoiceTotal >= 500
ORDER BY VendorName, InvoiceTotal DESC;

--Figure 1-14
--INSERT INTO Invoices (VendorID, InvoiceNumber, InvoiceDate, 
--	InvoiceTotal, TermsID, InvoiceDueDate)
--VALUES (12, '3289175', '2/18/2020', 165, 3, '3/18/2020');

--UPDATE Invoices
--SET CreditTotal = 35.89
--WHERE InvoiceNumber = '367447';

--UPDATE Invoices
--SET InvoiceDueDate = InvoiceDueDate + 30
--WHERE TermsID = 4;

--DELETE From Invoices
--WHERE InvoiceNumber = '4-342-8069';

--DELETE From Invoices
--WHERE InvoiceTotal - PaymentTotal - CreditTotal = 0;

--Figure 1-15
SELECT InvoiceNumber, InvoiceDate, InvoiceTotal,
	InvoiceTotal - PaymentTotal - CreditTotal AS BalanceDue
FROM Invoices
WHERE InvoiceTotal - PaymentTotal - CreditTotal > 0
--WHERE 'BalanceDue' > 0 ***WHY NOT THIS***
ORDER BY InvoiceDate;

/*
Aurthor: Joel Murach
Date: 1/20/2020
*/
SELECT InvoiceNumber, InvoiceDate, InvoiceTotal,
	InvoiceTotal - PaymentTotal - CreditTotal AS BalanceDue
	--The fourth column calcuates the balance due for each invoice
FROM Invoices;

--Figure 1-16

--CREATE VIEW VendorMin AS
--	SELECT VendorName, VendorState, VendorPhone
--	FROM Vendors;
--**Already a VendorMin Create in this DB**

SELECT * FROM VendorMin 
WHERE VendorState = 'CA'
ORDER BY VendorName;

--Figure 1-17
--CREATE PROCEDURE spVendorsByState @StateVar char(2) AS
--	SELECT VendorName, VendorState, VendorPhone
--	FROM Vendors
--	WHERE VendorState = @StateVar
--	ORDER BY VendorName;
--Commands completed successfully. Completion time: 2022-01-21T21:21:09.2738640-05:00

EXEC spVendorsBYState 'CA';

--Chapter 2 **

--Chapter 3
--Figure 3-2
SELECT *
FROM Invoices; 

SELECT InvoiceNumber, InvoiceDate, InvoiceTotal FROM Invoices
ORDER BY InvoiceTotal; 

SELECT InvoiceID, InvoiceTotal, CreditTotal  + PaymentTotal AS TotalCredit
FROM Invoices
WHERE InvoiceID = 17

SELECT InvoiceNumber, InvoiceDate, InvoiceTotal
FROM Invoices
WHERE InvoiceDate BETWEEN '2020-01-01' AND '2020-03-01'
ORDER BY InvoiceDate;

SELECT InvoiceNumber, InvoiceDate, InvoiceTotal
FROM Invoices
WHERE InvoiceTotal > 50000;

--Figure 3-3 Defining
--Figure 3-4
SELECT InvoiceNumber AS [Invoice Number], InvoiceDate AS Date,
	InvoiceTotal AS Total
FROM Invoices

SELECT [Invoice Number] = InvoiceNumber, Date = InvoiceDate,
	Total = InvoiceTotal 
FROM Invoices;

SELECT InvoiceNumber, InvoiceDate, InvoiceTotal, 
	InvoiceTotal - PaymentTotal - CreditTotal 
FROM Invoices;

--Figure 3-5
SELECT VendorCity, VendorState, VendorCity + VendorState 
FROM Vendors;

SELECT VendorName,
	VendorCity + ', ' + VendorState + ' ' + VendorZipCode AS Address
FROM Vendors

SELECT VendorName + '''s Address: ',
	VendorCity + ', ' + VendorState + ' ' VendorZipCode
FROM Vendors

SELECT VendorCity, VendorState, VendorCity + VendorState
FROM Vendors

SELECT VendorName,
VendorCity + ', ' + VendorState + ' ' + VendorZipCode AS Address 
FROM Vendors;

--Figure 3-6
SELECT InvoiceTotal, PaymentTotal, CreditTotal,
	InvoiceTotal - PaymentTotal - CreditTotal AS BalanceDue
FROM Invoices;

SELECT InvoiceID,
	InvoiceID + 7 * 3 AS OrderOfPrescedence,
	(InvoiceID + 7) * 3 AS AddFirst
FROM Invoices

SELECT InvoiceID,
	InvoiceID / 10 AS Quotient,
	InvoiceID % 10 AS Remainder
FROM Invoices
ORDER BY InvoiceID;

--Figure 3-7
SELECT VendorContactFName, VendorContactLName,
	LEFT(VendorContactFName, 1) +
	LEFT(VendorContactLName, 1) AS Initials
FROM Vendors;

 SELECT 'Invoice: #' + InvoiceNumber
	+ ', dated ' + CONVERT(char(8), PaymentDate, 1)
	+ ' for $' + CONVERT(varchar(9), PaymentTotal, 1) 
FROM Invoices;

SELECT InvoiceDate,
	GETDATE() AS 'Today''s Date',
	DATEDIFF(day, InvoiceDate, GETDATE()) AS Age 
FROM Invoices;

--1/22/2020
-- Figure 3-8

SELECT VendorCity, VendorState
FROM Vendors
ORDER BY VendorCity;

--This one elimates duplicates using te DISTINCT
SELECT DISTINCT VendorCity, VendorState
FROM Vendors;

--Figure 3-9
SELECT TOP 5 VendorID, InvoiceTotal
FROM Invoices
ORDER BY InvoiceTotal DESC;

SELECT TOP 5 PERCENT VendorID, InvoiceTotal 
FROM Invoices
ORDER BY InvoiceTotal DESC;

--FIGURE 3-10
SELECT InvoiceNumber, InvoiceDate, InvoiceTotal, Invoice
--WHERE VendorState = 'NJ' AND YTDPurchases > 200FROM Invoices
--WHERE VendorState = 'NJ' OR YTDPurchases > 200
--WHERE NOT (InvoiceTotal >= 5000 OR NOT InvoiceDate <= '2020-02-01')
--WHERE InvoiceTotal < 5000 AND InvoiceDate <= '2020-02-01'
SELECT InvoiceNumber, InvoiceDate, InvoiceTotal,
	InvoiceTotal - PaymentTotal - CreditTotal AS BalanceDue
FROM Invoices
WHERE InvoiceDate > '01/01/2020' OR InvoiceTotal > 500	AND InvoiceTotal - PaymentTotal - CreditTotal > 0 

-- FIGURE 3-11 Copied from Book
--WHERE (InvoiceDate > '01/01/2020' OR InvoiceTotal > 500)--AND InvoiceTotal - PaymentTotal - CreditTotal > 0 

---FROM CLASS **** 1/21/2022*****

SELECT VendorContactFName, VendorContactLName, VendorName
FROM Vendors
ORDER BY VendorContactLName, VendorContactFName;

SELECT InvoiceNumber AS Number,
       InvoiceTotal AS Total,
       PaymentTotal + CreditTotal AS Credits,
       InvoiceTotal - (PaymentTotal + CreditTotal) AS Balance
FROM Invoices;

SELECT VendorContactLName + ', ' + VendorContactFName AS [Full Name]
FROM Vendors
ORDER BY VendorContactLName, VendorContactFName;

SELECT InvoiceTotal, InvoiceTotal / 10 AS [10%],
       InvoiceTotal * 1.1 AS [Plus 10%]
FROM Invoices
WHERE InvoiceTotal - PaymentTotal - CreditTotal > 1000
ORDER BY InvoiceTotal DESC;

-- Chapter 3 pg 106 BETWEEN AND

SELECT InvoiceNumber AS Number,
       InvoiceTotal AS Total,
       PaymentTotal + CreditTotal AS Credits,
       InvoiceTotal - (PaymentTotal + CreditTotal) AS Balance
FROM Invoices
WHERE InvoiceTotal BETWEEN 500 AND 10000;
--Also acceptable:
--WHERE InvoiceTotal >= 500 AND InvoiceTotal <= 10000;

SELECT VendorContactLName + ', ' + VendorContactFName AS [Full Name]
FROM Vendors
WHERE VendorContactLName LIKE '[A-C,E]%'
--Also acceptable:
--WHERE VendorContactLName LIKE '[A-E]%' AND
--      VendorContactLName NOT LIKE 'D%'
ORDER BY VendorContactLName, VendorContactFName

--pg 114
SELECT *
FROM Invoices
WHERE ((InvoiceTotal - PaymentTotal - CreditTotal <= 0) AND
      PaymentDate IS NULL) OR
      ((InvoiceTotal - PaymentTotal - CreditTotal > 0) AND
      PaymentDate IS NOT NULL);

-- ** This was added to db to show vales in the next command

--INSERT INTO Invoices (VendorID, InvoiceNumber, InvoiceDate, InvoiceTotal, TermsID, InvoiceDueDate)
--VALUES (12, '3289175', '2/18/2020', 165, 3, '3/18/2020')

SELECT * FROM Invoices
WHERE InvoiceNumber = '3289175'

--DELETE FROM Invoices
--WHERE InvoiceNumber = '3289175';

SELECT * FROM Invoices
WHERE InvoiceNumber = '3289175'

--UPDATE INVOICES
--SET CreditTotal = 99.10
--WHERE InvoiceNumber = '963253264';

--USE AP;
--SET 

--UPDATE INVOICES
--SET CreditTotal = 99.00
--WHERE InvoiceNumber = '367447'

--UPDATE Invoices
--SET CreditTotal = 99.00
--WHERE InvoiceID = 94;

--------- ******** AT HOME Pg 117 Chapter 3 Continued
--Figure 3-16

SELECT VendorName,
	VendorCity + ', ' + VendorState + ' ' + VendorZipCode AS Address
FROM Vendors
ORDER BY VendorName;

SELECT VendorName,
	VendorCity + ', ' + VendorState + ' ' + VendorZipCode AS Address
FROM Vendors
ORDER BY VendorName DESC;

SELECT VendorName,VendorCity + ', ' + VendorState + ' ' + VendorZipCode AS AddressFROM VendorsORDER BY VendorState, VendorCity, VendorName;--Figure 3-17SELECT VendorName,
	VendorCity + ', ' + VendorState + ' ' + VendorZipCode AS Address
FROM Vendors
ORDER BY Address, VendorName;

SELECT VendorName,
	VendorCity + ', ' + VendorState + ' ' + VendorZipCode AS Address
FROM Vendors
ORDER BY VendorContactLName, VendorContactFName

SELECT VendorName,
	VendorCity + ', ' + VendorState + ' ' + VendorZipCode AS Address
FROM Vendors
ORDER BY 2, 1;

--Figure 3-18
SELECT VendorID, InvoiceTotal
FROM Invoices
	ORDER BY InvoiceTotal DESC
	OFFSET 0 ROWS
	FETCH FIRST 5 ROWS ONLY;

SELECT VendorName, VendorCity, VendorState, VendorZipCode FROM Vendors	WHERE VendorState = 'CA'		ORDER BY VendorCity OFFSET 10 ROWS	FETCH NEXT 10 ROWS ONLY;--which starts at ROW 11--WITHOUT THE FETCH clauseSELECT VendorName, VendorCity, VendorState, VendorZipCode FROM Vendors	WHERE VendorState = 'CA'		ORDER BY VendorCity OFFSET 10 ROWS--END OF CHAPTER 3