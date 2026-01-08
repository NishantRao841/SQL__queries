create database regex1;
use regex1;
create table test1( sno int); -- tables create ( sno column name)

describe test1;
-- dml(insert statement)
-- dml( insert, update,delete,merge)
insert into test1 values(10);
select  * from test1;
insert into test1 (sno) values(11);
insert into test1(sno) values(20),(null),(30); -- 3 rows insert ( multiple values )

select count(sno),count(*) from test1;

-- not null
create table test2(sno int not null, salary int);
insert into test2(sno,salary) values(20,1000);
insert into test2(sno,salary) values(20,null);
insert into test2(sno,salary) values(null,1000); -- we have set constrait  ( error)
insert into test2(sno) values(1000);
insert into test2(salary) values(5000000); -- error ( because not null and no default set

select * from test2;

-- default
create table test3( sno int not null default 80,salary int);
insert into test3( salary) values(1000);

insert into test3(sno) values(5000);
select * from test3;

-- unique
create table test4( sno int not null, salary int unique default 100);
select * from test4;

insert into test4( sno,salary) values(1000,20000);
insert into test4(sno,salary) values(1001,20000); -- error duplicate values

insert into test4(sno) values(600);
select * from test4;
insert into test4 (sno) values(700);   -- error 100 is a vlaue already in table

insert into test4(sno,salary) values(1001,null); -- multiple null values can be inserted
insert into test4(sno,salary) values(100122,null);

-- condition 
-- check conditions
 create table test7( sno int,salary int,
 check ( sno between 1 and 100),
 check ( salary in (1000,2000) ));
 
 insert into test7( sno,salary) values(4,1000);
 select * from test7;
 insert into test7(sno,salary) values(150,1000);-- error
 insert into test7(sno,salary) values(90,1500);-- error
 
 drop table test7;
 create table test7( sno int, salary int,
 constraint regex_test7_sno_chk check (sno between 1 and 100),
  constraint regex_test7_salary_chk check ( salary in (1000,2000) ));
  
  