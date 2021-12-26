/*
	Author : lrasata
	HackerRankChallenge - Weather Observation Station 5
    Query the two cities in STATION with the shortest and longest CITY names, 
    as well as their respective lengths (i.e.: number of characters in the name). 
    If there is more than one smallest or largest city, 
    choose the one that comes first when ordered alphabetically.
*/

select * 
from 
(
    select city, length(city) as length_name
    from station
    order by length_name, city  asc
) as t_min
limit 1;

select *
from 
(
    select city, length(city) as length_name
    from station
    order by length_name desc, city asc
) as t_max
limit 1;

/*
	Author : lrasata
	HackerRankChallenge - Binary Tree Nodes
*/

select 
case
    when P is null then CONCAT(N, ' Root')
    when N in (select distinct P from BST) then CONCAT(N, ' Inner')
    else CONCAT(N, ' Leaf')
    end
from BST
order by N asc;


/*
	Author : lrasata
	HackerRankChallenge - New Companies
*/

select c.company_code, c.founder, count(distinct l.lead_manager_code),
        count(distinct s.senior_manager_code ), count(distinct m.manager_code ),
        count(distinct e.employee_code)
from company as c, lead_manager as l, senior_manager as s, manager as m, employee as e
where 
    c.company_code = l.company_code and
    l.company_code = s.company_code and
    s.company_code = m.company_code and
    m.company_code = e.company_code
group by c.company_code, c.founder
order by c.company_code asc;
