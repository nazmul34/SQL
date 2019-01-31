/*
1
Query all columns for all American cities in CITY with populations larger than 100000.
The CountryCode for America is USA.
*/

select * from CITY where CountryCode='USA' and population>100000;

/*
2
Query all columns (attributes) for every row in the CITY table.
*/

select * from city;

/*
3
Query all columns for a city in CITY with the ID 1661.
*/
select * from city where ID=1661;

/*
4
Query a list of CITY and STATE from the STATION table.
*/
select city,state from STATION;

/*
5
Query a list of CITY names from STATION with even ID numbers only.
You may print the results in any order, but must exclude duplicates from your answer.
*/
select distinct CITY from STATION where mod(id,2)=0;

/*
6
Let n be the number of CITY entries in STATION, and let n1 be the number of distinct CITY names in STATION;
query the value of n-n1 from STATION. In other words, find the difference between the total number of 
CITY entries in the table and the number of distinct CITY entries in the table.
*/
select count (city) - count(distinct city) from station;

/*
7
Query the two cities in STATION with the shortest and longest CITY names, 
as well as their respective lengths (i.e.: number of characters in the name). 
If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.
*/
select CITY,LENGTH(CITY) from STATION order by Length(CITY) asc, CITY asc limit 1; 
select CITY,LENGTH(CITY) from STATION order by Length(CITY) desc, CITY asc limit 1; 

/*
8
Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION.
Your result cannot contain duplicates.
*/
select distinct city from STATION where city REGEXP '^[AEIOU]';

/*
9
Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION.
Your result cannot contain duplicates.
*/
select distinct city from station where city regexp '[aeiou]$';

/*
10
Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) 
as both their first and last characters. Your result cannot contain duplicates.
*/

SELECT City
FROM Station
WHERE City REGEXP '^[aeiou]' and City REGEXP '[aeiou]$';

/*or*/

SELECT City
FROM Station
WHERE City REGEXP '^[aeiou].*[aeiou]$';

/*
11
Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.
*/
select distinct city from station where city not REGEXP '^[aeiou]';

/*
12
Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.
*/
select distinct city from station where city not REGEXP '[aeiou]$';

/*
13
Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels.
Your result cannot contain duplicates.
*/
select distinct city from station where city not REGEXP '^[aeiou].*[aeiou]$';
/*or*/
select distinct city from station where city not REGEXP '^[aeiou]' or city not REGEXP '[aeiou]$';


/*
14
Query the list of CITY names from STATION that do not start with vowels and do not end with vowels.
Your result cannot contain duplicates.
*/
select distinct city from station where city not REGEXP '^[aeiou]' and city not REGEXP '[aeiou]$';

/*
15
Query the total population of all cities in CITY where District is California.
*/
select sum(population) from city where District='California';

/*
16
Query the average population of all cities in CITY where District is California.
*/
select avg(population) from city where District='California';

/*
17
Query the average population for all cities in CITY, rounded down to the nearest integer.
*/
SELECT ROUND(AVG(POPULATION)) FROM CITY;

/*
18
Query the difference between the maximum and minimum populations in CITY.
*/
select max(population)-min(population) from city;