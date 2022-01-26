--01-25-2022 
--Chapter 3 Exercise

--1.--GOT IT!
SELECT VendorContactFName, VendorContactLName, VendorName 
FROM Vendors
ORDER BY VendorContactLName, VendorContactFName

--2.--GOT IT!
SELECT InvoiceNumber AS Numbers, 
	InvoiceTotal AS Totals,
	PaymentTotal + CreditTotal AS Credits,
	InvoiceTotal - (PaymentTotal + CreditTotal) AS Balance
FROM Invoices

--3--GOT IT!
SELECT VendorContactLName + ', ' + VendorContactFName AS [Full Name]
From Vendors
ORDER BY VendorContactLName, VendorContactFName;

--4.-- *******DID NOT GET IT!******

SELECT (InvoiceTotal) AS InvoiceTotal,
	--InvoiceTotal / 10 AS [10%], ******* Getting the 10% Value
	InvoiceTotal * 1.1 AS [Plus 10]
FROM Invoices
WHERE InvoiceTotal - PaymentTotal - CreditTotal > 1000 --Balance Due Figure

-- ANSWER*****
SELECT InvoiceTotal, 
	InvoiceTotal / 10 AS [10%],
    InvoiceTotal * 1.1 AS [Plus 10%]
FROM Invoices
WHERE InvoiceTotal - PaymentTotal - CreditTotal > 1000
ORDER BY InvoiceTotal DESC;

--5. --GOT IT

SELECT InvoiceNumber AS Numbers, 
	InvoiceTotal AS Totals,
	PaymentTotal + CreditTotal AS Credits,
	InvoiceTotal - (PaymentTotal + CreditTotal) AS Balance
FROM Invoices
WHERE InvoiceTotal >= 500 AND InvoiceTotal <= 10000;

SELECT InvoiceNumber AS Number,
       InvoiceTotal AS Total,
       PaymentTotal + CreditTotal AS Credits,
       InvoiceTotal - (PaymentTotal + CreditTotal) AS Balance
FROM Invoices
WHERE InvoiceTotal BETWEEN 500 AND 10000;
--Also acceptable:
--WHERE InvoiceTotal >= 500 AND InvoiceTotal <= 10000;

--6. ----****DID NOT GET IT------

SELECT VendorContactLName + ', ' + VendorContactFName AS [Full Name]
From Vendors
ORDER BY VendorContactLName, VendorContactFName;
WHERE VendorContactLName LIKE 'N[^A,B,C,E]',

SELECT VendorContactLName + ', ' + VendorContactFName AS [Full Name]
FROM Vendors
WHERE VendorContactLName LIKE '[A-C,E]%'
--Also acceptable:
--WHERE VendorContactLName LIKE '[A-E]%' AND
--      VendorContactLName NOT LIKE 'D%'
ORDER BY VendorContactLName, VendorContactFName;

--7. ---*****DID NOT GET IT -------

SELECT PaymentDate
FROM Invoices
Where InvoiceTotal - (PaymentTotal + CreditTotal) > 0 AND PaymentDate IS NOT NULL,
	InvoiceTotal - (PaymentTotal + CreditTotal) = 0 AND

	SELECT *
FROM Invoices
WHERE ((InvoiceTotal - PaymentTotal - CreditTotal <= 0) AND
      PaymentDate IS NULL) OR
      ((InvoiceTotal - PaymentTotal - CreditTotal > 0) AND
      PaymentDate IS NOT NULL);






