use world;
-- city(id pk), countrycode, is the foreign key

select * from country;
describe city;
select * from city;
-- code(pk
select count(code) ,count(distinct code ) from country;

select cy.name,cy.countrycode  from city as cy;

 select cnt.code,cnt.name,cnt.continent from country as cnt;



select cy.id,cy.name,cy.countrycode ,cnt.code,
cnt.name,cnt.continent from city as cy
join
country as cnt
where cy.countrycode=cnt.code;

select name,governmentform from country as ctry;

