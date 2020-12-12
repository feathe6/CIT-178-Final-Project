 /* Final Project Procedures */

/* Task #1 
-- Stored Procedure that Retrieves and Displays data.
USE myShoeBusiness;
GO
CREATE PROC spInventory
AS 
SELECT * FROM Inventory
ORDER BY Brand;
GO

EXEC spInventory;*/

/* Task #2 
-- Stored Procedure that takes 1 or more input parameters and retrieves results.
USE myShoeBusiness;
GO 
CREATE PROC spGetCustomer
		@CustomerFirst varchar(30)
AS
BEGIN
		SELECT * FROM Customers
		WHERE FirstName = @CustomerFirst;
END
GO
-- Retrieves the customer zack based on first name and returns all his data
EXEC spGetCustomer 'Zack'*/

/* Task #3 
-- Takes one input parameter and returns three output parameters
USE myShoeBusiness;
GO
CREATE PROC spCustomerContact
	@CustomerID int,
	@FirstName nvarchar(30) OUTPUT,
	@LastName nvarchar(50) OUTPUT,
	@PhoneNumber nvarchar(30) OUTPUT 
AS
SELECT @FirstName = FirstName, @LastName = LastName, @PhoneNumber = PhoneNumber
FROM Customers 
WHERE CustomerID = @CustomerID;
GO
-- Run the procedure
DECLARE @FirstName nvarchar(30);
DECLARE @LastName nvarchar(50);
DECLARE @Phone nvarchar(30);
EXEC spCustomerContact 4, @FirstName OUTPUT, @LastName OUTPUT, @Phone OUTPUT;
SELECT @FirstName AS 'First Name', @LastName AS 'Last Name', @Phone AS 'Phone Number';*/

/* Task #4 
-- Create a stored procedure that includes a return value
USE myShoeBusiness;
GO 
CREATE PROC spInventoryCount
AS
DECLARE @InventoryCount int;
SELECT @InventoryCount = COUNT(*)
FROM Inventory
RETURN @InventoryCount;
GO

DECLARE @InventoryCount int;
EXEC @InventoryCount = spInventoryCount;
PRINT 'There are ' + CONVERT(varchar, @InventoryCount) + ' Items of Inventory in the database';
GO*/



/* Final Project User Defined Functions */
/* Task #1 
--Creating Function to grab inventory from db.
USE myShoeBusiness;
GO
CREATE FUNCTION fnGetItem
    (@ItemName nvarchar(50) = '%')
    RETURNS int
BEGIN
    RETURN (SELECT InventoryID FROM Inventory WHERE ProductName Like @ItemName);
END; 

-- uses the function
GO
SELECT InventoryID, Brand, Price FROM Inventory 
WHERE InventoryID = dbo.fnGetItem('Yeezy%');*/


