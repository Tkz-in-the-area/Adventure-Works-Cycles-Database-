-- Lets View Custmer Information --
 SELECT FirstName,LastName,YearlyIncome,EmailAddress
 FROM DimCustomer;

-- Categorize Using IF Statement --
SELECT FirstName,LastName,YearlyIncome,EmailAddress,
 IIF(YearlyIncome>50000,'Above Average','Below Average') AS IncomeCategory
 FROM DimCustomer;

-- Further Categorize Using Case Statement -- 
SELECT FirstName,LastName,YearlyIncome,EmailAddress,
 IIF(YearlyIncome>50000,'Above Average','Below Average') AS IncomeCategory,
 CASE
       WHEN NumberChildrenAtHome = 0 THEN '0'
       WHEN NumberChildrenAtHome = 1 THEN '1' 
       WHEN NumberChildrenAtHome BETWEEN 2 AND 4 THEN '2-4'
       WHEN NumberChildrenAtHome >= 5 THEN '5+'
       ELSE 'Unknown'
       END AS NumberChildrenCategory
 FROM DimCustomer

-- Statements for deaing with Null Where Col = X and Unknown Replaces Null --
	/* IIF(X IS NULL,'Unknown',Variable) AS Col Name,
	ISNULL(X,'Unknown') AS Col Name,
	COALESCE(X,'Unknown') AS Col Name, */

-- Lastly Lets Combine FirstName Col & LastName Col AS CustomerName --
SELECT CONCAT(FirstName,' ',LastName) AS CustomerName,YearlyIncome,EmailAddress,
 IIF(YearlyIncome>50000,'Above Average','Below Average') AS IncomeCategory,
 CASE
       WHEN NumberChildrenAtHome = 0 THEN '0'
       WHEN NumberChildrenAtHome = 1 THEN '1' 
       WHEN NumberChildrenAtHome BETWEEN 2 AND 4 THEN '2-4'
       WHEN NumberChildrenAtHome >= 5 THEN '5+'
       ELSE 'Unknown'
       END AS NumberChildrenCategory
 FROM DimCustomer;
