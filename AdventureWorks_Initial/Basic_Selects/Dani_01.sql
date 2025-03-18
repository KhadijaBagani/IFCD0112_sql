SELECT 
	YEAR(OrderDate) as a�o,
	count(*) as TotalProductosVencidos,
	SUM(TotalDue) as Totalventas,
	GROUPING(YEAR(OrderDate)) as Grupoa�o
FROM [AdventureWorks2022].[Sales].[SalesOrderHeader]
GROUP BY ROLLUP(YEAR(OrderDate));



SELECT 
	YEAR(OrderDate) as a�o,
	count(*) as TotalProductosVencidos
FROM [AdventureWorks2022].[Sales].[SalesOrderHeader]
GROUP BY YEAR(OrderDate);
