/*
 Nombre: 05_resumiendo con ROLLUP()
 Autor: Luis MIguel Casado D�az
 Created: 2025-03-15
 Last Modified: 2025-03-15 by Jane Smith
 Prop�sito: Explicar el funcionamiento de la cluausula ROLLUP().
 Version: 1.1

Finalidad de ROLLUP() en SQL Server
La funci�n ROLLUP() se utiliza en la cl�usula GROUP BY.
La usamos para generar subtotales y totales acumulativos en un conjunto de resultados.

Permite analizar datos en m�ltiples niveles de agregaci�n, lo que es �til para 
informes y an�lisis de datos.

La syntaxis es 
SELECT columna1, columna2, ..., funci�n_agregada(columna_agregada)
FROM tabla
GROUP BY ROLLUP (columna1, columna2, ...);


Considerando solo dos columnas estado_civil y g�nero

Tenemos estas combinaciones
SELECT		GROUP BY ROLLUP()
G M			G M
G M			M G
M G			M G
M G			G M
*/

SELECT Gender, MaritalStatus, count(*) AS Empleados
FROM [AdventureWorks2022].[HumanResources].[Employee]
GROUP BY ROLLUP (Gender, MaritalStatus);

/*
Gender	MaritalStatus	TotalVentas
F		M				49
F		S				35
F		NULL			84
M		M				97
M		S				109
M		NULL			206
NULL	NULL			290
*/
SELECT Gender, MaritalStatus, count(*) AS Empleados
FROM [AdventureWorks2022].[HumanResources].[Employee]
GROUP BY ROLLUP (MaritalStatus, Gender);

/*
Gender	MaritalStatus	Empleados
F		M				49
M		M				97
NULL	M				146
F		S				35
M		S				109
NULL	S				144
NULL	NULL			290
*/

SELECT MaritalStatus, Gender, count(*) AS Empleados
FROM [AdventureWorks2022].[HumanResources].[Employee]
GROUP BY ROLLUP (MaritalStatus, Gender);

/*
MaritalStatus	Gender	TotalVentas
M				F		49
M				M		97
M				NULL	146
S				F		35
S				M		109
S				NULL	144
NULL			NULL	290
*/

SELECT MaritalStatus, Gender, count(*) AS Empleados
FROM [AdventureWorks2022].[HumanResources].[Employee]
GROUP BY ROLLUP (Gender, MaritalStatus);


/*
MaritalStatus	Gender	TotalVentas
M				F		49
S				F		35
NULL			F		84
M				M		97
S				M	1	09
NULL			M	2	06
NULL			NULL	290
*/

/*
Para ayudarnos a identificar qu� fila es un subtotal, podemos a�adir
columnas al resultado de nuestra consulta con la funci�n GROUPING( columna)
QUe nos marcar� con un uno la fila que sitei un sibtotal para la columna
*/

SELECT MaritalStatus, Gender, count(*) AS TotalVentas,
    GROUPING(MaritalStatus) as Grupo_EstadoCivil,
    GROUPING(Gender) as Grupo_genero
FROM [AdventureWorks2022].[HumanResources].[Employee]
GROUP BY ROLLUP (MaritalStatus, Gender)

SELECT  Gender, MaritalStatus,count(*) AS TotalVentas,
    GROUPING(MaritalStatus) as Grupo_EstadoCivil,
    GROUPING(Gender) as Grupo_genero
FROM [AdventureWorks2022].[HumanResources].[Employee]
GROUP BY ROLLUP ( Gender, MaritalStatus)


/* veamos un ejemplo con tres columnas de resumen */

/*suma las ventas diarias y calcula el subtotal por mes y por a�o
SELECT 
	YEAR(OrderDate) AS a�o, 
	MONTH(OrderDate) AS Mes, 
	DAY(OrderDate) AS d�a,
	FORMAT(SUM(TotalDue), 'C', 'en-US') AS TotalVentas,
    GROUPING(YEAR(OrderDate)) as AgrupandoA�o,
    GROUPING(MONTH(OrderDate)) as AgrupandoMes, 
	GROUPING(DAY(orderdate)) as Agrupandoday
FROM Sales.SalesOrderHeader
GROUP BY ROLLUP (YEAR(OrderDate), MONTH(OrderDate), Day(orderDate))
ORDER BY YEAR(OrderDate), MONTH(OrderDate), DAY(orderdate);