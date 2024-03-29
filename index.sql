### SELECT BASICS

#1.
SELECT population FROM world
WHERE name = 'Germany';

#2.
SELECT name, population FROM world
WHERE name IN ('Sweden', 'Norway', 'Denmark');

#3.
SELECT name, area FROM world
WHERE area BETWEEN 200000 AND 250000;

### Quiz
SELECT name, population
FROM world
WHERE population BETWEEN 1000000 AND 1250000;

SELECT name FROM world
WHERE name LIKE '%a' OR name LIKE '%l';

SELECT name,length(name)
FROM world
WHERE length(name)=5 and region='Europe';

SELECT name, area*2 
FROM world WHERE population = 64000;

SELECT name, area, population
FROM world
WHERE area > 50000 AND population < 10000000;

SELECT name, population/area
FROM world
WHERE name IN ('China', 'Nigeria', 'France', 'Australia');

Find the country that start with Y
SELECT name FROM world
WHERE name LIKE 'Y%';

Find the countries that end with y
SELECT name FROM world
WHERE name LIKE '%y';

Find the countries that contain the letter x
SELECT name FROM world
WHERE name LIKE '%x%';

Find the countries that end with land
SELECT name FROM world
WHERE name LIKE '%land';

Find the countries that start with C and end with ia
SELECT name FROM world
WHERE name LIKE 'c%' 
AND name LIKE '%ia';

Find the country that has oo in the name
SELECT name FROM world
WHERE name LIKE '%oo%';

Find the countries that have "t" as the second character.
SELECT name FROM world
WHERE name LIKE '_t%'
ORDER BY name;

Find the countries that have two "o" characters separated by two others.
SELECT name FROM world
WHERE name LIKE '%o__o%';
 
Find the countries that have exactly four characters
SELECT name FROM world
WHERE name LIKE '____';


### 2 SELECT FROM WORLD

#1.
SELECT name, continent, population FROM world

#2.
SELECT name FROM world
WHERE population >= 200000000;

#3.
SELECT name, gdp/population FROM world
WHERE population >= 200000000;

#4.
SELECT name, population/1000000 FROM world
WHERE continent = 'South America';

#5.
SELECT name, population FROM world
WHERE name IN ('France', 'Germany', 'Italy');

#6.
SELECT name FROM world
WHERE name LIKE '%United%';

#7.
SELECT name, population, area 
FROM world
WHERE area > 3000000 OR population > 250000000;

#8.
SELECT name, population, area 
FROM world
WHERE area > 3000000 XOR population > 250000000;

#9.
SELECT name, ROUND(population/1000000, 2), ROUND(GDP/1000000000, 2)
FROM world
WHERE continent LIKE 'South America';

#10.
SELECT name, ROUND(GDP/population, -3)
FROM world
WHERE GDP >= 1000000000000;

#11.
SELECT name, capital
FROM world
WHERE LENGTH(name) = LENGTH(capital)

#12.
SELECT name, capital
FROM world
WHERE LEFT(name,1) LIKE LEFT(capital,1)
AND name <> capital;

#13.
SELECT name
FROM world
WHERE name LIKE '%a%'
AND name LIKE '%e%'
AND name LIKE '%i%'
AND name LIKE '%o%'
AND name LIKE '%u%'
AND name NOT LIKE '% %';

### SELECT WITHIN SELECT 

#1.
SELECT name FROM world
WHERE population >
(SELECT population FROM world
WHERE name='Russia');

#2.
SELECT name
FROM world 
WHERE continent LIKE 'Europe' AND gdp/population > (
SELECT gdp/population
FROM world 
WHERE name = 'united kingdom'
);

#3.
SELECT name, continent 
FROM world 
WHERE continent 
IN (SELECT  continent FROM 
world WHERE name LIKE 'Argentina' 
OR name LIKE 'Australia')
ORDER BY name;

#4.
SELECT name, population 
FROM world
WHERE population > (SELECT population FROM world
WHERE name LIKE 'Canada') 
AND population < (SELECT population FROM world
WHERE name LIKE 'Poland');

