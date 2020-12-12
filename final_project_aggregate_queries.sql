/* Aggregate Query #1

USE myShoeBusiness;
SELECT Zipcode.State, COUNT(DISTINCT Customers.CustomerID) AS [Customers per State]
FROM Customers JOIN Zipcode ON Customers.Zipcode = Zipcode.Zipcode
GROUP BY Zipcode.State
ORDER BY Zipcode.State DESC; 

	Aggregate Query #2
SELECT MIN(Inventory.Price) AS [Least Expensive Item],
	   MAX(Inventory.Price) AS [Most Expensive Item],
	   AVG(Inventory.Price) AS [Average Amount of an Item]
FROM Inventory;

	Aggregate Query #3
SELECT Zipcode.City, COUNT(Orders.OrderID) AS [Number of Orders]
FROM Customers JOIN Zipcode ON zipcode.zipcode = Customers.Zipcode
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Zipcode.City
ORDER BY Zipcode.City;

	Aggregate Query #4
SELECT MIN(Inventory.MyCost) AS [Least Expensive Item],
	   MAX(Inventory.MyCost) AS [Most Expensive Item],
	   SUM(Inventory.MyCost) AS [Amount I Have Invested]
FROM Inventory;*/
