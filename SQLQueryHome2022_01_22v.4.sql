-- Start Chapter 4
-- Fig 4-1
SELECT InvoiceNumber, VendorName
FROM Vendors JOIN Invoices
    ON Vendors.VendorID = Invoices.VendorID;

-- Fig 4-2
SELECT InvoiceNumber, VendorName, InvoiceDueDate,
    InvoiceTotal - PaymentTotal - CreditTotal AS BalanceDue
FROM Vendors AS v JOIN Invoices AS i
    ON v.VendorID = i.VendorID
WHERE InvoiceTotal - PaymentTotal - CreditTotal > 0
ORDER BY InvoiceDueDate DESC;

USE AP;

SELECT InvoiceNumber, InvoiceLineItemAmount, InvoiceLineItemDescription
FROM Invoices JOIN InvoiceLineItems AS LineItems
    ON Invoices.InvoiceID = LineItems.InvoiceID
WHERE AccountNo = 540
ORDER BY InvoiceDate;

--Fig 4-3 **** I CAN NOT GET REsults****

--Fig 4-4

SELECT InvoiceNumber, InvoiceDate,
    InvoiceTotal, InvoiceLineItemAmount
FROM Invoices JOIN InvoiceLineItems AS LineItems
    ON (Invoices.InvoiceID = LineItems.InvoiceID) AND
       (Invoices.InvoiceTotal > LineItems.InvoiceLineItemAmount)
ORDER BY InvoiceNumber;

SELECT InvoiceNumber, InvoiceDate,
    InvoiceTotal, InvoiceLineItemAmount
FROM Invoices JOIN InvoiceLineItems AS LineItems
    ON Invoices.InvoiceID = LineItems.InvoiceID
WHERE Invoices.InvoiceTotal > LineItems.InvoiceLineItemAmount
ORDER BY InvoiceNumber;

-- Fig 4-5

SELECT DISTINCT Vendors1.VendorName, Vendors1.VendorCity,
    Vendors1.VendorState
FROM Vendors AS Vendors1 JOIN Vendors AS Vendors2
    ON (Vendors1.VendorCity = Vendors2.VendorCity) AND
       (Vendors1.VendorState = Vendors2.VendorState) AND
       (Vendors1.VendorID <> Vendors2.VendorID)
ORDER BY Vendors1.VendorState, Vendors1.VendorCity;

--Fig 4-6

SELECT VendorName, InvoiceNumber, InvoiceDate 
FROM Vendors 
	JOIN Invoices ON Vendors.VendorID = Invoices.VendorID
WHERE InvoiceTotal - PaymentTotal - CreditTotal > 0
ORDER BY VendorName;

SELECT VendorName, InvoiceNumber, InvoiceDate, 
	InvoiceLineItemAmount AS LineItemAmount
FROM Vendors 
	JOIN Invoices ON Vendors.VendorID = Invoices.VendorID
    JOIN InvoiceLineItems On Invoices.InvoiceID = InvoiceLineItems.InvoiceID
WHERE InvoiceTotal - PaymentTotal - CreditTotal > 0
ORDER BY VendorName, LineItemAmount;

SELECT VendorName, InvoiceNumber, InvoiceDate,
       InvoiceLineItemAmount AS LineItemAmount, AccountDescription
FROM Vendors
    JOIN Invoices ON Vendors.VendorID = Invoices.VendorID
    JOIN InvoiceLineItems ON Invoices.InvoiceID = InvoiceLineItems.InvoiceID
    JOIN GLAccounts ON InvoiceLineItems.AccountNo = GLAccounts.AccountNo
WHERE InvoiceTotal - PaymentTotal - CreditTotal > 0
ORDER BY VendorName, LineItemAmount DESC;

--Fig 4-7

SELECT InvoiceNumber, VendorName
FROM Vendors, Invoices
WHERE Vendors.VendorID = Invoices.VendorID;

SELECT VendorName, InvoiceNumber, InvoiceDate,
    InvoiceLineItemAmount AS LineItemAmount, AccountDescription
FROM Vendors, Invoices, InvoiceLineItems, GLAccounts
WHERE Vendors.VendorID = Invoices.VendorID
  AND Invoices.InvoiceID = InvoiceLineItems.InvoiceID
  AND InvoiceLineItems.AccountNo = GLAccounts.AccountNo
  AND InvoiceTotal - PaymentTotal - CreditTotal > 0
ORDER BY VendorName, LineItemAmount DESC;

-- Fig 4-8

SELECT VendorName, InvoiceNumber, InvoiceTotal
FROM Vendors LEFT JOIN Invoices
    ON Vendors.VendorID = Invoices.VendorID
ORDER BY VendorName;

--Fig 4-9

USE Examples;

SELECT DeptName, DeptNo
FROM Departments;

SELECT EmployeeID, LastName, FirstName, DeptNo
FROM Employees;

SELECT DeptName, Departments.DeptNo, LastName
FROM Departments LEFT JOIN Employees
    ON Departments.DeptNo = Employees.DeptNo;

	SELECT DeptName, Employees.DeptNo, LastName
FROM Departments RIGHT JOIN Employees
    ON Departments.DeptNo = Employees.DeptNo;

USE Examples;

SELECT DeptName, Departments.DeptNo, Employees.DeptNo, LastName
FROM Departments FULL JOIN Employees
    ON Departments.DeptNo = Employees.DeptNo;

