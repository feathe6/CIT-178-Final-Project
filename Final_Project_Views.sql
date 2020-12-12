/* FInal Project Views*/ 

USE myShoeBusiness;
GO

/* View #1 */
-- updateable view --
CREATE VIEW CurrentInventory
AS
SELECT Brand, ProductName, [Description], Price
FROM Inventory;
GO

-- Original date --
SELECT * FROM CurrentInventory;

-- Updating Product Name --

GO 
UPDATE CurrentInventory
SET ProductName = 'Paul George 2.5'
WHERE Description = 'Playstation Wolf Grey';
GO

-- Displaying New Data --

SELECT * FROM CurrentInventory;

/* View #2 */

-- Creating View --
GO 
CREATE VIEW CustomerInfo
AS
SELECT Customers.CustomerID, FirstName, LastName, PhoneNumber, OrderID, [Date], Address
FROM Customers JOIN Orders ON Customers.CustomerID = Orders.CustomerID;
GO

-- Displaying New View Data --
SELECT * FROM CustomerInfo;

/* View #3 */

-- Creating New View --
GO
CREATE VIEW TopGrossing
AS
SELECT Inventory.InventoryID, ProductName, Brand, Quantity
FROM Inventory JOIN OrderDetails ON Inventory.InventoryID = OrderDetails.Inventory#;
GO

-- Using New View To Display Data --

SELECT * FROM TopGrossing;

/* View #4 */

-- Creating New View --
GO 
CREATE VIEW MostExpensive
AS
SELECT Brand, Price, ProductName 
FROM Inventory 
WHERE Price > 200.00;
GO

-- Using New View To view Data --

SELECT * FROM MostExpensive;