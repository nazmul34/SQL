/*
1
Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than 38.7880 and less than 137.2345.
Truncate your answer to 4 decimal places.
*/
SELECT ROUND(SUM(LAT_N),4)
FROM STATION 
WHERE LAT_N>38.7880 AND LAT_N<137.2345;


--------------------------------------------------------------------------------------------------------

/*
You can not use aggregate functions (COUNT, MAX, MIN, SUM, AVG) derectly after "where"

The syntax is ‘REPLACE(str, from_str, to_str)’ and it returns the string str with all occurrences 
of the string from_str replaced by the string to_str.

ASC|DESC
*/

--------------------------------------------------------------------------------------------------------


/*
2
Query the Western Longitude (LONG_W)where the smallest Northern Latitude (LAT_N) in STATION is greater than 38.7780. Round your answer to 4 decimal places.
*/
select round(LONG_W,4) from STATION where LAT_N=(select min(LAT_N) from station where LAT_N>38.7780);


/*
3
Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table,
but did not realize her keyboard's 0 key was broken until after completing the calculation.
She wants your help finding the difference between her miscalculation (using salaries with any zeroes removed),
and the actual average salary.
Write a query calculating the amount of error (i.e.:  average monthly salaries),
and round it up to the next integer.
*/
SELECT CEIL(AVG(Salary) - AVG(REPLACE(Salary, '0', ''))) FROM EMPLOYEES;


/*
4
We define an employee's total earnings to be their monthly salary*months worked, and the maximum total earnings to be 
the maximum total earnings for any employee in the Employee table. Write a query to find the maximum total 
earnings for all employees as well as the total number of employees who have maximum total earnings. 
Then print these values as 2 space-separated integers.
*/
select (months*salary) as taka,count(*) from Employee group by taka order by taka desc limit 1;


/*
5
https://www.hackerrank.com/challenges/the-pads/problem
Generate the following two result sets:

Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the first letter of each
profession as a parenthetical (i.e.: enclosed in parentheses). For example: AnActorName(A), ADoctorName(D), 
AProfessorName(P), and ASingerName(S).
Query the number of ocurrences of each occupation in OCCUPATIONS.
Sort the occurrences in ascending order, and output them in the following format: 

There are a total of [occupation_count] [occupation]s.

where [occupation_count] is the number of occurrences of an occupation in OCCUPATIONS and [occupation] is the lowercase occupation name. If more than one Occupation has the same [occupation_count], they should be ordered alphabetically.
Note: There will be at least two entries in the table for each type of occupation.
*/
SELECT concat(name , '(' , SUBSTR(occupation,1,1) , ')') FROM occupations ORDER BY name;

SELECT concat('There are a total of ' , COUNT(occupation) , ' ' , LOWER(occupation) , 's.')
FROM occupations GROUP BY occupation ORDER BY COUNT(occupation), occupation ASC;

