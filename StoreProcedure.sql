USE AdventureWorks2014
GO
CREATE PROCEDURE TrackSaleStore @Group nvarchar(60), @Name nvarchar(90)
AS
SELECT * FROM Sales.SalesTerritoryHistory AS a1
INNER JOIN Sales.Store AS a3 ON a3.BusinessEntityID=a1.BusinessEntityID
INNER JOIN Sales.SalesTerritory AS a2 ON a2.TerritoryID=a1.TerritoryID
WHERE [Group] = @Group AND a2.Name = @Name 
GO

EXEC TrackSaleStore @Group = 'North America', @Name = 'Great Bikes'
