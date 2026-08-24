CREATE TABLE DimCustomer (
    CustomerKey INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT NOT NULL,
    CustomerName VARCHAR(200),
    Country VARCHAR(100)
);


CREATE TABLE DimProduct (
    ProductKey INT IDENTITY(1,1) PRIMARY KEY,
    ProductID INT NOT NULL,
    ProductName VARCHAR(200),
    Category VARCHAR(100),
    UnitPrice DECIMAL(18,2)
);


CREATE TABLE FactOrder (
    OrderKey INT IDENTITY(1,1) PRIMARY KEY,
    OrderID INT NOT NULL,
    CustomerID INT NOT NULL,
    ProductID INT NOT NULL,
    OrderDate DATE,
    Quantity INT,
    UnitPrice DECIMAL(18,2),
    Revenue DECIMAL(18,2)
);
