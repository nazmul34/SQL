-- Check constarint
CREATE TABLE Persons1 (
    ID int primary key,
    Name varchar(255) NOT NULL,
    Age int CHECK (Age>=18)
);

insert into Persons1(ID, Name, Age) values(1,'kanon', 15)
-- We will get The INSERT statement conflicted with the CHECK constraint "CK__Persons1__Age__70DDC3D8".


--SQL Case
select customerName,
case 
	when Address is not null then Address
	when city is not null then city
	when country is not null then country
	else 'Address not available'
end as current_address
from Customers
where customerID>1000

-- Delete and Truncate

-- Truncate operation is faster than delete
-- Truncate operation resets the identity column values
-- Truncate operation does not fire triggers
-- At a high level, you can consider truncate command similar to a Delete command without a Where clause

DELETE FROM Persons where PersonID = 1;
TRUNCATE TABLE Persons;

-- Truncate operation cannot be rolled back (Wrong statements from ChatGPT)
-- SQL Truncate command with Rollback
BEGIN TRAN;
TRUNCATE TABLE Persons;
ROLLBACK TRANSACTION


-- COALESCE
-- returns the first not null value
select COALESCE(null, null, 'hello') -- output "hello"

--ISNULL(expression, value)
-- Return the specified value IF the expression is NULL, otherwise return the expressio
SELECT ISNULL(NULL, 'W3Schools.com'); -- output "W3Schools.com"


--- Temporary tables

-- Temporary tables are physical database objects that are stored in the tempdb system database
-- They have all the functionality of a table except it is temporary
-- local temporary table is automatically dropped, when the connection that has created the it, is closed
-- Global temporary tables are visible to all the connections of the sql server, and are only destroyed when the last connection referencing the table is closed

-- local temporary table
Create Table #PersonDetails(Id int, Name nvarchar(20))

-- Global temporary table
Create Table ##PersonDetails(Id int, Name nvarchar(20))


-- INSERT Multiple Rows

-- The number of rows that you can insert at a time is 1,000 rows using this form of the INSERT statement. If you want to insert more rows than that, 
-- you should consider using multiple INSERT statements, BULK INSERT

-- 1
insert into Persons(FirstName)
output inserted.PersonID -- Optional, this will return newly created Ids
values ('Nazmul'), ('Zico'), ('Simon'), ('Ziul'), ('Ashikuzzaman')

-- 2
INSERT 
TOP (10) PERCENT 
INTO Persons (FirstName) 
SELECT
    CustomerName
FROM
    customers
ORDER BY
    CustomerName

-- 3 (bulk insert used inserting from file)
BULK INSERT EmployeesTest
FROM 'D:\training\SQL\test_files\test1.txt'
WITH (
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '\n',
  FIRSTROW = 2
);


-- Dynamic SQL
-- Execute sql query from string
EXEC sp_executesql N'SELECT * FROM EmployeesTest';

-- Update join: update one table's data using other table's data
update persons1 
set persons1.name = customers.customerName
from persons1
join customers on customers.customerID = persons1.ID

-- computed column
-- a column where value is computed from some expression
-- does not exist physically unless it is persisted
-- if it is persited then we can add constraint and index as well

CREATE TABLE Authors
(
 AuthorId int IDENTITY(1,1) NOT NULL,
 FirstName nvarchar(100),
 LastName nvarchar(100),
 FullName AS (FirstName + SPACE(1) + LastName) persisted not null, -- computed column, Data will not store in DB because its persisted
 FullName1 AS (FirstName + SPACE(1) + LastName) -- Data will not store in DB
)


-- BCP Utility
-- The bcp utility (Bcp.exe) is a command-line tool for SQL server. The bcp utility performs the following tasks:

-- export to csv file from table
-- bcp w3schools.dbo.shippers out D:\training\SQL\test_files\ship.csv -c -t "," -T -S NAZMULISLAMLAP\MSSQLSERVER01

-- import to table from csv file
-- bcp w3schools.dbo.shipper in D:\training\SQL\test_files\ship.csv -c -t "," -T -S NAZMULISLAMLAP\MSSQLSERVER01

-- export to csv file from query
-- bcp "SELECT TOP (10) [OrderID], [CustomerID] FROM [w3schools].[dbo].[orders] order by [CustomerID], [OrderID]" queryout D:\training\SQL\test_files\order.csv -c -t "," -T -S NAZMULISLAMLAP\MSSQLSERVER01

-- use of format file in importing to a table
-- bcp w3schools.dbo.shipper format null -f D:\training\SQL\test_files\ship.fmt -c -T -S NAZMULISLAMLAP\MSSQLSERVER01
-- bcp w3schools.dbo.shipper in D:\training\SQL\test_files\ship1.csv -f D:\training\SQL\test_files\ship.fmt -t "," -T -S NAZMULISLAMLAP\MSSQLSERVER01