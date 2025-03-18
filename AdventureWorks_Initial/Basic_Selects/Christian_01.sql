-- Cuantos empleado hay por nivel organizativo y descripci�n del puesto de trabajo
SELECT
	[JobTitle], [OrganizationLevel],
	 count(*) as totalempleado      
  FROM [AdventureWorks2022].[HumanResources].[Employee]
  GROUP BY ROLLUP([JobTitle], [OrganizationLevel])