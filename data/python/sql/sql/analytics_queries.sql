-- Revenue by country

SELECT
    c.Country,
    SUM(f.Revenue) AS TotalRevenue
FROM FactOrder f
JOIN DimCustomer c
    ON f.CustomerID = c.CustomerID
GROUP BY c.Country
ORDER BY TotalRevenue DESC;


-- Revenue by product category

SELECT
    p.Category,
    SUM(f.Revenue) AS TotalRevenue
FROM FactOrder f
JOIN DimProduct p
    ON f.ProductID = p.ProductID
GROUP BY p.Category
ORDER BY TotalRevenue DESC;


-- Monthly revenue

SELECT
    YEAR(OrderDate) AS OrderYear,
    MONTH(OrderDate) AS OrderMonth,
    SUM(Revenue) AS TotalRevenue
FROM FactOrder
GROUP BY
    YEAR(OrderDate),
    MONTH(OrderDate)
ORDER BY
    OrderYear,
    OrderMonth;
