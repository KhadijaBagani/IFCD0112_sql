-- Ordenar los apellidos de las personas alfabeticamente en cada pa�s

set statistics time on
USE AdventureWorks2022;
Select * from Person.Person as p
inner join Person.BusinessEntity as BE
on be.BusinessEntityID = p.BusinessEntityID
inner join Person.BusinessEntityAddress as bea
on bea.BusinessEntityID = be.BusinessEntityID
inner join Person.Address as a
on a.AddressID = bea.AddressID
inner join Person.StateProvince as s
on s.StateProvinceID = a.StateProvinceID
inner join Person.CountryRegion as c
on c.CountryRegionCode = s.CountryRegionCode;

Select c.Name as Pa�s, p.LastName as Apellido from Person.Person as p
inner join Person.BusinessEntity as BE
on be.BusinessEntityID = p.BusinessEntityID
inner join Person.BusinessEntityAddress as bea
on bea.BusinessEntityID = be.BusinessEntityID
inner join Person.Address as a
on a.AddressID = bea.AddressID
inner join Person.StateProvince as s
on s.StateProvinceID = a.StateProvinceID
inner join Person.CountryRegion as c
on c.CountryRegionCode = s.CountryRegionCode
order by Pa�s, Apellido ;

-- Contar cuantas personas tiene un mismo apellido en cada pais

Select * from Person.Person as p
inner join Person.BusinessEntity as BE
on be.BusinessEntityID = p.BusinessEntityID
inner join Person.BusinessEntityAddress as bea
on bea.BusinessEntityID = be.BusinessEntityID
inner join Person.Address as a
on a.AddressID = bea.AddressID
inner join Person.StateProvince as s
on s.StateProvinceID = a.StateProvinceID
inner join Person.CountryRegion as c
on c.CountryRegionCode = s.CountryRegionCode;

Select c.Name as Pa�s, p.LastName as Apellido, count(*) as total from Person.Person as p
inner join Person.BusinessEntity as BE
on be.BusinessEntityID = p.BusinessEntityID
inner join Person.BusinessEntityAddress as bea
on bea.BusinessEntityID = be.BusinessEntityID
inner join Person.Address as a
on a.AddressID = bea.AddressID
inner join Person.StateProvince as s
on s.StateProvinceID = a.StateProvinceID
inner join Person.CountryRegion as c
on c.CountryRegionCode = s.CountryRegionCode
Group by c.Name, p.LastName with rollup
order by Pa�s, Apellido ;

-- Para cada pa�s cual es el apellido m�s frecuente.

set statistics time on
USE AdventureWorks2022;
WITH Contador AS (
    SELECT 
        c.Name AS Pa�s, 
        p.LastName AS Apellido, 
        COUNT(*) AS Total
    FROM 
        Person.Person AS p
    INNER JOIN 
        Person.BusinessEntity AS BE ON be.BusinessEntityID = p.BusinessEntityID
    INNER JOIN 
        Person.BusinessEntityAddress AS BEA ON bea.BusinessEntityID = be.BusinessEntityID
    INNER JOIN 
        Person.Address AS A ON a.AddressID = bea.AddressID
    INNER JOIN 
        Person.StateProvince AS S ON s.StateProvinceID = a.StateProvinceID
    INNER JOIN 
        Person.CountryRegion AS C ON c.CountryRegionCode = s.CountryRegionCode
    GROUP BY 
        c.Name, p.LastName
)
SELECT 
    Pa�s, 
    Apellido, 
    Total
FROM 
    Contador AS C1
WHERE 
    Total = (
        SELECT MAX(Total)
        FROM Contador AS C2
        WHERE C1.Pa�s = C2.Pa�s
    )
ORDER BY 
    Pa�s;
