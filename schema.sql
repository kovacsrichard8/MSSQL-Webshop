CREATE TABLE Customers (
Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
First_Name NVARCHAR(150) NOT NULL,
Last_Name NVARCHAR(150) NOT NULL,
Phone_Number NVARCHAR(50) NOT NULL,
Email_Address NVARCHAR(150) UNIQUE NOT NULL);

CREATE TABLE Product_Categories (
Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
Category_Name NVARCHAR(150) UNIQUE NOT NULL);

CREATE TABLE Products (
Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
Product_Name NVARCHAR(150) NOT NULL,
Price DECIMAL(10,2) NOT NULL CHECK (Price > 0),
Product_Category_Id INT NOT NULL,
CONSTRAINT Fk_Product_Categories
FOREIGN KEY (Product_Category_Id) REFERENCES Product_Categories (Id));

CREATE TABLE Orders (
Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
Order_Status NVARCHAR(150) NOT NULL CHECK (Order_Status IN ('Pending', 'Completed')),
Customer_Id INT NOT NULL,
CONSTRAINT Fk_Customers
FOREIGN KEY (Customer_Id) REFERENCES Customers (Id));

CREATE TABLE Payments (
Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
Payment_Method NVARCHAR(150) NOT NULL CHECK (Payment_Method IN ('Cash', 'Card')),
Payment_Status NVARCHAR(150) NOT NULL DEFAULT 'Unpaid' CHECK (Payment_Status IN ('Paid', 'Unpaid')),
Payment_Date DATETIME,
Amount DECIMAL(10,2) NOT NULL CHECK (Amount > 0),
Orders_Id INT NOT NULL,
CONSTRAINT Fk_Orders_Payments
FOREIGN KEY (Orders_Id) REFERENCES Orders (Id));

CREATE TABLE Order_Items (
Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
Orders_Id INT NOT NULL,
Product_Id INT NOT NULL,
Quantity INT NOT NULL CHECK (Quantity > 0),
Unit_Price DECIMAL(10,2) NOT NULL,
CONSTRAINT Fk_Orders_Order_Items
FOREIGN KEY (Orders_Id) REFERENCES Orders (Id),
CONSTRAINT Fk_Products
FOREIGN KEY (Product_Id) REFERENCES Products (Id)); 

SELECT TABLE_NAME, CONSTRAINT_TYPE, CONSTRAINT_NAME
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'Orders' 
AND CONSTRAINT_TYPE = 'CHECK';

ALTER TABLE Orders
DROP CONSTRAINT CK__Orders__Order_St__5441852A;

ALTER TABLE Orders
ADD CONSTRAINT CHK_Order_Status CHECK (Order_Status IN ('Pending', 'Completed', 'Cancelled'));

ALTER TABLE Orders 
ADD Order_Date DATE;

ALTER TABLE Orders
ALTER COLUMN Order_Date DATETIME;