/*
	Author : lrasata
	HackerRankChallenge - Type of Triangle
*/
SELECT 
CASE
    WHEN A + B > C AND B + C > A AND A + C > B THEN
        CASE 
            WHEN A = B and B = C THEN 'Equilateral'
            WHEN A = B or B = C or A = C THEN 'Isosceles'
            ELSE 'Scalene'
        END
    ELSE 'Not A Triangle'  
END 
FROM Triangles;

/*
	Author : lrasata
	HackerRankChallenge - The PADS
*/

select concat(name,'(',substring(occupation, 1, 1),')')
from occupations
order by name;

select  concat('There are a total of ', t.total, ' ', lower(t.occupation),'s.')
from
    (select occupation, count(*) as total
    from occupations
    group by occupation
    order by count(*) asc) as t
;