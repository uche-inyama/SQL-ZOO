#SELECT BASICS

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

# SELECT FROM WORLD
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


SELECT name FROM world
WHERE population >= 200000000;


SELECT name, gdp/population FROM world
WHERE population >= 200000000;

SELECT name, population/1000000 FROM world
WHERE continent = 'South America';

SELECT name, population FROM world
WHERE name IN ('France', 'Germany', 'Italy');

SELECT name FROM world
WHERE name LIKE '%United%';


SELECT name, population, area 
FROM world
WHERE area > 3000000 OR population > 250000000;

SELECT name, population, area 
FROM world
WHERE area > 3000000 XOR population > 250000000;


SELECT name, ROUND(population/1000000, 2), ROUND(GDP/1000000000, 2)
FROM world
WHERE continent LIKE 'South America';

SELECT name, ROUND(GDP/population, -3)
FROM world
WHERE GDP >= 1000000000000;


SELECT name, capital
FROM world
WHERE LENGTH(name) = LENGTH(capital)


SELECT name, capital
FROM world
WHERE LEFT(name,1) LIKE LEFT(capital,1)
AND name <> capital;

SELECT name
FROM world
WHERE name LIKE '%a%'
AND name LIKE '%e%'
AND name LIKE '%i%'
AND name LIKE '%o%'
AND name LIKE '%u%'
AND name NOT LIKE '% %';