#5.
SELECT name, CONCAT(ROUND(100*population/(SELECT  population FROM 
world
WHERE name = 'Germany')), '%') 
FROM world 
WHERE continent = 'Europe';

#6.
SELECT name FROM world
WHERE gdp > ( 
SELECT MAX(gdp) FROM world
WHERE continent = 'Europe');

#7.
SELECT continent, name, area
FROM world
WHERE area IN (SELECT MAX(area) FROM world GROUP BY continent)

#8.
SELECT continent, MIN(name)
FROM world
GROUP BY continent;

#9. 
SELECT name, continent, population FROM world
WHERE continent NOT IN (SELECT  DISTINCT continent FROM world
WHERE population > 25000000)


### 3. SELECT FROM NOBEL

#1.
SELECT yr, subject, winner
FROM nobel
WHERE yr = 1950;

#2.
SELECT winner
FROM nobel
WHERE yr = 1962
AND subject = 'Literature';

#3.
SELECT yr, subject FROM nobel
WHERE winner = 'Albert Einstein';

#4.
SELECT winner
FROM nobel
WHERE subject LIKE 'Peace'
AND yr >= 2000;

#5.
SELECT yr, subject, winner FROM nobel
WHERE yr BETWEEN 1980 AND 1989
AND subject LIKE 'Literature';

#6.
SELECT * FROM nobel
WHERE winner IN ('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama');

#7.            
SELECT winner FROM nobel
WHERE winner LIKE 'John%';

#8.
SELECT yr, subject, winner
FROM nobel 
WHERE subject LIKE 'Physics' AND yr = 1980
OR subject LIKE 'Chemistry' AND yr = 1984;

#9.
SELECT yr, subject, winner FROM nobel
WHERE subject NOT IN ('Chemistry', 'Medicine') AND yr = 1980;

#10.
SELECT yr, subject, winner FROM nobel
WHERE subject LIKE 'Medicine' AND yr < 1910;

#11.
SELECT yr, subject, winner FROM nobel
WHERE winner LIKE '%PETER GRÜNBERG%';

#12.
SELECT yr, subject, winner FROM nobel 
WHERE winner LIKE '%NEILL';

#13.
SELECT winner, yr, subject
FROM nobel
WHERE winner LIKE 'Sir%'
ORDER BY yr DESC, winner;

#14.
SELECT winner, subject FROM nobel
WHERE yr = 1984
ORDER BY 
CASE WHEN subject IN ('Physics', 'Chemistry') THEN 1 ELSE 0 END, subject, winner;
OR subject LIKE 'Literature' AND yr >= 2004;


### SUM AND COUNT
#1.
SELECT SUM(population)
FROM world;

#2.
SELECT DISTINCT continent FROM world;

#3.
SELECT SUM(gdp) FROM world
WHERE continent = 'Africa';

#4.
SELECT COUNT(name) FROM world
WHERE area >= 1000000;

#5.
SELECT SUM(population) FROM world 
WHERE name IN ('Estonia', 'Latvia', 'Lithuania');

#6.
SELECT continent, COUNT(name) FROM world
GROUP BY continent;

#7.
SELECT continent, COUNT(name) FROM world
WHERE population >= 10000000
GROUP BY continent;

#8.
SELECT continent
FROM world
GROUP BY continent
HAVING SUM(population) > 100000000;


### JOIN
#1.
SELECT matchid, player 
FROM goal 
WHERE teamid = 'GER';

#2. 
SELECT id, stadium, team1, team2
FROM game
WHERE id = '1012';

#3. 
SELECT player, teamid, stadium, mdate
FROM game 
JOIN goal ON (game.id=goal.matchid)
WHERE goal.teamid = 'GER';
  
#4. 
SELECT team1, team2, player
FROM game 
JOIN goal ON (game.id=goal.matchid)
WHERE goal.player LIKE 'Mario%';
  
#5. 
SELECT player, teamid, coach, gtime
FROM goal 
JOIN eteam ON (goal.teamid=eteam.id)
WHERE gtime <= 10;

