----USE master;

----CREATE DataBase Sales;

Use Sales;

CREATE Table Customers (
	Id int primary key identity(1,1),
	Name VarChar(30) NOT NULL,
	Sales decimal NOT NULL default 0
);

create table Orders (
	Id int primary key identity(1,1),
	Description varchar(80),
	OrderTotal decimal not null default 0,
	--This sets the Foreign Key----------------------------v
	CustomerID int NOT NULL foreign key references Customers(Id)
);
Insert into Customers (Name, Sales)
	VALUES ('MAX Technical Training', 1000);

SELECT * FROM Customers;

INSERT into Orders (Description, OrderTotal, CustomerID)
	VALUES ('My First Order', 200, 1);

SElect * From Orders

SELECT o.Id, Description, OrderTotal, Name
FROM Orders o
Join Customers c
	on c.Id = o.CustomerID


