-- Viewing FactInternet Sales Table Col = 37 & Rows = 660398 --
SELECT*
FROM FactInternetSales; 

--Exploring Data Reveals 10 Different SalesTerritoryKey --
SELECT DISTINCT SalesTerritoryKey
FROM FactInternetSales
ORDER BY SalesTerritoryKey ASC;

-- Filtering Relavant Information and Renaming Col --
SELECT SalesOrderNumber AS InvoiceNumber,OrderDate,SalesAmount,TaxAmt AS TaxAmount,OrderQuantity
FROM FactInternetSales;


-- Invoice Number "S051182" Repeated With Different Sales Amounts, Lets Create an InvoiceSubtotal -- 
SELECT SalesOrderNumber AS InvoiceNumber,
       OrderDate,
       SUM(SalesAmount) AS InvoiceSubTotal,
       SUM(TaxAmt) AS TaxAmount,
       SUM(OrderQuantity) AS TotalQuantity
FROM FactInternetSales
WHERE SalesOrderNumber = 'SO51182'
GROUP BY SalesOrderNumber, OrderDate;

-- Lets View Sales above 1000 in Sales Territory 6 : 715 Rows Returned --
SELECT SalesOrderNumber AS InvoiceNumber,
       OrderDate,
       SUM(SalesAmount) AS InvoiceSubTotal,
       SUM(TaxAmt) AS TaxAmount,
       SUM(OrderQuantity) AS TotalQuantity
FROM FactInternetSales
WHERE SalesTerritoryKey = 6
GROUP BY SalesOrderNumber, OrderDate
HAVING SUM(SalesAmount) > 1000
ORDER BY InvoiceSubTotal DESC;

-- Lets Add a Top(N) Filter
SELECT TOP(10) PERCENT
       SalesOrderNumber AS InvoiceNumber,
       OrderDate,
       SUM(SalesAmount) AS InvoiceSubTotal,
       SUM(TaxAmt) AS TaxAmount,
       SUM(OrderQuantity) AS TotalQuantity
FROM FactInternetSales
WHERE SalesTerritoryKey = 6
GROUP BY SalesOrderNumber, OrderDate
HAVING SUM(SalesAmount) > 1000
ORDER BY InvoiceSubTotal DESC;

