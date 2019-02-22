USE AdventureWorks2014
GO

CREATE PROCEDURE dbo.uspGetAddress
AS
SELECT *FROM Person.Address
GO
EXEC uspGetAddress

USE AdventureWorks2014
GO
CREATE PROCEDURE dbo.upsGetAddress @City nvarchar(30)
AS
SELECT * FROM Person.Address
WHERE City LIKE @ City + '%'
GO

EXEC dbo.upsGetAddress @City = 'New York'

DROP PROC dbo.upsGetAddress


USE AdventureWorks2014
GO

USE AdventureWorks2014
GO
CREATE PROCEDURE dbo.upsGetAddress @City nvarchar(30)=NULL
AS
SELECT * FROM Person.Address
WHERE City = @City
GO

USE AdventureWorks2014
GO
CREATE PROCEDURE dbo.upsGetAddress @City nvarchar(30)=NULL
AS
SELECT * FROM Person.Address
WHERE City = ISNULL (@City,City)
Go


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

DROP PROCEDURE TrackSaleStore
SELECT * FROM Sales.SalesTerritoryHistory;
SELECT * FROM Sales.SalesTerritory;
SELECT * FROM Sales.Store;

a1.Sales.SalesTerritoryHistory,a2.Sales.SalesTerritory,a3.Sales.Store