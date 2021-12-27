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

/*
	Author : lrasata
	HackerRankChallenge - The Report
*/
select Name, Grade, Marks
from Students cross join Grades
where Marks >= Min_Mark and Marks <= Max_Mark and Grade >= 8
order by Grade desc, Name asc;

select NULL, Grade, Marks
from Students cross join Grades
where Marks >= Min_Mark and Marks <= Max_Mark and Grade < 8
order by Grade desc, Marks asc;

/*
	Author : lrasata
	HackerRankChallenge - Top Competitors
*/
select h.hacker_id, h.name
from submissions as s 
    join challenges as c on s.challenge_id = c.challenge_id
    join difficulty as d on c.difficulty_level = d.difficulty_level 
    join hackers as h on s.hacker_id = h.hacker_id
where s.score = d.score and c.difficulty_level = d.difficulty_level
group by h.hacker_id, h.name
having count(s.hacker_id) > 1
order by count(s.hacker_id) desc, s.hacker_id asc;

