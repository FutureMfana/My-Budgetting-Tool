CREATE DATABASE Budget;
GO

USE Budget;
GO

CREATE SCHEMA Year2020;
GO

CREATE TABLE Year2020.MyBudget(
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Expenses NVARCHAR(40) NOT NULL,
	Costs INT NOT NULL,
	CostsInPercent AS (Costs / 28000 * 100),
	Remainder as 7302 - Costs,
	Month_ TinyInt
);
GO

CREATE VIEW Year2020.My2020Budget 
AS 
	SELECT ID AS RowID, Expenses AS Expenditure, Costs AS TotalPrice, CostsInPercent AS PricePercentage, Remainder AS Balance, Month_ AS Month
	FROM Year2020.MyBudget;
GO

ALTER TABLE Year2020.MyBudget
ADD Year_ TINYINT NOT NULL;
GO

ALTER VIEW Year2020.My2020Budget
AS SELECT ID AS RowID, Expenses AS Expenditure, Costs AS TotalPrice, CostsInPercent AS PricePercentage, Remainder AS Balance, Month_ AS Month
	FROM Year2020.MyBudget;
GO
