--Tutorial
--https://www.youtube.com/watch?v=KwEjkpFltjc

select EmployeeName,Salary,Employee.Gender,Item.[number of people],Item.[Average Salary],Item.[Minimum Salary],Item.[Maximum Salary]
from Employee 
inner join
(select gender,count(*) as [number of people],avg(salary) as [Average Salary],min(salary) as [Minimum Salary],max(salary) as [Maximum Salary] 
from Employee group by Gender) as Item
on Employee.Gender=Item.Gender;

--Easy version of the upper code
select EmployeeName,Salary,Gender,
count(Gender) over(partition by Gender) as [number of people],
avg(Salary) over(partition by Gender) as [Average Salary],
min(Salary) over(partition by Gender) as [Minimum Salary],
max(Salary) over(partition by Gender) as [Maximum Salary]
from Employee; 

--Tutorial
--https://www.youtube.com/watch?v=cvrwOoGwgz8

select EmployeeName,Gender,Salary,
ROW_NUMBER() over(order by gender) as Id from Employee;

select EmployeeName,Gender,Salary,
ROW_NUMBER() over(partition by gender order by gender) as RoWNumber from Employee;


with EmployeeCTE as 
(
	select *,ROW_NUMBER() over(partition by EmployeeName order by EmployeeName) as RoWNumber from Employee
)
delete from EmployeeCTE where RoWNumber>1;


--Tutorial
--https://www.youtube.com/watch?v=5-La_uSNkKU

--RANK() 1,1,3,4,5
--DENSE_RANK() 1,1,2,3,4

select EmployeeName,Gender,Salary,
rank() over( order by salary desc) as [Rank],
dense_rank() over(order by salary desc) as [DenseRank] 
from Employee;

select EmployeeName,Gender,Salary,
rank() over(partition by gender order by salary desc) as [Rank],
dense_rank() over( partition by gender order by salary desc) as [DenseRank] 
from Employee;


select EmployeeName,Gender,Salary,
rank() over(partition by gender order by salary desc) as [Rank]
from Employee;

with Result as
(
	select EmployeeName,Gender,Salary,
	rank() over(partition by gender order by salary desc) as [Rank]
	from Employee
)
select top 3 EmployeeName,Gender,Salary from Result where [Rank]>1 and Gender='Male';

with Result as
(
	select EmployeeName,Gender,Salary,
	rank() over(partition by gender order by salary desc) as [Rank]
	from Employee
)
select EmployeeName,Gender,Salary from Result where [Rank]>1;


--Tutorial
--https://www.youtube.com/watch?v=Qu3E-oncF3g&list=PL08903FB7ACA1C2FB&index=18

go
create proc spGetEmployee
as
begin
	select EmployeeName,Salary,Gender from Employee
end
go

execute spGetEmployee;

go
create proc spEmployeeEdit
@GenderData varchar(50),
@SalaryData money
as
begin
	select EmployeeName,Salary,Gender from Employee where Gender=@GenderData and Salary<@SalaryData
end
go


execute spGetEmployee;
execute spEmployeeEdit 'Male',4000
execute spEmployeeEdit @GenderData='Female',@SalaryData=7000

go
sp_helptext spGetEmployee;
go

drop proc spGetEmployee;


go
alter proc spGetEmployee
with encryption
as
begin
	select EmployeeName,Salary,Gender from Employee
end
go

--Tutorial
--https://www.youtube.com/watch?v=bldBshxuhMk&list=PL08903FB7ACA1C2FB&index=19


alter procedure spGetEmloyeeOnGender
@Genderdata varchar(20),
@ElementCount int output
as
begin
	select @ElementCount=COUNT(EmployeeID) from Employee where Gender=@Genderdata
end


declare @EmployeeCount int
execute spGetEmloyeeOnGender 'Female' , @EmployeeCount output
print @EmployeeCount

if(@EmployeeCount is null)
	print 'Null'
else
	print 'NOT NULL'


go
sp_help spGetEmloyeeOnGender
go
sp_depends spGetEmloyeeOnGender
go









