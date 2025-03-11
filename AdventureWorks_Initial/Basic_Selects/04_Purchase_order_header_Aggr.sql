/*






*/
SELECT SUM(SubTotal) AS TotalSubTotal
FROM PurchaseOrder;
Calcula la suma total de los valores de SubTotal.

sql
SELECT AVG(TaxAmt) AS AverageTax
FROM PurchaseOrder;
Calcula el promedio del impuesto TaxAmt.

sql
SELECT MAX(Freight) AS MaxFreight
FROM PurchaseOrder;
Encuentra el valor m�ximo de Freight.

sql
SELECT MIN(TotalDue) AS MinTotalDue
FROM PurchaseOrder;
Encuentra el valor m�nimo de TotalDue.

sql
SELECT COUNT(*) AS TotalOrders
FROM PurchaseOrder;
Cuenta el total de registros en la tabla.

sql
SELECT EmployeeID, COUNT(*) AS OrdersPerEmployee
FROM PurchaseOrder
GROUP BY EmployeeID;
Cuenta cu�ntas �rdenes realiz� cada empleado.

sql
SELECT ShipMethodID, SUM(TotalDue) AS TotalByShipMethod
FROM PurchaseOrder
GROUP BY ShipMethodID;
Calcula la suma total de TotalDue para cada m�todo de env�o.

sql
SELECT VendorID, MAX(SubTotal) AS MaxSubTotalPerVendor
FROM PurchaseOrder
GROUP BY VendorID;
Encuentra el valor m�ximo de SubTotal para cada proveedor.

sql
SELECT Status, AVG(Freight) AS AvgFreightByStatus
FROM PurchaseOrder
GROUP BY Status;
Calcula el promedio de Freight para cada estado.

sql
SELECT EmployeeID, SUM(TotalDue) AS TotalDuePerEmployee
FROM PurchaseOrder
GROUP BY EmployeeID
HAVING SUM(TotalDue) > 50000;
Encuentra los empleados cuyo total de TotalDue supera los 50,000.

sql
SELECT YEAR(OrderDate) AS Year, COUNT(*) AS OrdersPerYear
FROM PurchaseOrder
GROUP BY YEAR(OrderDate);
Cuenta el n�mero de �rdenes por a�o basado en OrderDate.

sql
SELECT ShipMethodID, MIN(Freight) AS MinFreightByShipMethod
FROM PurchaseOrder
GROUP BY ShipMethodID;
Encuentra el valor m�nimo de Freight para cada m�todo de env�o.

sql
SELECT VendorID, COUNT(*) AS TotalOrdersPerVendor
FROM PurchaseOrder
GROUP BY VendorID;
Cuenta el n�mero de �rdenes por proveedor.

sql
SELECT Status, MAX(TaxAmt) AS MaxTaxByStatus
FROM PurchaseOrder
GROUP BY Status;
Encuentra el valor m�ximo de TaxAmt para cada estado.

sql
SELECT EmployeeID, COUNT(*) AS OrdersPerEmployee
FROM PurchaseOrder
GROUP BY EmployeeID
HAVING COUNT(*) > 10;
Muestra empleados con m�s de 10 �rdenes.

sql
SELECT ShipMethodID, AVG(TotalDue) AS AvgTotalDueByShipMethod
FROM PurchaseOrder
GROUP BY ShipMethodID;
Calcula el promedio de TotalDue para cada m�todo de env�o.

sql
SELECT YEAR(OrderDate) AS Year, MONTH(OrderDate) AS Month, SUM(TotalDue) AS TotalSales
FROM PurchaseOrder
GROUP BY YEAR(OrderDate), MONTH(OrderDate);
Calcula las ventas totales por mes y a�o.

sql
SELECT EmployeeID, VendorID, SUM(SubTotal) AS TotalSubTotal
FROM PurchaseOrder
GROUP BY EmployeeID, VendorID;
Encuentra la suma de SubTotal por empleado y proveedor.

