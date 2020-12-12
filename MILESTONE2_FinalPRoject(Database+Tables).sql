/* Milestone #2*/
CREATE DATABASE myShoeBusiness; 
GO
USE myShoeBusiness;
CREATE TABLE Inventory(
	InventoryID int NOT NULL,
	Brand varchar(30) NOT NULL,
	ProductName varchar(60) NOT NULL,
	Size varchar(10),
	Price money,
	Description varchar(60),
	MyCost money,
	PRIMARY KEY(InventoryID)
);
GO
CREATE TABLE Customers(
	CustomerID int NOT NULL,
	FirstName varchar(30) NOT NULL,
	LastName varchar(30) NOT NULL,
	Address varchar(30) NOT NULL,
	Email varchar(60),
	PhoneNumber varchar(15),
	Zipcode varchar(10) NOT NULL,
	PRIMARY KEY(CustomerID)
);
GO
CREATE TABLE Zipcode(
	Zipcode varchar(10) NOT NULL,
	City varchar(20),
	State varchar(20),
	PRIMARY KEY(Zipcode)
);
GO
CREATE TABLE Locations(
	LocationID int NOT NULL,
	Name varchar(10),
	PRIMARY KEY(LocationID)
);
GO
CREATE TABLE Orders(
	OrderID int NOT NULL,
	Date varchar(20),
	LocationID int NOT NULL,
	CustomerID int NOT NULL,
	PRIMARY KEY(OrderID)
);
GO
CREATE TABLE OrderDetails(
	OrderDetailID int NOT NULL,
	OrderID int NOT NULL,
	Inventory# int NOT NULL,
	Quantity int,
	PRIMARY KEY(OrderDetailID)
);
GO