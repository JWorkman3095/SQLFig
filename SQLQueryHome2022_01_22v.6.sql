-- 1/24-2020
-- Chapter 6

-- Fig 6-1

SELECT InvoiceNumber, InvoiceDate, InvoiceTotal
FROM Invoices
WHERE InvoiceTotal > 
    (SELECT AVG(InvoiceTotal)
     FROM Invoices)

-- Gettng the aggregate value
SELECT AVG(InvoiceTotal)
     FROM Invoices

-- Same result with a rewite

SELECT InvoiceNumber, InvoiceDate, InvoiceTotal
FROM Invoices
WHERE InvoiceTotal > 1864.8305
ORDER BY InvoiceTotal

-- Figure 6-2
SELECT InvoiceNumber, InvoiceDate, InvoiceTotal
FROM Invoices JOIN Vendors
    ON Invoices.VendorID = Vendors.VendorID
WHERE VendorState = 'CA'
ORDER BY InvoiceDate;

SELECT InvoiceNumber, InvoiceDate, InvoiceTotal
FROM Invoices
WHERE VendorID IN
    (SELECT VendorID
    FROM Vendors
    WHERE VendorState = 'CA')
ORDER BY InvoiceDate;

-- Fig 6-3
SELECT VendorID, VendorName, VendorState
FROM Vendors
WHERE VendorID NOT IN
    (SELECT DISTINCT VendorID
    FROM Invoices);

-- Fig 6-4

SELECT InvoiceNumber, InvoiceDate, InvoiceTotal,
    InvoiceTotal - PaymentTotal - CreditTotal AS BalanceDue
FROM Invoices
WHERE InvoiceTotal - PaymentTotal - CreditTotal  > 0 
    AND InvoiceTotal - PaymentTotal - CreditTotal <
    (SELECT AVG(InvoiceTotal - PaymentTotal - CreditTotal)
    FROM Invoices
    WHERE InvoiceTotal - PaymentTotal - CreditTotal > 0)
ORDER BY InvoiceTotal DESC;

-- Fig 6-5

SELECT VendorName, InvoiceNumber, InvoiceTotal
FROM Invoices JOIN Vendors ON Invoices.VendorID = Vendors.VendorID
WHERE InvoiceTotal > ALL
    (SELECT InvoiceTotal
    FROM Invoices
    WHERE VendorID = 34)
ORDER BY VendorName;

-- Fig 6-6
--skip to  6-13
USE AP;

WITH Summary AS
(
    SELECT VendorState, VendorName, SUM(InvoiceTotal) AS SumOfInvoices
    FROM Invoices 
        JOIN Vendors ON Invoices.VendorID = Vendors.VendorID
    GROUP BY VendorState, VendorName
),

TopInState AS
(
	SELECT VendorState, MAX(SumOfInvoices) AS SumOfInvoices
    FROM Summary
    GROUP BY VendorState
)

SELECT Summary.VendorState, Summary.VendorName, TopInState.SumOfInvoices
FROM Summary JOIN TopInState
    ON Summary.VendorState = TopInState.VendorState AND
       Summary.SumOfInvoices = TopInState.SumOfInvoices
ORDER BY Summary.VendorState;

-- Chapter 7

-- Figure 7-1

SELECT *
INTO InvoiceCopy
FROM Invoices

INSERT INTO InvoiceCopy
	 (VendorID, InvoiceNumber, InvoiceTotal, PaymentTotal, CreditTotal, 
	 TermsID, InvoiceDate, InvoiceDueDate)

Values
	(97, '456789', 8344.40, 0, 0, 1, '2030-03-01', '2020-03-31');

SELECT PaymentTotal
FROM InvoiceCopy

DROP Table InvoiceCopy

