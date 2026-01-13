
-- constraint(foreign key)
-- data type in sql
-- 
use regex1;
create table customers9( cid int primary key ,cname varchar(20));
insert into customers9 values(10,'aman'),(11,'shubham');

create table orders9(oid int primary key, city varchar(20),cid int,
foreign key(cid) references customers9(cid));
insert into orders9 values(1009,'jaipur',10), (10010,'goa',11),(10011,'jk',10),(10012,'delhi',11);
select * from orders9;
select * from customers9;

-- number => int,decimal
-- tinyint,smallint,mediumint,int,bigint
-- 1 byte, 2 byte, 3 byte, 4 byte, 8 byte
-- 1 byte=8 bit 2**8 =>256 (-128 to 127

use regex1;
create table yash1 (salary tinyint);
insert into yash1 values(127);
insert into yash1 values(128);

create table yash2 (salary float, price double);
insert into yash2 values(100.6781241,100.6781241);

select * from yash2;

-- string values char vs varchar()
-- fixed length/size character (char)
-- variable length character (varchar)

create table yash3(name varchar(20), gender char(10));
insert into yash3 values('tushar','male'),('aman','male'),('nisha','female');
select * from yash3;

insert into yash3 values('raj        ','male        ');
select *, length(name), length(gender) from yash3;


-- ddl ( data defination language)
-- create ( table)
-- drop,truncate,alter

create table raj1(col int);

-- create a table using select ( CTAS)
create table actor_cp as
select first_name, last_name from sakila.actor;

select * from actor_cp;


-- delete a table
drop table actor_cp; -- table structure and data both are deleted
select * from actor_cp;

create table actor_cp as
select first_name as fname, last_name as last from sakila.actor
where actor_id between 10 and 14;

select * from actor_cp;

-- alter 
alter table actor_cp add column (salary int);
select * from actor_cp;

alter table actor_cp add constraint new_key primary key(fname);-- primary key added
alter table actor_cp drop column last; -- column drop
desc actor_cp;

alter table actor_cp rename column salary to newsalary; -- change column name
desc actor_cp; 

select * from actor_cp;
-- dml statement
-- insert 
-- update set col=value
set sql_safe_updates=0;
update actor_cp set newsalary=900;

update actor_cp set newsalary=888 where fname='UMA';
select * from actor_cp;

