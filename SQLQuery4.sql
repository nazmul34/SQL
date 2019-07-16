--Implement Of CTE which works as view but doesn't create a table object to the database
WITH Employee_CTE (EmployeeN, Gen)
AS
(
SELECT EmployeeName,gender FROM  Employee
)
SELECT EmployeeN,Gen FROM   Employee_CTE

--Tutorial
--Scalar user defined functions
--https://www.youtube.com/watch?v=OV5CquR1Svo&list=PL08903FB7ACA1C2FB&index=30

go
create function calculateAge(@DOB date)
returns int
as
begin
 DECLARE @Age INT  
 SET @Age = DATEDIFF(YEAR, @DOB, GETDATE()) - 
 CASE
	WHEN (MONTH(@DOB) > MONTH(GETDATE())) OR 
			(MONTH(@DOB) = MONTH(GETDATE()) AND DAY(@DOB) > DAY(GETDATE())) 
			THEN 1
			ELSE 0 
	END
 RETURN @Age  
end
go

select datediff(YEAR,'05/12/1994',GETDATE()) as age;

select dbo.calculateAge('05/12/1994') as age;


--Tutorial
--Inline Table Valued function
--https://www.youtube.com/watch?v=hs4mReAzESc&list=PL08903FB7ACA1C2FB&index=31
go
CREATE FUNCTION fn_EmployeesByGender(@Gender nvarchar(10))
RETURNS TABLE
AS
	return (select * from Employee where Gender=@Gender)
go

select * from fn_EmployeesByGender('Female');

select * from dbo.fn_EmployeesByGender('Male');

update fn_EmployeesByGender('Male') set EmployeeName='BenTen' where EmployeeName='Ben';


--Tutorial
--Multi-statement Table Valued function
--https://www.youtube.com/watch?v=EgYW7tsNP6g&list=PL08903FB7ACA1C2FB&index=32
go
Create Function fn_MSTVF_GetEmployees()
Returns @Table Table (EmployeeName varchar(20),Income money,Gender varchar(20))
as
Begin
 Insert into @Table
 select EmployeeName,Salary,Gender from Employee;
 Return
End
go

select * from fn_MSTVF_GetEmployees();

declare @Table Table (EmployeeName varchar(20),Income money,Gender varchar(20));

insert into @Table select * from fn_MSTVF_GetEmployees();

select * from @Table;
--Update Is not possible in Multi-statement Table Valued function


--Tutorial
--SchemaBinding
--https://www.youtube.com/watch?v=WNoTgfg3mGc&list=PL08903FB7ACA1C2FB&index=33


go
alter FUNCTION fn_EmployeesByGender(@Gender nvarchar(10))
RETURNS TABLE
with schemabinding
AS
	return (select EmployeeName,EmployeeID,Gender from dbo.Employee where Gender=@Gender)
go


drop table Employee;--Drop shold not work.Because Employee is schemabinding to fn_EmployeesByGender function
