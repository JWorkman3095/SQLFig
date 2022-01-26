--Chapter 11 
CREATE DATABASE New_AP;

USE New_AP

--Create Table
CREATE TABLE Vendors1 (VendorID INT,
						VendorName VARCHAR(50));

CREATE TABLE Invoices1 (InvoiceID INT PRIMARY KEY IDENTITY, 
						VendorID INT NOT NULL,
						InvoiceDate DATE NULL,
						InvoiceTotal MONEY Null DEFAULT 0);
						--Non
--NonClustered
CREATE INDEX IX_VendorID on Invoices1 (VendorID);

CREATE TABLE InvoiceLineItems_Temp
(
	InvoiceID			INT		NOT NULL,
	InvoiceSequence		SMALLINT    NOT NULL,
	INVOICELINEITEMAMOUNT   MONEY   NOT NULL,
	Primary KEY (InvoiceID, InvoiceSequence)
	);

CREATE TABLE Vendors9
(
	VendorID	INT NOT NULL PRIMARY KEY,
	VendorName	VARCHAR(50) NOT NULL
);

CREATE TABLE Invoices9
(
	InvoiceID		INT NOT NULL PRIMARY KEY,
	VendorID		INT NOT NULL REFERENCES Vendors9 (VendorID),
	InvoiceTotal	MONEY NULL
);

--Insert some data
INSERT INTO Vendors9 (VendorID, VendorName) VALUES (99, 'Test Vendor')
SELECT *
FROM Vendors9;

-- Fails because of the 99 which falls under the Primary Key, if it were 97 it would work.)
INSERT Invoices9 (InvoiceID, VendorID, InvoiceTotal) VALUES (1, 99, 100)

INSERT Invoices9 (InvoiceID, VendorID, InvoiceTotal) VALUES (1, 97, 100)

Select *
FROM Invoices9

--Drop ALL
--DROP DATABASE New_AP
--DROP TABLE Invoices1;
--DROP TABLE Vendors1;
--DROP TABLE InvoiceLineItems_Temp;

--Didn't delete b/c I want to use this

ALTER TABLE Vendors1
ADD LastTransDate Date NULL

----- GREG EXercise



