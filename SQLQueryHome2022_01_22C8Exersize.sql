--01/25/2022
--Chapter 8 Exercises
---- From https://docs.microsoft.com/en-us/sql/t-sql/functions/cast-and-convert-transact-sql?view=sql-server-ver15

USE AP;

SELECT CAST(InvoiceTotal AS decimal(17,2)) AS CastAsDecimal,
       CAST(InvoiceTotal AS varchar) AS CastAsVarchar,
       CONVERT(decimal(17,2),InvoiceTotal) AS ConvertToDecimal,
       CONVERT(varchar,InvoiceTotal, 1) AS ConvertToVarchar
FROM Invoices;

SELECT CAST(InvoiceTotal AS varchar) AS CastASVarchar, 
	   CONVERT(varchar, InvoiceTotal, 1) AS ConvertToVarchar1,
	   CONVERT(varchar, InvoiceTotal, 10) AS ConvertToVarchar10
FROM Invoices;