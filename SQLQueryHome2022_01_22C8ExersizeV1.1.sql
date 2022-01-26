--Chapter 8 Exercises
-- 1. ----- *****DID NOT GET*****------
SELECT CAST(InvoiceTotal AS decimal(17,2)) AS CastAsDecimal,
	   CAST(InvoiceTotal as varchar) AS CastmASVarChar,
	   CONVERT(Decimal (17,2), InvoiceTotal) AS ConvertASDecimal
FROM Invoices;

USE AP;

SELECT CAST(InvoiceTotal AS decimal(17,2)) AS CastAsDecimal,
       CAST(InvoiceTotal AS varchar) AS CastAsVarchar,
       CONVERT(decimal(17,2),InvoiceTotal) AS ConvertToDecimal,
       CONVERT(varchar,InvoiceTotal,1) AS ConvertToVarchar
FROM Invoices;

--2.---GOT IT!!!
SELECT CAST (InvoiceDate AS VarChar) AS CastAsVarChar,
	CONVERT (VarChar, InvoiceDate,1) AS ConvertVarchar1,
	CONVERT (VarChar, InvoiceDate,10) AS ConvertVarchar10
FROM Invoices;

--Answer
USE AP;

SELECT CAST(InvoiceDate AS varchar) AS CastAsVarchar,
       CONVERT(varchar,InvoiceDate,1) AS ConvertToStyle1,
       CONVERT(varchar,InvoiceDate,10) AS ConvertToStyle10
FROM Invoices;