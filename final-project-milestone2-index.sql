USE myShoeBusiness;
GO
CREATE INDEX idx_Zipcode ON Customers(Zipcode);
GO
CREATE INDEX idx_Location ON Orders(LocationID);
GO
CREATE INDEX idx_Customer ON Orders(CustomerID);
GO 
CREATE INDEX idx_OrderID ON OrderDetails(OrderID);
GO
CREATE INDEX idx_InventoryNumber ON OrderDetails(Inventory#);