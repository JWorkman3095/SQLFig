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


SELECT *
FROM Invoices
WHERE ((InvoiceTotal - PaymentTotal - CreditTotal <= 0) AND
      PaymentDate IS NULL) OR
      ((InvoiceTotal - PaymentTotal - CreditTotal > 0) AND
      PaymentDate IS NOT NULL);

INSERT INTO Invoices (VendorID, InvoiceNumber, InvoiceDate, InvoiceTotal, TermsID, InvoiceDueDate)
VALUES (12, '3289175', '2/18/2020', 165, 3, '3/18/2020')

SELECT * FROM Invoices
WHERE InvoiceNumber = '3289175'

DELETE FROM Invoices
WHERE InvoiceNumber = '3289175';

SELECT * FROM Invoices
WHERE InvoiceNumber = '3289175'

UPDATE INVOICES
SET CreditTotal = 99.10
WHERE InvoiceNumber = '963253264';

USE AP;
SET 

UPDATE INVOICES
SET CreditTotal = 99.00
WHERE InvoiceNumber = '367447'

UPDATE Invoices
SET CreditTotal = 99.00
WHERE InvoiceID = 94;

-- CHPATER 4

--select InvoiceNumber, VendorName
--from Vendors join Invoices
--	ON Vendors.VendorID = InvoiceID 

SELECT InvoiceNumber, VendorName
FROM  Vendors INNER JOIN Invoices
	ON Vendors.VendorID = Invoices.VendorID

SELECT InvoiceNumber, InvoiceLineItemAmount, InvoiceLineItemDescription 
FROM Invoices JOIN InvoiceLineItems AS LineItems
	ON Invoices.InvoiceID = LineItems.InvoiceID
WHERE AccountNo = 540
ORDER BY InvoiceDate;

--AFTER BREAK LINK SERVER (DBO)

SELECT InvoiceNumber, InvoiceDate, InvoiceTotal, InvoiceLineItemAmount
FROM Invoices JOIN InvoiceLineItems AS LineItems
	on (Invoices.InvoiceID = LineItems.InvoiceID) AND
	(Invoices. InvoiceTotal > LineItems.InvoiceLineItemAmount)
ORDER BY InvoiceNumber

SELECT InvoiceNumber, InvoiceDate, InvoiceTotal, InvoiceLineItemAmount
	FROM Invoices JOIN InvoiceLineItems AS LineItems
		on Invoices.InvoiceID = LineItems.InvoiceLineItemAmount
		order by InvoiceNumber

SELECT DISTINCT Vendors1.VendorName, Vendors1.VendorCity
FROM Vendors AS Vendors1 JOIN Vendors AS Vendors2
	ON (Vendors1.VendorCity = Vendors2.VendorCity) AND
		(Vendors1.VendorState = Vendors2.VendorState) AND
		(Vendors1.VendorID <> Vendors2.VendorID)
		Order by Vendors1.VendorState, Vendors1.VendorCity

--explict syntax
SELECT VendorName, InvoiceNumber, InvoiceDate,
		InvoiceLineItemAmount AS LineItemAmount,
		AccountDescription
	From Vendors
		JOIN Invoices ON Vendors.VendorID = Invoices.VendorID
		JOIN InvoiceLineItems ON Invoices.InvoiceID = InvoiceLineItems.InvoiceID
		JOIN GLAccounts ON InvoiceLineItems.AccountNo = GLAccounts.AccountNo
Where InvoiceTotal -PaymentTotal - CreditTotal > 0
Order BY VendorName, InvoiceLineItemAmount DESC;

--implicit syntax did not do
--a statement that joins four tables - you don't really know where you are joining at in this one

--Outer Join
--explict syntax
Select VendorName, InvoiceNumber, InvoiceTotal
From Vendors LEFT JOIN Invoices ON Vendors.VendorID = Invoices.VendorID
ORDER BY VendorName
--SAME AS ABOVE
Select VendorName, InvoiceNumber, InvoiceTotal
From Vendors LEFT OUTER JOIN Invoices ON Vendors.VendorID = Invoices.VendorID
ORDER BY VendorName
--RIGHT JOIN
Select VendorName, InvoiceNumber, InvoiceTotal
From Vendors RIGHT OUTER JOIN Invoices ON Vendors.VendorID = Invoices.VendorID
ORDER BY VendorName

--A LEFT OUTER JOIN
USE Examples --we updated databases and USE that DB after we EXCUTED that sample DB
SELECT DeptName, Departments.DeptNo, LastName
FROM Departments Left Join Employees
	ON Departments.DeptNo = Employees.DeptNo;

--Ctrl  A
--Ctrl C
--Pastes into a Txt and save

USE Examples
SELECT DeptName, Employees.DeptNo, LastName
FROM Departments RIGHT JOIN Employees
	ON Departments.DeptNo = Employees.DeptNo;

SELECT DeptName, Employees.DeptNo, LastName
FROM Departments Left JOIN Employees
	ON Departments.DeptNo = Employees.DeptNo;

-- Full Outer Join
SELECT DeptName, Employees.DeptNo, LastName
FROM Departments FULL JOIN Employees
	ON Departments.DeptNo = Employees.DeptNo;

Use Examples
SELECT DeptName, Employees.DeptNo, LastName
FROM Departments LEFT JOIN Employees
	ON Departments.DeptNo = Employees.DeptNo;
		LEFT JOIN Projects
			ON Employee.EmployeeID = Projects.EmployeeID
ORDER BY DeptName, LastName, ProjectNo;

SELECT DeptName, LastName, ProjectNo
FROM Departments LEFT JOIN Employees
	ON Departments.DeptNo = Employees