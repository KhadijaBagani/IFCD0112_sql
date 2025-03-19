-- Con qu� categor�a gano m�s dinero America en 2017


SELECT Categoria_Name, SUM(Ingresos - Gastos) as Beneficios
FROM 
Datos
inner join Productos
on Producto_FK =Producto_PK
inner join Categorias
on Categoria_PK = Categor�a_FK
inner join Paises
on Pais_PK = Pais_FK
inner join Continentes
on Continente_PK = Continente_FK
WHERE Continente = 'Am�rica' and YEAR(fecha) = 2017
GROUP BY Categoria_Name
Order by Beneficios DESC


SELECT TOP 1 Categoria_Name, SUM(Ingresos - Gastos) as Beneficios
FROM 
Datos
inner join Productos
on Producto_FK =Producto_PK
inner join Categorias
on Categoria_PK = Categor�a_FK
inner join Paises
on Pais_PK = Pais_FK
inner join Continentes
on Continente_PK = Continente_FK
WHERE Continente = 'Am�rica' and YEAR(fecha) = 2017
GROUP BY Categoria_Name
Order by Beneficios DESC

Select Categoria_Name
FROM
(
SELECT TOP 1 Categoria_Name, SUM(Ingresos - Gastos) as Beneficios
FROM 
Datos
inner join Productos
on Producto_FK =Producto_PK
inner join Categorias
on Categoria_PK = Categor�a_FK
inner join Paises
on Pais_PK = Pais_FK
inner join Continentes
on Continente_PK = Continente_FK
WHERE Continente = 'Am�rica' and YEAR(fecha) = 2017
GROUP BY Categoria_Name
Order by Beneficios DESC
) as subquery;
