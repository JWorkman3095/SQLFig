-- Chapter 6 Exercises

SELECT Distinct VendorName
FROM Vendors Join Invoices
	ON Vendors.VendorID = Invoices.VendorID
ORDER BY VendorName

SELECT VendorName
FROM Vendors
WHERE VendorID IN
	(SELECT VendorID FROM Invoices)
ORDER BY VendorName;


-- Q2.

SELECT InvoiceNumber, InvoiceTotal
FROM Invoices
WHERE PaymentTotal > 
	
ORDER BY InvoiceNumber, InvoiceTotal


-- Answer

SELECT InvoiceNumber, InvoiceTotal
FROM Invoices
WHERE PaymentTotal >
     (SELECT AVG(PaymentTotal)
      FROM Invoices
      WHERE PaymentTotal <> 0);

