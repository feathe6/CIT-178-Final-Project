/*USE myShoeBusiness;

--GO
ALTER TABLE Customers WITH CHECK
ADD CONSTRAINT FK_Zipcode FOREIGN KEY(Zipcode) REFERENCES Zipcode(Zipcode)
ON UPDATE CASCADE
--GO

ALTER TABLE Orders WITH CHECK
ADD CONSTRAINT FK_LocationID FOREIGN KEY(LocationID) REFERENCES Locations(LocationID)
ON UPDATE CASCADE
GO
ALTER TABLE Orders WITH CHECK
ADD CONSTRAINT FK_CustomerID FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID)
ON UPDATE CASCADE
GO
ALTER TABLE OrderDetails
ADD CONSTRAINT FK_OrderID FOREIGN KEY(OrderID) REFERENCES Orders(OrderID)
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE OrderDetails
ADD CONSTRAINT FK_Inventory# FOREIGN KEY(Inventory#) REFERENCES Inventory(InventoryID)
ON UPDATE CASCADE
GO */