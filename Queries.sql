use AdventureWorks2;

/*1)*/ select [Name],ProductNumber,ListPrice as Price from Production.Product;

/*2)*/ select * from HumanResources.Employee where HumanResources.Employee.HireDate >= Convert(datetime, '2009-01-01');

/*3)*/ select * from Production.Product where ProductLine = 'S' and DaysToManufacture < 5 order by ProductLine,DaysToManufacture asc;

/*4)*/ select distinct JobTitle from HumanResources.Employee order by JobTitle asc;

/*5)*/ select SalesOrderID,sum(OrderQty) from Sales.SalesOrderDetail group by SalesOrderID order by SalesOrderID asc;

/*6)*/ select ProductID from Production.Product where ListPrice> 900 group by ProductID

/*7)*/ select ProductID from Sales.SalesOrderDetail group by ProductID having avg(OrderQty) <= 4;