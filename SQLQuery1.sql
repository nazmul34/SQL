--Creating Table
CREATE TABLE Persons (
    PersonID int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255) 
);

--Alter Table
ALTER TABLE Persons alter column PersonID int NOT NULL
ALTER TABLE Persons alter column LastName varchar(40) NOT NULL



---Creating Primary Key
ALTER TABLE Persons
ADD PRIMARY KEY (PersonID);
--drop this primary key
alter table customer drop constraint PK__Customer__A4AE64B85F8BDAE2;

 --Or 
alter table persons add constraint PK_Person PRIMARY KEY (PersonID);
--multiple primary key
alter table persons add constraint PK_Person PRIMARY KEY (PersonID,LastName);
--drop this primary key
alter table Persons drop constraint PK_Persons; 



--Set Default Value
ALTER TABLE Persons
ADD CONSTRAINT df_date 
DEFAULT getdate() FOR DateOfBirth;

--Creating a View
go
create view [value] as
select PersonId,FirstName from Persons;
go

select * from [value];


--Auto increament primary key
--frist you have to delete the column
alter table customer drop column CustomerID;
--then
ALTER TABLE customer ADD CustomerID int IDENTITY(1, 1) NOT NULL primary key;

