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

/*
	Author : lrasata
	HackerRankChallenge - Ollivander's Inventory
*/

select w.id, wp.age, w.coins_needed, w.power
from Wands as w join Wands_Property as wp on w.code = wp.code
where wp.is_evil = 0 
    and w.coins_needed = (
        select min(coins_needed)
        from Wands as w1 join Wands_Property as wp1 on w1.code = wp1.code
        where w1.power = w.power and wp1.age = wp.age
    )
order by w.power desc, wp.age desc;

/*
	Author : lrasata
	HackerRankChallenge - Placements
*/
select S.Name
from(
    select Friends.ID as fid, Friend_ID, Salary
    from Friends, Packages
    where Friends.ID = Packages.ID
) as A join Packages as P1 on A.Friend_ID = P1.ID
       join Students as S on S.ID = A.fid 
where A.Salary < P1.Salary
order by P1.Salary asc;


/*
	Author : lrasata
	HackerRankChallenge - Contest Leaderboard
*/

select h.hacker_id, h.name, t2.sum_score
from(
    select t1.hid, sum(max_score) as sum_score
    from (
        select hacker_id as hid, challenge_id as cid, max(score) as max_score
        from Submissions as s
        group by s.hacker_id, s.challenge_id
    ) as t1
    group by t1.hid
) as t2 join Hackers as h on h.hacker_id = t2.hid
where sum_score != 0
order by sum_score desc, hacker_id asc;

/*
	Author : lrasata
	HackerRankChallenge - Symmetric Pairs
*/

select f1.X, f1.Y 
from Functions as f1 inner join Functions as f2 on f1.X = f2.Y and f1.Y = f2.X
group by f1.X, f1.Y
having count(f1.X) > 1 or f1.X < f1.Y
order by f1.X asc;
