--USE master
--Create DataBase JWMusic

USE JWMusic;

CREATE Table Customers (
	Id int primary key identity(1,1),
	Name VarChar(30) NOT NULL,
	Sales decimal NOT NULL default 0
);

CREATE TABLE Orders (
	Id int Primary Key Identity(1,1),
	Description VarChar(80),
	OrderTotal decimal NOT NULL Default 0,
	CustomerID int NOT NULL Foreign Key References Customers(Id)
);

Insert into Customers (Name, Sales)
	VALUES ('MAX Technical Training', 1000);

Insert into Customers (Name, Sales)
	VALUES ('Workman Music Place', 500)

Insert into Customers (Name, Sales)
	VALUES ('MARS Music', 6000), ('Aurora Class of 1983', 420);

Insert into Customers (Name, Sales)
	VALUES ('Jeff Ryan', 1000), ('Art Workman', 420), ('Joey Said No Band', 5678);

SELECT * FROM Customers

----Input Orders 

--INSERT into Orders (Description, OrderTotal, CustomerID)
--	VALUES ('My First Order', 200, 1);

INSERT INTO Orders (Description, OrderTotal, CustomerID)
	VALUES ('Oct Totals', 200, 1);

SELECT *
FROM Customers

SELECT *
FROM Orders

SELECT ID, Name AS CUSName, Sales
FROM Customers