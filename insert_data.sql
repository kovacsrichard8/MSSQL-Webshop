INSERT INTO dbo.Customers (First_Name, Last_Name, Phone_Number, Email_Address)
VALUES ('Bence', 'Kovács', '+36301234567', 'kovacs.bence92@gmail.com'),
('Tamás', 'Horváth', '+36705551212', 'h.tamas.work@t-online.hu'),
('Enikő', 'Molnár', '+36202583697', 'eniko.molnar01@freemail.hu'),
('Zsuzsanna', 'Kiss', '+36304448899', 'kiss.zsuzsi496@gmail.com'),
('Mátyás', 'Szabó', '+36702225544', 'szabo.m1987@outlook.com'),
('Péter', 'Farkas', '+36306663322', 'petiwolf@gmail.com'),
('Aliz', 'Varga', '+36209974526', 'varga.alizzz64@freemail.hu'),
('Márk', 'Balogh', '+36201234569', 'balogh.mark.gamer@gmail.com'),
('Krisztina', 'Tóth', '+36308796521', 'krisztatoth2345@gmail.com'),
('Emil', 'Erdősi', '+36705632147', 'emil.forest68@t-online.hu');

INSERT INTO dbo.Product_Categories (Category_Name)
VALUES ('Smartphones'), ('Laptop'), ('Gaming'), ('Television'), ('Household Appliances'); 

INSERT INTO dbo.Products (Product_Name, Price, Product_Category_Id)
VALUES ('iPhone 16 128 Gb', 274000, 1),
('Motorola Edge 60 Fusion 128 Gb', 103000, 1),
('Google Pixel 10a 256 Gb', 334999, 1),
('MacBook Air 13" 2025', 423900, 2),
('MacBook Neo 13" 2026', 318900, 2),
('Dell Pro 15 Essential', 359990, 2),
('Resident Evil Requiem PS5', 28890, 3),
('Call of duty: Black Ops 7 PS4', 12890, 3),
('Harry Potter Hogwarts Legacy PS5', 18990, 3),
('55" TCL 55V6C', 111990, 4),
('65" Hisense 65E7Q PRO', 182990, 4),
('55" Samsung QE55QN70F', 196990, 4),
('AEG L6SE26DE Washing Machine', 161900, 5),
('BOSCH SMV4ENX06E Dishwasher', 165990, 5),
('GORENJE MO20E1W Microwave', 24990, 5);

INSERT INTO dbo.Orders (Order_Status, Customer_Id)
VALUES ('Pending', 1), ('Completed', 2), ('Completed', 3), ('Completed',4), ('Pending', 5), ('Completed', 6), 
('Completed', 7), ('Completed', 8), ('Completed', 9), ('Pending', 10), ('Completed', 2), ('Completed', 4), 
('Pending', 6), ('Completed', 8), ('Pending', 10), ('Completed', 1), ('Pending', 3), ('Completed',5), 
('Completed', 7), ('Pending', 9);

INSERT INTO dbo.Order_Items (Orders_Id, Product_Id, Quantity, Unit_Price)
VALUES (1, 2, 2, 103000), (1, 1, 1, 274000), (2, 4, 1, 423900), (3, 7, 2, 28890), (4, 13, 2, 161900), 
(5, 10, 1, 111990), (6, 15, 3, 24990), (7, 3, 1, 334999), (8, 9, 2, 18990), (9, 14, 1, 165990), (10, 5, 1, 318900), 
(11, 12, 1, 196990), (12, 2, 1, 103000), (13, 8, 2, 12890), (14, 6, 1, 359990), (15, 11, 1, 182990), (1, 15, 1, 24990),
(5, 3, 1, 334999), (10, 12, 1, 196990), (12, 1, 1, 274000), (15, 4, 1, 423900), (6, 1, 1, 274000), (7, 4, 1, 423900),
(8, 10, 1, 111990), (2, 5, 1, 318900), (3, 8, 1, 12890), (4, 15, 2, 24990), (13, 9, 1, 18990), (14, 1, 1, 274000), (15, 13, 1, 161900);

INSERT INTO dbo.Payments (Payment_Method, Payment_Status, Payment_Date, Amount, Orders_Id)
SELECT 'Cash', 'Paid', 2026-04-13, SUM (Quantity*Unit_Price), Orders_Id 
FROM dbo.Order_Items
WHERE Orders_Id = 1
GROUP BY Orders_Id;

INSERT INTO dbo.Payments (Payment_Method, Payment_Status, Payment_Date, Amount, Orders_Id)
SELECT 'Card', 'Paid', 2026-04-22, SUM (Quantity*Unit_Price), Orders_Id 
FROM dbo.Order_Items
WHERE Orders_Id = 2
GROUP BY Orders_Id;

INSERT INTO dbo.Payments (Payment_Method, Payment_Status, Payment_Date, Amount, Orders_Id)
SELECT 'Card', 'Paid', 2026-04-24 18:59:23, SUM (Quantity*Unit_Price), Orders_Id 
FROM dbo.Order_Items
WHERE Orders_Id = 4
GROUP BY Orders_Id;

INSERT INTO dbo.Payments (Payment_Method, Payment_Status, Payment_Date, Amount, Orders_Id)
SELECT 'Card', 'Unpaid', 2026-05-01 12:54:02, SUM (Quantity*Unit_Price), Orders_Id 
FROM dbo.Order_Items
WHERE Orders_Id = 5
GROUP BY Orders_Id;

