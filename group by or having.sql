use sakila;
show tables;
select * from payment ;
select * from payment where amount=2.99;
select amount, count(*) from payment group by amount;
select customer_id,sum(amount) from payment group by customer_id; 
select customer_id, sum(amount) from payment where amount>3 group by customer_id;
select payment_date, month(payment_date) from payment;
select * from payment where month(payment_date)=5;
select customer_id,count(amount) from payment
where month(payment_date)=5 group by customer_id;
select staff_id, max(amount),avg(amount),sum(amount) from payment where customer_id%2=0 group by staff_id;
select amount,count(amount) from payment where staff_id=1 group by amount having count(amount)>30;
select count(customer_id) ,avg(amount),sum(amount),month(payment_date) from payment where staff_id=1 or staff_id=2 
group by month(payment_date);
select count(customer_id) ,avg(amount),sum(amount),month(payment_date),year(payment_date)  from payment where staff_id=1 or staff_id=2 
group by month(payment_date),year(payment_date) ;


-- order by
select * from payment order by customer_id,amount desc;
