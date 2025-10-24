-- Scenario : Marketing Team Asks to Identify Top Customers (Top 100) By Sales with Email Adresses
-- Combining of FactInternetSales (Sales Info) & DimCustomer (Customer Info) Tables --
SELECT *
FROM FactInternetSales AS fs
    INNER JOIN DimCustomer AS dc
    ON fs.CustomerKey = dc.CustomerKey;

 -- We have our List of Customer Name , Email Address & Amount Spent
SELECT TOP(100)
CONCAT(dc.FirstName,' ',dc.LastName) AS CustomerName,
dc.EmailAddress AS EmailAddress,
fs.SalesAmount AS AmountSpent
   

FROM FactInternetSales AS fs
    INNER JOIN DimCustomer AS dc
    ON fs.CustomerKey = dc.CustomerKey;   

-- Further Organise/Order the Query --
SELECT TOP(100)
CONCAT(dc.FirstName,' ',dc.LastName) AS CustomerName,
dc.EmailAddress AS EmailAddress,
SUM(fs.SalesAmount) AS AmountSpent
   

FROM FactInternetSales AS fs
    INNER JOIN DimCustomer AS dc
    ON fs.CustomerKey = dc.CustomerKey

GROUP BY dc.FirstName, dc.LastName, dc.EmailAddress
ORDER BY AmountSpent DESC;

-- Marketing Team Want to limit results to Customers in USA --

SELECT TOP (1000) [CurrencyKey]
      ,[CurrencyAlternateKey]
      ,[CurrencyName]
  FROM [dbo].[DimCurrency];

 -- Investigation reveals 150 Different Currencey Keys / Lets Filter for US Dollar  -- 

SELECT TOP(100)

    CONCAT(dc.FirstName,' ',dc.LastName) AS CustomerName,
    dc.EmailAddress AS EmailAddress,
    SUM(fs.SalesAmount) AS AmountSpent,
    dcy.CurrencyName AS Currency

FROM FactInternetSales AS fs
    INNER JOIN DimCustomer AS dc
    ON fs.CustomerKey = dc.CustomerKey
    INNER JOIN DimCurrency AS dcy
    ON fs.CurrencyKey = dcy.CurrencyKey

WHERE dcy.CurrencyName = N'US Dollar'

GROUP BY dc.FirstName, dc.LastName, dc.EmailAddress, dcy.CurrencyName

ORDER BY AmountSpent DESC
