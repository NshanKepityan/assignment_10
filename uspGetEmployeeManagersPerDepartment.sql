USE [AdventureWorks2]
GO
/****** Object:  StoredProcedure [dbo].[uspGetEmployeeManagersPerDepartmen]    Script Date: 30.04.2018 20:26:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspGetEmployeeManagersPerDepartmen] 
	-- the parameters for the stored procedure
	@BusinessEntityID int = 0, 
	@Department nvarchar(50) = 0
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- statements for procedure

	SELECT HumanResources.Employee.Gender,@BusinessEntityID AS BusinessEntityID, Person.Person.FirstName, Person.Person.LastName, HumanResources.Employee.JobTitle
FROM        HumanResources.Employee, Person.Person INNER JOIN
                         HumanResources.Employee AS Employee_1 ON Person.Person.BusinessEntityID = Employee_1.BusinessEntityID
WHERE        (Person.Person.BusinessEntityID = @BusinessEntityID) AND (HumanResources.Employee.BusinessEntityID = @BusinessEntityID)
UNION
SELECT        HumanResources.Employee.Gender,HumanResources.Employee.BusinessEntityID, Person.Person.FirstName, Person.Person.LastName, HumanResources.Employee.JobTitle
FROM            HumanResources.Employee  INNER JOIN
                         Person.Person ON HumanResources.Employee.BusinessEntityID = Person.Person.BusinessEntityID
WHERE        (HumanResources.Employee.JobTitle = @Department+' Manager')	

	END
