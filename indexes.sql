CREATE INDEX IND_Prod_Cat_Id
ON dbo.Products (Product_Category_Id);

CREATE INDEX IND_Customer_Id
ON dbo.Orders (Customer_Id);

CREATE INDEX IND_Email
ON dbo.Customers (Email_Address);

CREATE INDEX IND_Prod_Name
ON dbo.Products (Product_Name);

CREATE INDEX IND_Prod_Price
ON dbo.Products (Price);

DROP INDEX IND_Email ON dbo.Customers;

CREATE INDEX IND_Orders_Id
ON dbo.Order_Items (Orders_Id);