#6. 
SELECT mdate, teamname
FROM game
JOIN eteam ON (team1=eteam.id)
WHERE coach LIKE 'Fernando Santos';

#7. 
SELECT Player 
FROM goal 
JOIN game ON (game.id = goal.matchid)
WHERE stadium LIKE 'NATIONAL STADIUM, WARSAW';

# 8. 
SELECT DISTINCT player
FROM game 
JOIN goal ON matchid = id 
WHERE (team1='GER' OR team2='GER') AND teamid<>'GER'

# 9. 
SELECT teamname, COUNT(*) AS goals
FROM eteam 
JOIN goal ON id=teamid
GROUP BY teamname

# 10.
SELECT stadium, COUNT(*) as goals
FROM game 
JOIN goal ON game.id=goal.matchid
GROUP BY stadium

# 11.
SELECT matchid, mdate, COUNT(teamid)
FROM game 
JOIN goal ON matchid = id 
WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY matchid, mdate

# 12.
SELECT matchid, mdate, COUNT(matchid)
FROM game 
JOIN goal ON id=matchid
WHERE teamid = 'GER'
GROUP BY matchid, mdate


### MORE JOIN

#1. 
SELECT id, title
FROM movie
WHERE yr=1962;

#2. 
SELECT yr
FROM movie
WHERE title LIKE 'Citizen Kane';

#3. 
SELECT id, title, yr
FROM movie
WHERE title LIKE 'Star Trek%';

#4. 
SELECT id
FROM actor
WHERE name LIKE 'Glenn Close';

#5. 
select id 
FROM movie
WHERE title LIKE 'Casablanca';

#6. 
SELECT name
FROM casting
JOIN actor ON casting.actorid=actor.id
WHERE movieid=11768;

#7. 
SELECT name
FROM casting
JOIN actor ON casting.actorid=actor.id
WHERE movieid=(SELECT id FROM movie WHERE title='Alien');

#8. 
SELECT movie.title
FROM movie
JOIN casting ON movie.id=casting.movieid
JOIN actor ON casting.actorid=actor.id
WHERE actor.id = (SELECT id FROM actor WHERE name LIKE 'Harrison Ford');


### NULL
#1.
SELECT name FROM teacher
WHERE dept IS NULL;

#2.
SELECT teacher.name, dept.name
FROM teacher INNER JOIN dept
ON (teacher.dept=dept.id);

#3.
SELECT teacher.name, dept.name
FROM teacher LEFT JOIN dept
ON (teacher.dept=dept.id);

#4.
SELECT teacher.name, dept.name
FROM teacher RIGHT JOIN dept
ON (teacher.dept=dept.id);

#5.
SELECT teacher.name, COALESCE(mobile,'07986 444 2266')
FROM teacher;

#6.
SELECT teacher.name, COALESCE(dept.name, 'None') 
FROM teacher
LEFT JOIN dept ON teacher.dept = dept.id;

#7.
SELECT COUNT(name), COUNT(mobile) from teacher;

#8.
SELECT dept.name, COUNT(teacher.name) FROM teacher
RIGHT JOIN  dept ON teacher.dept = dept.id
GROUP BY dept.name;

#9.
SELECT name, CASE WHEN dept=1 OR dept=2 THEN 'Sci' ELSE 'Art' END
FROM teacher;

#10.
SELECT name, CASE WHEN dept=1 OR dept=2 THEN 'Sci' WHEN dept=3 THEN 'Art'ELSE 'None' END
FROM teacher;

###Self Join
#1.
SELECT COUNT(*) FROM stops;

#2.
SELECT id FROM stops
WHERE name LIKE 'Craiglockhart';

#3.
SELECT id, name
FROM stops
JOIN route ON id=stop
WHERE num = '4' AND company = 'LRT';

#4.
SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*) = 2;

#5.
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
(a.company=b.company AND a.num=b.num)
WHERE a.stop=53 AND b.stop = 149;

