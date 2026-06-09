SELECT 
o.Id, 
c.First_Name,
c.Last_Name,
p.Product_Name,
oi.Quantity,
oi.Unit_Price,
oi.Quantity * oi.Unit_Price AS Overall_Price
FROM dbo.Order_Items oi
INNER JOIN dbo.Orders o
ON oi.Orders_Id=o.Id
INNER JOIN dbo.Customers c
ON o.Customer_Id=c.Id
INNER JOIN dbo.Products p
ON oi.Product_Id=p.Id;

SELECT Orders_Id,
SUM (Quantity * Unit_Price) AS Final_Sum
FROM Order_Items
GROUP BY Orders_Id;

SELECT Customer_Id, 
COUNT (Customer_Id) AS Orders_Number
FROM dbo.Orders
GROUP BY Customer_Id;

SELECT Product_Id,
SUM (Quantity) AS Ordered_Products
FROM dbo.Order_Items
GROUP BY Product_Id
ORDER BY Ordered_Products DESC;

SELECT Product_Category_Id,
COUNT (Product_Category_Id) AS Numbers_of_Product_Category
FROM dbo.Products
GROUP BY Product_Category_Id;

SELECT 
c.First_Name,
c.Last_Name
FROM dbo.Customers c
LEFT JOIN dbo.Orders o
ON c.Id=o.Customer_Id
WHERE o.Id IS NULL;

SELECT 
o.Id,
p.Payment_Status
FROM dbo.Orders o
LEFT JOIN dbo.Payments p
ON o.Id=p.Orders_Id
WHERE Payment_Status = 'Paid' OR Payment_Status = 'Unpaid';

CREATE VIEW View_Of_Indexes AS
SELECT 
i.name
FROM sys.indexes AS i
INNER JOIN sys.data_spaces AS ds
ON i.data_space_id = ds.data_space_id;

SELECT * FROM dbo.View_Of_Indexes;