SELECT DeptName, Departments.DeptNo, LastName
FROM Departments LEFT JOIN Employees
    ON Departments.DeptNo = Employees.DeptNo;

SELECT DeptName, Employees.DeptNo, LastName
FROM Departments RIGHT JOIN Employees
    ON Departments.DeptNo = Employees.DeptNo;

SELECT DeptName, Departments.DeptNo, Employees.DeptNo, LastName
FROM Departments FULL JOIN Employees
    ON Departments.DeptNo = Employees.DeptNo;

-- Fig 4-10
SELECT DeptName, DeptNo
FROM Departments;

SELECT EmployeeID, LastName, FirstName, DeptNo 
FROM Employees;

SELECT * 
FROM Projects;

SELECT DeptName, LastName, ProjectNo
FROM Departments
    LEFT JOIN Employees
        ON Departments.DeptNo = Employees.DeptNo
    LEFT JOIN Projects
        ON Employees.EmployeeID = Projects.EmployeeID
ORDER BY DeptName, LastName, ProjectNo;

SELECT DeptName, LastName, ProjectNo
FROM Departments
    FULL JOIN Employees
        ON Departments.DeptNo = Employees.DeptNo
    FULL JOIN Projects
        ON Employees.EmployeeID = Projects.EmployeeID
ORDER BY DeptName;

-- Fig 4-11

SELECT DeptName, DeptNo
FROM Departments;

SELECT EmployeeID, LastName, FirstName, DeptNo 
FROM Employees;

USE Examples;

SELECT * 
FROM Projects;

SELECT DeptName, LastName, EmployeeID
FROM Departments 
    JOIN Employees
        ON Departments.DeptNo = Employees.DeptNo;

SELECT DeptName, LastName, ProjectNo
FROM Departments 
    JOIN Employees
        ON Departments.DeptNo = Employees.DeptNo
    LEFT JOIN Projects
        ON Employees.EmployeeID = Projects.EmployeeID
ORDER BY DeptName;

-- Fig 4-12

SELECT Departments.DeptNo, DeptName, EmployeeID, LastName
FROM Departments CROSS JOIN Employees
ORDER BY Departments.DeptNo;

SELECT Departments.DeptNo, DeptName, EmployeeID, LastName
FROM Departments, Employees
ORDER BY Departments.DeptNo;

-- Fig 4-13

-- The following statements are only needed if
-- the ActiveInvoices and PaidInvoices tables
-- haven't already been created
/*
USE AP;

SELECT *
INTO Examples..ActiveInvoices
FROM Invoices
WHERE InvoiceTotal - PaymentTotal - CreditTotal > 0;

SELECT *
INTO Examples..PaidInvoices
FROM Invoices
WHERE InvoiceTotal - PaymentTotal - CreditTotal <= 0;
*/

USE Examples;
    SELECT 'Active' AS Source, InvoiceNumber, InvoiceDate, InvoiceTotal
    FROM ActiveInvoices
    WHERE InvoiceDate >= '01/01/2020'
UNION
    SELECT 'Paid' AS Source, InvoiceNumber, InvoiceDate, InvoiceTotal
    FROM PaidInvoices
    WHERE InvoiceDate >= '01/01/2020'
ORDER BY InvoiceTotal DESC;

-- Fig 4-14

USE AP;
    SELECT 'Active' AS Source, InvoiceNumber, InvoiceDate, InvoiceTotal
    FROM Invoices
    WHERE InvoiceTotal - PaymentTotal - CreditTotal > 0
UNION
    SELECT 'Paid' AS Source, InvoiceNumber, InvoiceDate, InvoiceTotal
    FROM Invoices
    WHERE InvoiceTotal - PaymentTotal - CreditTotal <= 0
ORDER BY InvoiceTotal DESC;

USE AP;

    SELECT InvoiceNumber, VendorName, '33% Payment' AS PaymentType,
        InvoiceTotal AS Total, (InvoiceTotal * 0.333) AS Payment
    FROM Invoices JOIN Vendors
        ON Invoices.VendorID = Vendors.VendorID
    WHERE InvoiceTotal > 10000
UNION
    SELECT InvoiceNumber, VendorName, '50% Payment' AS PaymentType,
        InvoiceTotal AS Total, (InvoiceTotal * 0.5) AS Payment
    FROM Invoices JOIN Vendors
        ON Invoices.VendorID = Vendors.VendorID
    WHERE InvoiceTotal BETWEEN 500 AND 10000
UNION
    SELECT InvoiceNumber, VendorName, 'Full amount' AS PaymentType,
        InvoiceTotal AS Total, InvoiceTotal AS Payment
    FROM Invoices JOIN Vendors
        ON Invoices.VendorID = Vendors.VendorID
    WHERE InvoiceTotal < 500
ORDER BY PaymentType, VendorName, InvoiceNumber;

-- Fig 4-15

SELECT FirstName, LastName
FROM Employees;

USE Examples;
	SELECT CustomerFirst, CustomerLast 
	FROM Customers
EXCEPT
	SELECT FirstName, LastName 
	FROM Employees
ORDER BY CustomerLast;

USE Examples;

	SELECT CustomerFirst, CustomerLast 
	FROM Customers
INTERSECT
	SELECT FirstName, LastName 
	FROM Employees;

-- End Of Chapter 4
