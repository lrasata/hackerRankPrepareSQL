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

/*
	Author : lrasata
	HackerRankChallenge - Weather Observation Station 18
    Query the Manhattan Distance between points P1 and P2 and round it to a scale of  decimal places.
*/

select 
    format(
        abs(min(lat_n) - max(lat_n)) + 
        abs(min(long_w) -  max(long_w))
        , 4) 
from station;

/*
	Author : lrasata
	HackerRankChallenge - Weather Observation Station 19
    Query the Euclidean Distance between points P1 and P2 and format your answer to display  decimal digits.
*/

select 
    format(
        sqrt(
            power((max(lat_n) - min(lat_n)), 2)  + 
            power((max(long_w) - min(long_w)), 2)
        ), 4
    ) 
from station;


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