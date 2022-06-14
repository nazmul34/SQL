--Add Foreign key
ALTER TABLE Customer
ADD FOREIGN KEY (CityID) REFERENCES City(CityID);

--Add Unique value for one to one

ALTER TABLE Customer
ADD UNIQUE (ContactID);

--Drop Unique key
alter table customer drop UQ__Customer__F2D21A978DC0E5F5;


--Multiple join
select * from Orders join Customer on Orders.CustomerID=Customer.CustomerID join Product on Orders.ProductID=Product.ProductID
 join City on City.CityId=Customer.CityID join Contact on Contact.ContactId=Customer.ContactID; 


--Tutorial
--https://www.youtube.com/watch?v=FKSSOpQe5Jc&list=PL08903FB7ACA1C2FB&index=11

create table Employee
(
Id int identity ,
EmployeeName varchar(20),
Gender varchar(20),
Salary int,
CityName varchar(20)
)


insert into Employee values ('tom','male',4000,'london')
insert into Employee values ('pam','female',3000,'newyork')
insert into Employee values ('john','male',3500,'london')
insert into Employee values ('sam','male',4500,'london')
insert into Employee values ('tod','male',2800,'sydney')
insert into Employee values ('ben','male',7000,'newyork')
insert into Employee values ('sara','female',4800,'sydney')
insert into Employee values ('valarie','female',5500,'newyork')
insert into Employee values ('james','male',6500,'london')
insert into Employee values ('russel','male',8800,'london')

select * from Employee; 

select CityName,sum(Salary) As TotalSalary from Employee group by CityName;

select CityName,Gender,sum(Salary) As TotalSalary from Employee group by CityName,Gender;

select CityName,Gender,sum(Salary) As TotalSalary from Employee group by CityName,Gender order by CityName;

select CityName,Gender,sum(Salary) As TotalSalary,count(EmployeeID) from Employee group by CityName,Gender order by CityName;

select CityName,Gender,sum(Salary) As TotalSalary,count(EmployeeID) from Employee where Gender='Male' group by CityName,Gender order by CityName;

--After Group By we should use 'havig' instead of 'where'  
select CityName,Gender,sum(Salary) As TotalSalary,count(EmployeeID) from Employee group by CityName,Gender having Gender='Male' order by CityName;

select CityName,Gender,sum(Salary) As TotalSalary,count(EmployeeID) from Employee group by CityName,Gender having sum(Salary)<5000 order by CityName;





