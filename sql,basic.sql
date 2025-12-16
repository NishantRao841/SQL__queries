-- comment  (SQL programming language)
-- Query karna

show databases;

-- to create database ( to organise data)
create database tata;

-- to utilize the database for which data will be stored


-- to see tables
use  world;
show tables;
select * from country;
select * from country where continent='Asia';
select* from country where indepyear=1991;
select name,continent,indepyear from country where indepyear=1991;
select * from country where continent in ('Africa','Asia');
select * from country where indepyear in (1960,1991);
select * from country where indepyear between 1960 and 1991;
select * from country where indepyear not between 1960 and 1991;
select * from country where indepyear not in (1960 and 1991);
select * from country where region  != ('southern Europe');
select name,population,population*0.1 from country;
select* from country where lifeexpectancy in (75.1,78.1);
-- like operator
-- match a pattern
-- name => letter start, letter include,letter end
-- % : special character / wildcard character
-- % : zero or more character
-- _ (underscore) : only 1 character
-- 'A'
select * from country where name like'____';
select * from country where name like '%a';
select * from country where name like'a%';
select * from country where  name like 'n%';

-- get country name and continent where continent start from n
-- 2nd last letter is p in continent
-- get the country where the continent have 4 character
-- 2nd letter is a 2dlast is a in region column
-- in region where 3rd char is c and last 3 char sia
-- get the name and region where the continent is north america or south america 


-- continent like ''
select * from country ,continent where name like'n%';

-- basic function
-- case conversion
use world;
select name,upper(name),lower(name) from country;
select name,code,concat(name,'&',code,'mukul') from country;
-- concat_ws->first thing we should give is seprator,then name,code,'str'
select name,code,concat(name,'&',code,'mukul'),
concat_ws('$',name,code,'mukul')from country;
select name,code,concat(name,'',code) from country
where concat(name,' ',code)='Afganistan AFG';
-- where in the region the continent should be present
-- North Europe  Europe
-- where like %Europe
-- continent like region
-- region like concat('%',continent)
select name,region,continent from country
where region like concat('%',continent);

-- country name,continent,population where first char of continent=country

-- to find first letter from left side  => left(name,1)
-- 1st character is same as of country
select name,continent from country
where left(continent,1)=left(name,1);
use world;
-- numeric and date function
select lifeexpectancy,round(lifeexpectancy) from country;
select 30.68, round(30.641,2);
-- 456.12
-- 6->one place,5,10=>0 yh fir 10
-- 76->0 yh 100
-- 176 200yh 0
-- round=>round of the neraest 10th place, nearest 10000
select 6.0012, round(467.0012,-2);
select 6.0012, round(5167.0012,-3);
select 6.0012, round(463.0172,2);
select 6.0012, round(457.68,-2);
-- round, truncate yh fir last ceil
select 456.68,round(3653.68,1), truncate(3653.68,1);
select mod(10,3),ceil(4.0000001),floor(4.999999),pow(2,4);
-- date function( now()  <= current date and time
select now(),current_timestamp(),current_date(),current_time();
-- add date function  =>. by default date add,(month,year,time)
select now(), adddate(now(),2);
select now(), adddate(now(),2), adddate(now(),interval 2 month);
select now(), year(now() );
-- extract (year / month / hour/ minute/ week
select now(), extract(year from now());
select now(), extract(month from now());
-- date_format => extract but with a string ( message)

-- distinct=> to show unique values
select distinct continent from country;
select distinct continent, region from country;
-- aggerate function(multi line function)=>will give you some result
-- count(col)=>only data present will be counted
select count(indepyear) from country;
select count(*) from country;
select count(population),sum(population), avg(population),
max(population), min(population) from country;
select count(continent), count(distinct continent) from country;

-- get the total countries,avg life ecpectict and the totao popu
select  count(name), count(region), avg(lifeexpectancy), sum(population) from country where
1947<indepyear<1998 ;
select count(name), count(distinct region),sum( population), max(lifeexpectancy),sum(capital) from country 
where name like 'a%' or name like 'd%';

-- GROUP BY  statement ( similiar value ko collect karna in a group)
-- 
select continent from country group by continent;
select continent,count(name) from country group by continent;
-- jis bhi column par group by karte hai usi ko select me likhte hai
select indepyear,count(name),sum(population) from country group by indepyear;
select continent,count(name) from country group by continent;
select continent ,count(name) from country where indepyear>1950 group by continent;
-- where me vahi data filter hoga jo data(column) aapki table me present hoga
-- having group, by ke baad lagta hai or where, group by ke pehle
-- we can use both in a line
select continent ,count(name) from country group by continent having count(name)>30;
select continent ,sum(population) from country group by continent;
select continent ,sum(population) from country group by continent having sum(population)>30401150;
select indepyear,count(indepyear) from country where indepyear > 1930 group by indepyear
having count(indepyear)>2;
select * from country;
select governmentform,count(name) from country  group by governmentform  having count(name)>20;
select governmentform,count(name) from country where capital>30 group by governmentform ;
select continent, count(name),count(region) ,sum(population) from country where lifeexpectancy>38 
group by continent having sum(population)>300000;