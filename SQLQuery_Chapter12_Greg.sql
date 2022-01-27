--Select * FROM Customers;
--Select * From Orders
--Select * FROM OrderLines;

/*
INSERT into OrderLines
	(Product, Quantity, Price, OrderId) VALUES
	('Echo', 12, 100, 1),
	('Dot', 6, 30, 1),
	('Show', 3, 140, 1);
*/

--Join all thables to show

SELECT *
	FROM Orders o 
	JOIN Customers c
		On o.CustomerID = c.id
	JOIN OrderLines as ol
		ON ol.OrderId = o.id

-- REwritten to clean up and add LineTotal for Total price

SELECT o.Id, o.Description, o.OrderTotal, c.Name, 
		ol.product, ol.Quantity, ol.Price,(ol.Quantity * ol.Price) AS 'LineTotal'
	FROM Orders o 
	JOIN Customers c
		On o.CustomerID = c.id
	JOIN OrderLines as ol
		ON ol.OrderId = o.id;

