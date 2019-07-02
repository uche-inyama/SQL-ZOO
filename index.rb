### 0 SELECT BASICS

#1.
SELECT population FROM world
WHERE name = 'Germany';

#2.
SELECT name, population FROM world
WHERE name IN ('Sweden', 'Norway', 'Denmark');

#3.
SELECT name, area FROM world
WHERE area BETWEEN 200000 AND 250000;

###Quiz
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
 WHERE winner IN ('Theodore Roosevelt',
                'Woodrow Wilson',
                'Jimmy Carter',
                'Barack Obama'
            );

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

#SUM AND COUNT

SELECT SUM(population)
FROM world;

SELECT DISTINCT continent FROM world;

SELECT SUM(gdp) FROM world
WHERE continent = 'Africa'

SELECT COUNT(name) FROM world
WHERE area >= 1000000

SELECT SUM(population) FROM world 
WHERE name IN ('Estonia', 'Latvia', 'Lithuania');

SELECT continent, COUNT(name) FROM world
GROUP BY continent;

SELECT continent, COUNT(name) FROM world
WHERE population >= 10000000
GROUP BY continent;

SELECT continent
  FROM world
  GROUP BY continent
HAVING SUM(population) > 100000000