INSERT INTO dbo.Payments (Payment_Method, Payment_Status, Payment_Date, Amount, Orders_Id)
SELECT 'Cash', 'Unpaid', 2026-05-02 09:30:18, SUM (Quantity*Unit_Price), Orders_Id 
FROM dbo.Order_Items
WHERE Orders_Id = 6
GROUP BY Orders_Id;

INSERT INTO dbo.Payments (Payment_Method, Payment_Status, Payment_Date, Amount, Orders_Id)
SELECT 'Cash', 'Unpaid', 2026-05-04 22:48:09, SUM (Quantity*Unit_Price), Orders_Id 
FROM dbo.Order_Items
WHERE Orders_Id = 7
GROUP BY Orders_Id;

INSERT INTO dbo.Payments (Payment_Method, Payment_Status, Payment_Date, Amount, Orders_Id)
SELECT 'Card', 'Paid', 2026-05-04 23:18:22, SUM (Quantity*Unit_Price), Orders_Id 
FROM dbo.Order_Items
WHERE Orders_Id = 9
GROUP BY Orders_Id;

INSERT INTO dbo.Payments (Payment_Method, Payment_Status, Payment_Date, Amount, Orders_Id)
SELECT 'Cash', 'Unpaid', 2026-05-04 23:18:22, SUM (Quantity*Unit_Price), Orders_Id 
FROM dbo.Order_Items
WHERE Orders_Id = 10
GROUP BY Orders_Id;

INSERT INTO dbo.Payments (Payment_Method, Payment_Status, Payment_Date, Amount, Orders_Id)
SELECT 'Cash', 'Paid', 2026-05-05 07:04:40, SUM (Quantity*Unit_Price), Orders_Id 
FROM dbo.Order_Items
WHERE Orders_Id = 10
GROUP BY Orders_Id;

INSERT INTO dbo.Payments (Payment_Method, Payment_Status, Payment_Date, Amount, Orders_Id)
SELECT 'Cash', 'Unpaid', 2026-05-06 11:07:52, SUM (Quantity*Unit_Price), Orders_Id 
FROM dbo.Order_Items
WHERE Orders_Id = 12
GROUP BY Orders_Id;

UPDATE dbo.Payments 
SET Orders_Id = 11
WHERE Payment_Method ='Cash' AND Payment_Status ='Paid' AND Payment_Date = 2026-05-05 07:04:40;

UPDATE dbo.Orders SET Order_Date = '2026-04-11 11:28:49' WHERE Id = 1;

UPDATE dbo.Orders SET Order_Date = '2026-04-21 23:45:53' WHERE Id = 2;

UPDATE dbo.Orders SET Order_Date = '2026-04-23 16:22:11' WHERE Id = 3;

UPDATE dbo.Orders SET Order_Date = '2026-04-24 18:59:42' WHERE Id = 4;

UPDATE dbo.Orders SET Order_Date = '2026-05-01 12:54:19' WHERE Id = 5;

UPDATE dbo.Orders SET Order_Date = '2026-05-02 09:30:45' WHERE Id = 6;

UPDATE dbo.Orders SET Order_Date = '2026-05-01 12:54:19' WHERE Id = 7;

UPDATE dbo.Orders SET Order_Date = '2026-05-20 12:54:19' WHERE Id = 8;

UPDATE dbo.Orders SET Order_Date = '2026-05-04 23:19:01' WHERE Id = 9;

UPDATE dbo.Orders SET Order_Date = '2026-05-05 07:05:40' WHERE Id = 10;

UPDATE dbo.Orders SET Order_Date = '2026-05-05 07:04:58' WHERE Id = 11;

UPDATE dbo.Orders SET Order_Date = '2026-05-06 11:08:17' WHERE Id = 12;

UPDATE dbo.Orders SET Order_Date = '2026-05-08 14:10:49' WHERE Id = 13;

UPDATE dbo.Orders SET Order_Date = '2026-05-08 16:29:05' WHERE Id = 14;

UPDATE dbo.Orders SET Order_Date = '2026-05-09 11:04:38' WHERE Id = 15;

UPDATE dbo.Orders SET Order_Date = '2026-05-10 12:47:02' WHERE Id = 16;

UPDATE dbo.Orders SET Order_Date = '2026-05-12 21:22:22' WHERE Id = 17;

UPDATE dbo.Orders SET Order_Date = '2026-05-13 23:02:21' WHERE Id = 18;

UPDATE dbo.Orders SET Order_Date = '2026-05-18 06:18:39' WHERE Id = 19;

UPDATE dbo.Orders SET Order_Date = '2026-05-19 13:14:53' WHERE Id = 20;

UPDATE dbo.Orders 
SET Order_Status = 'Completed' 
WHERE Id = 1;

UPDATE dbo.Orders
SET Order_Status = 'Cancelled'
WHERE Id = 5;

UPDATE dbo.Orders
SET Order_Status = 'Pending'
WHERE Id = 6;

UPDATE dbo.Orders
SET Order_Status = 'Cancelled'
WHERE Id = 7;

UPDATE dbo.Orders
SET Order_Status = 'Pending'
WHERE Id = 12;