WITH CustomerRegionTotals AS (
    SELECT c.CustomerID,
           p.FirstName + ' ' + p.LastName AS FullName,
           t.Name AS Region,
           SUM(od.LineTotal) AS TotalSpent
    FROM Sales.SalesOrderDetail AS od
    INNER JOIN Sales.SalesOrderHeader AS oh 
        ON od.SalesOrderID = oh.SalesOrderID
    INNER JOIN Sales.Customer AS c 
        ON oh.CustomerID = c.CustomerID
    LEFT JOIN Person.Person AS p 
        ON c.PersonID = p.BusinessEntityID
    INNER JOIN Sales.SalesTerritory AS t 
        ON oh.TerritoryID = t.TerritoryID
    WHERE oh.Status = 5
    GROUP BY c.CustomerID, p.FirstName, p.LastName, t.Name
)

SELECT CustomerID, 
       FullName, 
       Region, 
       TotalSpent,
       RANK() OVER(PARTITION BY Region ORDER BY TotalSpent DESC) AS RegionalRank
FROM CustomerRegionTotals
ORDER BY Region, RegionalRank;