/*
  Postgres port of "query set 1.sql" .. "query set 4.sql".

  The originals target MySQL (HackerRank). Everything that runs unchanged is kept
  verbatim; the lines that needed changing are marked  -- [PG]  with the reason.

  Run against the docker DB:
      psql "postgresql://sqluser:sqlpass@localhost:5432/sqlpractice" -f db/query_sets_postgres.sql
*/

\echo '================ QUERY SET 1 ================'

/* 1 - all American cities with population > 100000 */
select * from CITY where CountryCode='USA' and population>100000;

/* 2 - all rows in CITY */
select * from city;

/* 3 - city with ID 1661 */
select * from city where ID=1661;

/* 4 - CITY and STATE from STATION */
select city,state from STATION;

/* 5 - CITY names with even ID, no duplicates */
select distinct CITY from STATION where mod(id,2)=0;

/* 6 - total CITY entries minus distinct CITY entries */
select count (city) - count(distinct city) from station;

/* 7 - shortest and longest CITY name */
explain analyze
select CITY,LENGTH(CITY) from STATION order by Length(CITY) asc, CITY asc limit 1;
select CITY,LENGTH(CITY) from STATION order by Length(CITY) desc, CITY asc limit 1;

explain analyze
select city, LENGTH(city) from station where length(city)=(select max(length(city)) from STATION)


/* 8 - CITY names starting with a vowel
   [PG] MySQL REGEXP -> Postgres  ~*  (case-insensitive regex match).
        `~` would be case-sensitive; MySQL's REGEXP is not. */
select distinct city from STATION where city ~* '^[AEIOU]';

/* 9 - CITY names ending with a vowel */
select distinct city from station where city ~* '[aeiou]$';                 -- [PG] REGEXP -> ~*

/* 10 - CITY names starting AND ending with a vowel */
SELECT distinct City FROM Station WHERE City ~* '^[aeiou]' and City ~* '[aeiou]$';   -- [PG]
/* or */
SELECT distinct City FROM Station WHERE City ~* '^[aeiou].*[aeiou]$';               -- [PG]

/* 11 - CITY names not starting with a vowel */
select distinct city from station where city !~* '^[aeiou]';                -- [PG] NOT REGEXP -> !~*

/* 12 - CITY names not ending with a vowel */
select distinct city from station where city !~* '[aeiou]$';                -- [PG]

/* 13 - do not start with a vowel OR do not end with a vowel */
select distinct city from station where city !~* '^[aeiou].*[aeiou]$';      -- [PG]
/* or */
select distinct city from station where city !~* '^[aeiou]' or city !~* '[aeiou]$';  -- [PG]

/* 14 - do not start with a vowel AND do not end with a vowel */
select distinct city from station where city !~* '^[aeiou]' and city !~* '[aeiou]$'; -- [PG]

/* 15 - total population of California cities */
select sum(population) from city where District='California';

/* 16 - average population of California cities */
select avg(population) from city where District='California';

/* 17 - average population of all cities, rounded */
SELECT ROUND(AVG(POPULATION)) FROM CITY;

/* 18 - max population minus min population */
select max(population)-min(population) from city;


\echo '================ QUERY SET 2 ================'

/* 1 - students scoring above 75, ordered by last 3 chars of name then ID */
SELECT Name FROM STUDENTS WHERE Marks > 75 ORDER BY RIGHT(Name, 3), ID;

/* 2 - employee names alphabetically */
select name from Employee order by name asc;

/* 3 - salary > 2000 and months < 10 */
select name from Employee where salary>2000 and months<10 order by employee_id asc;

/* 4 - classify each triangle */
select
case
when a+b<=c or a+c<=b or b+c<=a then 'Not A Triangle'
when a=b and b=c then 'Equilateral'
when a=b or a=c or b=c then 'Isosceles'
else 'Scalene'
end
from TRIANGLES;

/* 5 - cities on the continent Africa */
select City.Name from city join country on city.CountryCode=COUNTRY.Code where CONTINENT='Africa';
/* or */
SELECT City.Name
FROM City, Country
WHERE City.CountryCode = Country.Code AND Continent = 'Africa' ;

/* 6 - each continent and its average city population */
select COUNTRY.Continent,floor(avg(CITY.Population)) from city join country on CITY.CountryCode=country.code
group by COUNTRY.Continent;

/* 7 - total population of all Asian cities
   [PG] the original compares to 'asia'; MySQL's default collation is
        case-insensitive, Postgres' = is not, so 'asia' matches nothing.
        Use the exact value, or lower(continent)='asia'. */
select sum(city.population) from city join country on CITY.CountryCode=COUNTRY.Code where CONTINENT='Asia';


\echo '================ QUERY SET 3 ================'

/* 1 - sum of LAT_N in a range, to 4 decimals */
SELECT ROUND(SUM(LAT_N),4)
FROM STATION
WHERE LAT_N>38.7880 AND LAT_N<137.2345;

/* 2 - LONG_W of the smallest LAT_N greater than 38.7780 */
select round(LONG_W,4) from STATION where LAT_N=(select min(LAT_N) from station where LAT_N>38.7780);

/* 3 - error introduced by a broken 0 key
   [PG] REPLACE() is text-only in Postgres and AVG() is numeric-only, so the
        value has to be cast out to text and back: salary::text ... ::numeric. */
SELECT CEIL(AVG(Salary) - AVG(REPLACE(Salary::text, '0', '')::numeric)) FROM EMPLOYEES;
SELECT CEILING(
         AVG(Salary)
         - AVG(CAST(REPLACE(CAST(Salary AS VARCHAR(20)), '0', '') AS DECIMAL(20,4)))
       )
FROM EMPLOYEES;


/* 4 - maximum total earnings and how many employees hit it */
select (months*salary) as taka,count(*) from Employee group by taka order by taka desc limit 1;

/* 5 - the PADS */
SELECT concat(name , '(' , SUBSTR(occupation,1,1) , ')') FROM occupations ORDER BY name;

SELECT concat('There are a total of ' , COUNT(occupation) , ' ' , LOWER(occupation) , 's.')
FROM occupations GROUP BY occupation ORDER BY COUNT(occupation), occupation ASC;


\echo '================ QUERY SET 4 ================'

/* 1 - pivot OCCUPATIONS into Doctor / Professor / Singer / Actor columns
   [PG] the original uses MySQL user variables (set @r1=0 ... @r1:=@r1+1) to number
        the rows within each occupation. Postgres has no such variables; the direct
        equivalent is ROW_NUMBER() OVER (PARTITION BY occupation ORDER BY name). */
select min(Doctor), min(Professor), min(Singer), min(Actor)
from (
    select
        row_number() over (partition by occupation order by name) as num_of_row,
        case when Occupation='Doctor'    then name end as Doctor,
        case when Occupation='Professor' then name end as Professor,
        case when Occupation='Singer'    then name end as Singer,
        case when Occupation='Actor'     then name end as Actor
    from OCCUPATIONS
) as t
group by num_of_row
order by num_of_row;

/* 2 - classify each node of the BST */
select N,
case
when P is null then 'Root'
when N in (select P from BST) then 'Inner'
else 'Leaf'
end
from BST order by N;
