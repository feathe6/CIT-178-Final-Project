/* USE myShoeBusiness;
GO
INSERT INTO Zipcode VALUES ('10001', 'New York', 'NY')
INSERT INTO Zipcode VALUES ('85001', 'East Lansing', 'MI')
INSERT INTO Zipcode VALUES ('10002', 'Scranton', 'PE')
INSERT INTO Zipcode VALUES ('98261', 'Grand Rapids', 'MI')
INSERT INTO Zipcode VALUES ('49685', 'Traverse City', 'MI')

SELECT * FROM Zipcode;

GO 
INSERT INTO Locations VALUES ('1', 'Website')
INSERT INTO Locations VALUES ('2', 'StockX')
INSERT INTO Locations VALUES ('3', 'Goat App')
INSERT INTO Locations VALUES ('4', 'Instagram')
INSERT INTO Locations VALUES ('5', 'Facebook')
SELECT * FROM Locations;

ALTER TABLE Inventory
ADD Authentication varchar(10);

GO
INSERT INTO Inventory VALUES(1,	'Nike',	'PG 2.5', '10.5', 180.00, 'Playstation Wolf Grey',145.00, '100%')
INSERT INTO Inventory VALUES(2,	'Adidas',	'NMD Hu ', '10', 248.00, 'Pharrell Clear Sky', 251.00, '100%')
INSERT INTO Inventory VALUES(3,	'Jordan',	'Jordan 13 Retro ', '10.5', 148.00, 'Chinese New Year (2020)', 137.00, '100%')
INSERT INTO Inventory VALUES(4,	'Adidas',	'Yeezy 500 ', '10', 273.00, 'Salt', 230.00, '100%')
INSERT INTO Inventory VALUES(5,	'Adidas',	'NMD R1', '7', 155.00, 'Cloud White Solar Red (W)', 135.00, '100%')
INSERT INTO Inventory VALUES(6,	'OFF-White',	'OFF-WHITE x Nike Womes Easy Run', 'S', 180.00, 'Top Blue (W)', 215.00, '100%')

GO
INSERT INTO Customers VALUES(1, 'Jake', 'Blank', '123 Park Place', 'jake@blank.com', '989-123-456', '10001')
INSERT INTO Customers VALUES(2, 'Mark', 'Smoser', '539 Sunset Lane', 'mark@smoser.com', '989-123-457', '85001')
INSERT INTO Customers VALUES(3, 'Blake', 'Smosa', '890 Farm Hills', 'blake@smosa.com', '989-123-458', '10002')
INSERT INTO Customers VALUES(4, 'Maddie', 'Deno', '254 Washington ST', 'maddie@deno.com', '989-123-459', '98261')
INSERT INTO Customers VALUES(5, 'Zack', 'Featherstone', '10349 Deerpath', 'zack@buddah.com', '989-123-460', '49685')


GO
INSERT INTO Orders VALUES(1, '9/24/2020', 1, 5)
INSERT INTO Orders VALUES(2, '9/25/2020', 2, 5)
INSERT INTO Orders VALUES(3, '9/26/2020', 3, 3)
INSERT INTO Orders VALUES(4, '9/27/2020', 1, 4)
INSERT INTO Orders VALUES(5, '9/28/2020', 1, 5)
INSERT INTO Orders VALUES(6, '9/29/2020', 4, 1)
INSERT INTO Orders VALUES(7, '9/30/2020', 5, 2)


GO
INSERT INTO OrderDetails VALUES(1, 1, 1, 1)
INSERT INTO OrderDetails VALUES(2, 1, 2, 2)
INSERT INTO OrderDetails VALUES(3, 2, 3, 1)
INSERT INTO OrderDetails VALUES(4, 2, 1, 3)
INSERT INTO OrderDetails VALUES(5, 3, 1, 1)
INSERT INTO OrderDetails VALUES(6, 3, 2, 1)
INSERT INTO OrderDetails VALUES(7, 4, 1, 2)
INSERT INTO OrderDetails VALUES(8, 4, 1, 1)
INSERT INTO OrderDetails VALUES(9, 5, 1, 2)
INSERT INTO OrderDetails VALUES(10, 5, 1, 1)
*/