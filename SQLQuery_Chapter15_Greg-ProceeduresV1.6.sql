CREATE OR ALTER Procedure AddOrderLine
	@Product varchar(30) = null,
	@Quantity int = null,
	@Price decimal(7,2) = 10,
	@OrderId int = null
AS

IF @Product is null 
Begin 
	Print 'Product is Required';
	Return -1;
END

IF @OrderId is null
Begin
	Print 'OrderId is Required';
	RETURN -2;
END

INSERT INTO OrderLines
	(Product, Quantity, Price, OrderId) Values
	(@Product, @Quantity,@Price,@OrderId);
