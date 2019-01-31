/*
1
Query the Name of any student in STUDENTS who scored higher than  Marks. 
Order your output by the last three characters of each name. 
If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.),
secondary sort them by ascending ID.
*/
SELECT Name FROM STUDENTS WHERE Marks > 75 ORDER BY RIGHT(Name, 3), ID;

/*
2
Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.
*/
select name from Employee order by name asc;

/*
3
Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having
a salary greater than 2000 per month who have been employees for less than 10 months.
Sort your result by ascending employee_id.
*/
select name from Employee where salary>2000 and months<10 order by employee_id asc;


/*
4
Write a query identifying the type of each record in the TRIANGLES table using its three side lengths.
Output one of the following statements for each record in the table:

Equilateral: It's a triangle with 3 sides of equal length.
Isosceles: It's a triangle with 2 sides of equal length.
Scalene: It's a triangle with 3 sides of differing lengths.
Not A Triangle: The given values of A, B, and C don't form a triangle.
*/
select 
case 
when a+b<=c or a+c<=b or b+c<=a then 'Not A Triangle'
when a=b and b=c then 'Equilateral'
when a=b or a=c or b=c then 'Isosceles'
else 'Scalene'
end
from TRIANGLES;

/*
5
Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.
Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
*/
select City.Name from city join country on city.CountryCode=COUNTRY.Code where CONTINENT='Africa';
/*or*/
SELECT City.Name 
FROM City, Country 
WHERE City.CountryCode = Country.Code AND Continent = 'Africa' ;

----------------------------------------------------------------------------------------------------------
/*
The GROUP BY statement is often used with aggregate functions (COUNT, MAX, MIN, SUM, AVG) to group the 
result-set by one or more columns.when multiple column is selected using GROUP BY is must.

Floor Round a number downward to its nearest integer. Ceil Round a number upward to its nearest integer.
Round Round a number to the nearest integer.
*/

----------------------------------------------------------------------------------------------------------

/*
6
Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) and their respective average city populations (CITY.Population) rounded down to the nearest integer.
Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
*/
select COUNTRY.Continent,floor(avg(CITY.Population)) from city join country on CITY.CountryCode=country.code
group by COUNTRY.Continent;