/* Task #2 
-- Create a table function that accepts at least one argument 
USE myShoeBusiness;
GO
CREATE FUNCTION fnCustomers
	(@CustomerFirst nvarchar(50) = '%')
	 RETURNS table
RETURN
	(SELECT * FROM Customers WHERE FirstName LIKE @CustomerFirst);
GO 
SELECT * FROM dbo.fnCustomers('%Z%');*/

 /* Final Project Triggers */
 /* Task #1 
 --  Create a trigger that will add deleted data from one of your tables into an archive or transaction table
 USE myShoeBusiness;
 GO 
 SELECT * INTO InventoryLogTable
 FROM Inventory
 WHERE 1=0;

 --add an activity column to update new table
 ALTER TABLE InventoryLogTable
 ADD Activity varchar(50);
 GO

  -- create delete trigger
 CREATE TRIGGER Inventory_Delete ON Inventory
    AFTER DELETE
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @InventoryID int
	DECLARE @Brand nvarchar(30)
	DECLARE @ProductName nvarchar(30)
	DECLARE @Size nvarchar(10)
	DECLARE @Price money
	DECLARE @Description nvarchar(60)
	DECLARE @MyCost money
	DECLARE @Authentication nvarchar(10)

SELECT @InventoryID =DELETED.InventoryID, @Brand =DELETED.Brand, @ProductName = DELETED.ProductName,
	@size = DELETED.Size, @Price = DELETED.Price, @Description = DELETED.Description, @MyCost = DELETED.MyCost,
	@Authentication = DELETED.Authentication
	FROM DELETED

INSERT INTO InventoryLogTable VALUES(@InventoryID,@Brand,@ProductName,@Size,@Price,@Description,@MyCost,@Authentication, 'Deleted')
END
GO
INSERT INTO Inventory VALUES(33,'BAPE','CAMO BAPEMASK','M',100.00,'Pink Camo BAPE face mask',120.00,'100%')
SELECT * FROM Inventory;

DELETE FROM Inventory WHERE InventoryID = 33;
GO

SELECT * FROM InventoryLogTable;
SELECT * FROM Inventory;
 
INSERT INTO Inventory VALUES(33,'BAPE','CAMO BAPEMASK','M',100.00,'Pink Camo BAPE face mask',120.00,'100%')*/
-- I inserted the data back because I actually purchased the Item.

 /* Task #2 
 -- Creating Archive Table with no rows to add data when rows are inserted.
 USE myShoeBusiness;
 GO 
 SELECT * INTO shoeCustomersArchive
 FROM Customers
 WHERE 1=0;

 --update the table and i'm adding a collumn to store what goes on.
 ALTER TABLE shoeCustomersArchive
 ADD Activity varchar(50);
 GO

 -- insert trigger
 CREATE TRIGGER shoeCustomer_INSERT ON Customers
	AFTER INSERT
AS 
BEGIN
	SET NOCOUNT ON;
	DECLARE @CustomerID int
		DECLARE @FirstName nvarchar(30)
		DECLARE @LastName nvarchar(30)
		DECLARE @Address nvarchar(30)
		DECLARE @Email nvarchar(30)
		DECLARE @PhoneNumber nvarchar(15)
		DECLARE @ZipCode nvarchar(10)

SELECT @CustomerID =INSERTED.CustomerID, @FirstName = INSERTED.FirstName, @LastName = INSERTED.LastName,
@Address = INSERTED.Address, @Email = INSERTED.Email, @PhoneNumber = INSERTED.PhoneNumber, @ZipCode = INSERTED.Zipcode
FROM INSERTED

INSERT INTO shoeCustomersArchive VALUES(@CustomerID,@FirstName,@LastName,@Address,@Email,@PhoneNumber,@ZipCode, 'Inserted' )
END 
GO

-- Now we add a row into the database to see if the trigger worked.
INSERT INTO Zipcode VALUES('48503','Hidden Leaf','NULL') -- had to insert a row into Zipcode because it had a foreign key constraint.
INSERT INTO Customers VALUES(99, 'Mitsuki','Moon', '199 Hidden Leaf DR','mitsukki@naruto.net','(231)-231-3333','48503');
GO

SELECT * FROM Customers;
SELECT * FROM Zipcode;
SELECT * FROM shoeCustomersArchive;*/

/* Task #3 
-- Create an update trigger that adds to the archive or transaction table when a row is modified

 CREATE TRIGGER shoeCustomer_Update ON Customers
	AFTER UPDATE
AS 
BEGIN
	SET NOCOUNT ON;
	DECLARE @CustomerID int
		DECLARE @FirstName nvarchar(30)
		DECLARE @LastName nvarchar(30)
		DECLARE @Address nvarchar(30)
		DECLARE @Email nvarchar(30)
		DECLARE @PhoneNumber nvarchar(15)
		DECLARE @ZipCode nvarchar(10)

SELECT @CustomerID =INSERTED.CustomerID, @FirstName = INSERTED.FirstName, @LastName = INSERTED.LastName,
@Address = INSERTED.Address, @Email = INSERTED.Email, @PhoneNumber = INSERTED.PhoneNumber, @ZipCode = INSERTED.Zipcode
FROM INSERTED

INSERT INTO shoeCustomersArchive VALUES(@CustomerID,@FirstName,@LastName,@Address,@Email,@PhoneNumber,@ZipCode, 'Inserted' )
END 
GO

--Adding new row to test trigger
INSERT INTO Zipcode VALUES('48603','Fire Nation','NULL') -- had to insert a row into Zipcode because it had a foreign key constraint.
INSERT INTO Customers VALUES(88, 'Inojin','Rock', '408 Fire Nation DR','Inojini@naruto.net','(231)-231-3433','48603');
GO

UPDATE Customers
SET PhoneNumber = '231-563-8093'
WHERE CustomerID = 88;
GO
-- view all tables and new data
SELECT * FROM Customers;
SELECT * FROM Zipcode;
SELECT * FROM shoeCustomersArchive;*/
