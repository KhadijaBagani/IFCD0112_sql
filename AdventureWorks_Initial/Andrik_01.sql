SELECT 
	YEAR(ShipDate) as a�o, 
	ShipMethodID as tipoenvio,
	FORMAT(SUM(subTotal), 'C', 'uk-gb') as Total,
	GROUPING(YEAR(ShipDate)) as agrupadopora�o,
	GROUPING(ShipMethodID) as agrupadoPorEnvio

FROM [AdventureWorks2022].[Purchasing].[PurchaseOrderHeader]
GROUP by ROLLUP(YEAR(ShipDate), ShipMethodID);