sql
SELECT ShipDate, COUNT(*) AS OrdersPerShipDate
FROM PurchaseOrder
GROUP BY ShipDate;
Cuenta cu�ntas �rdenes se enviaron en cada fecha.

sql
SELECT YEAR(OrderDate) AS Year, MAX(TotalDue) AS MaxTotalDue
FROM PurchaseOrder
GROUP BY YEAR(OrderDate);
Encuentra el valor m�ximo de TotalDue para cada a�o.

sql
SELECT VendorID, SUM(Freight) AS TotalFreightPerVendor
FROM PurchaseOrder
GROUP BY VendorID
HAVING SUM(Freight) > 1000;
Encuentra proveedores cuyo total de Freight supera los 1,000.

sql
SELECT Status, COUNT(DISTINCT EmployeeID) AS EmployeesPerStatus
FROM PurchaseOrder
GROUP BY Status;
Cuenta cu�ntos empleados diferentes trabajan en �rdenes con cada estado.

sql
SELECT MONTH(OrderDate) AS Month, AVG(TaxAmt) AS AvgTaxAmt
FROM PurchaseOrder
GROUP BY MONTH(OrderDate);
Calcula el promedio de TaxAmt por mes.

sql
SELECT VendorID, COUNT(*) AS Orders, SUM(SubTotal) AS TotalSubTotal
FROM PurchaseOrder
GROUP BY VendorID
ORDER BY TotalSubTotal DESC;
Ordena los proveedores por su total de SubTotal en orden descendente.

sql
SELECT EmployeeID, MIN(Freight) AS MinFreight, MAX(Freight) AS MaxFreight
FROM AdventureWorks2022.Purchasing.PurchaseOrderHeader
	
GROUP BY EmployeeID;
Encuentra el Freight m�nimo y m�ximo por empleado.


/*


�Cu�l es la suma total de SubTotal para todos los registros?

�Cu�l es el valor promedio de TaxAmt en la tabla?

�Cu�ntos registros tienen un Status igual a 4?

�Cu�l es el TotalDue m�s alto en la tabla?

�Cu�l es el SubTotal m�s bajo en la tabla?

�Cu�l es la cantidad de �rdenes por cada EmployeeID?

�Qu� ShipMethodID tiene el promedio m�s alto de Freight?

�Cu�ntos registros hay en la tabla que tengan un VendorID mayor que 1600?

�Cu�l es la suma de TotalDue para cada ShipMethodID?

�Cu�l es el n�mero total de �rdenes realizadas en cada a�o (bas�ndote en OrderDate)?

�Qu� VendorID tiene la mayor cantidad de registros asociados?

�Cu�l es la suma total de Freight por cada Status?

�Cu�l es la cantidad de �rdenes realizadas por cada ShipDate?

�Qu� EmployeeID gener� el mayor TotalDue en suma?

�Cu�l es el valor promedio de SubTotal para las �rdenes con un TaxAmt superior a 50?

�Cu�l es el valor m�ximo de TaxAmt para cada ShipMethodID?

�Cu�ntos registros hay por cada combinaci�n de EmployeeID y ShipMethodID?

�Cu�l es el valor m�nimo de Freight para los registros con un SubTotal mayor a 20,000?

�Cu�l es el promedio de TotalDue para cada a�o basado en OrderDate?

�Qu� PurchaseOrderID tiene el mayor valor de Freight asociado?

�Cu�l es la suma total de TaxAmt por cada combinaci�n de Status y ShipMethodID?

�Cu�ntos registros tienen un OrderDate en cada mes del a�o 2011?

�Cu�l es el valor promedio de Freight para los registros donde EmployeeID es mayor que 255?

�Cu�l es el menor SubTotal registrado por cada ShipMethodID?

�Cu�ntos registros tienen un ShipDate anterior al ModifiedDate?

*/