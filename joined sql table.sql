use world;

-- city(id pk), countrycode, is the foreign key

select * from country;
describe city;
select * from city;
-- code(pk
select count(code) ,count(distinct code ) from country;
select id,name,countrycode from city;


select cy.id, cy.name,cy.countrycode  from city as cy;

 select cnt.code,cnt.name,cnt.continent from country as cnt;



select cy.id,cy.name,cy.countrycode ,cnt.code,
cnt.name,cnt.continent from city as cy
join
country as cnt
where cy.countrycode=cnt.code;

select ctry.name,ctry.governmentform from country as ctry;
select ct,name,ct.population from city as ct 
join
country as ctry
where ct.countrycode=ctry.code;
use sakila;
select * from actor;
select * from film_actor;
select a.first_name, a.actor_id from actor as a;

select a.first_name, a.actor_id from actor as a
join film_actor as fa
where a.actor_id=fa.actor_id;
select fa.actor_id,fa.film_id from film_actor as fa;

select * from film;
select fa.film_id,fa.actor_id from film_actor as fa;
select fa.film_id,fa.actor_id, f.film_id,f.title from film_actor as fa
join  film as f
where fa.film_id= f.film_id;





