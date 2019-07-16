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


insert into Employee(EmployeeName,Gender,Salary,CityName) values('Russell','Male',8800,'London');

select * from Employee; 

select CityName,sum(Salary) As TotalSalary from Employee group by CityName;

select CityName,Gender,sum(Salary) As TotalSalary from Employee group by CityName,Gender;

select CityName,Gender,sum(Salary) As TotalSalary from Employee group by CityName,Gender order by CityName;

select CityName,Gender,sum(Salary) As TotalSalary,count(EmployeeID) from Employee group by CityName,Gender order by CityName;

select CityName,Gender,sum(Salary) As TotalSalary,count(EmployeeID) from Employee where Gender='Male' group by CityName,Gender order by CityName;

--After Group By we should use 'havig' instead of 'where'  
select CityName,Gender,sum(Salary) As TotalSalary,count(EmployeeID) from Employee group by CityName,Gender having Gender='Male' order by CityName;

select CityName,Gender,sum(Salary) As TotalSalary,count(EmployeeID) from Employee group by CityName,Gender having sum(Salary)<5000 order by CityName;





