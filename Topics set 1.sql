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


-- Grouping sets
-- Below two queries results, but grouping sets is faster in some cases

-- 1
SELECT brand, category, SUM (sales) FROM sales.sales_summary
GROUP BY
    GROUPING SETS (
        (brand, category),
        (brand),
        (category),
        ()
)
ORDER BY brand, category;

--2
SELECT brand, category, SUM (sales) sales FROM sales_summary
GROUP BY brand, category

UNION ALL

SELECT brand, NULL, SUM (sales) sales FROM sales_summary
GROUP BY brand

UNION ALL

SELECT NULL, category, SUM (sales) sales FROM sales_summary
GROUP BY category

UNION ALL

SELECT NULL, NULL, SUM (sales) FROM sales_summary

ORDER BY brand, category;


-- UNION vs. UNION ALL
-- By default, the UNION operator removes all duplicate rows from the result sets. However, if you want to retain the duplicate rows, 
-- you need to specify the ALL keyword is explicitly

SELECT first_name, last_name FROM staffs
UNION
SELECT first_name, last_name FROM customers


-- INTERSECT
-- The SQL Server INTERSECT combines result sets of two or more queries and returns distinct rows that are output by both queries.
-- In some general cases we acive this kind of results by inner join, intersect is helpful when joining is not easy

SELECT city FROM customers
INTERSECT
SELECT city FROM stores;


-- EXCEPT
-- The SQL Server EXCEPT compares the result sets of two queries and returns the distinct rows from the first query that are not output by the second query.
-- In some general cases we acive this kind of results by left join, EXCEPT is helpful when joining is not easy

SELECT city FROM customers
EXCEPT
SELECT city FROM stores;


-- MERGE
-- Suppose, you have two table called source and target tables, and you need to update the target table based on the values matched from the source table. There are three cases:
-- 1. The source table has some rows that do not exist in the target table. In this case, you need to insert rows that are in the source table into the target table.
-- 2. The target table has some rows that do not exist in the source table. In this case, you need to delete rows from the target table.
-- 3. The source table has some rows with the same keys as the rows in the target table. However, these rows have different values in the non-key columns. 
--    In this case, you need to update the rows in the target table with the values coming from the source table.

MERGE sales.category t 
    USING sales.category_staging s
ON (s.category_id = t.category_id)
WHEN MATCHED
    THEN UPDATE SET 
        t.category_name = s.category_name,
        t.amount = s.amount
WHEN NOT MATCHED BY TARGET 
    THEN INSERT (category_id, category_name, amount)
         VALUES (s.category_id, s.category_name, s.amount)
WHEN NOT MATCHED BY SOURCE 
    THEN DELETE;


-- PIVOT
-- SQL Server PIVOT operator rotates a table-valued expression. It turns the unique values in one column into multiple columns in the output and performs aggregations on any remaining column values.
-- Detais in: https://www.sqlservertutorial.net/sql-server-basics/sql-server-pivot/
-- This topics is quite tough, if we desperate need this feature, ony then we can learn the coding, otherwise just khow the use case of PIVOT.
