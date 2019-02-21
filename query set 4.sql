/*
1.
https://www.hackerrank.com/challenges/occupations/problem
Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed underneath its 
corresponding Occupation. The output column headers should be Doctor, Professor, Singer, and Actor, respectively.

Note: Print NULL when there are no more names corresponding to an occupation.
*/

set @r1=0, @r2=0, @r3=0, @r4=0;
select min(Doctor), min(Professor), min(Singer), min(Actor) from /* If we use max we can get the same output*/
(																/* because all other value is null*/
select
case 
    when Occupation='Doctor' then @r1:=@r1+1 /* := uses for set a variables */
    when Occupation='Professor' then @r2:=@r2+1
    when Occupation='Singer' then @r3:=@r3+1
    when Occupation='Actor' then @r4:=@r4+1
    end as num_of_row,
case
    when Occupation='Doctor' then name end as Doctor,
case
    when Occupation='Professor' then name end as Professor,
case
    when Occupation='Singer' then name end as Singer,
case
    when Occupation='Actor' then name end as Actor
from OCCUPATIONS order by name 
) as t group by num_of_row;/* here oreder by name and as t must need to stay.*/


/*
2.
https://www.hackerrank.com/challenges/binary-search-tree-1/problem
You are given a table, BST, containing two columns: N and P, where N represents the value of a node in Binary 
Tree, and P is the parent of N.
Write a query to find the node type of Binary Tree ordered by the value of the node. Output one of the following 
for each node:
Root: If node is root node.
Leaf: If node is leaf node.
Inner: If node is neither root nor leaf node.
*/

select N,
case 
when P is null then 'Root'
when N in (select P from BST) then 'Inner'
else 'Leaf'
end
from BST order by N;