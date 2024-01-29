--1. List all customers who live in Texas (use JOINs)

--2. Get all payments above $6.99 with the Customer's FullName

--3. Show all customers names who have made payments over $175(usesubqueries)

--4. List all customers that live in Nepal (use the citytable)

--5. Which staff member had the most transactions?

--6. How many movies of each rating arethere?

--7.Show all customers who have made a single payment above $6.99 (Use Subqueries)8. H


--1. List all customers who live in Texas (use JOINs)
-- There is no state column in a customer table, I use customer_president table
SELECT first_name, last_name, order_date, amount
FROM customer_president
INNER JOIN president_order
ON customer_president.customer_id = president_order.customer_id
where customer_state= 'TX';

--2Get all payments above $6.99 with the Customer's FullName
SELECT first_name, last_name, amount
FROM customer_president
INNER JOIN president_order
ON customer_president.customer_id = president_order.customer_id
where amount > 6.99;

--3Show all customers names who have made payments over $175(usesubqueries)

SELECT first_name, last_name, amount
FROM customer_president
INNER JOIN president_order
ON customer_president.customer_id = president_order.customer_id
group by customer_president.customer_id, president_order.amount 
having SUM(amount) >175
order by SUM(amount) desc;



--4 List all customers that live in Nepal (use the citytable)
select  * from customer 

select * from address 

select  * from city

select  * from country 

select first_name, last_name , customer_id 
from customer 
full join address 
on customer.address_id= address.address_id
full join city 
on address.city_id= city.city_id
full join country 
on city.country_id =country.country_id
where country= 'Nepal'
group by customer_id ;



select * from payment
select * from amount

select * from store
select * from staff



--5. Which staff member had the most transactions?

Select staff_id, Count(*) as transaction_count
from payment
group by staff_id
order by transaction_count Desc
Limit 1;

--6. How many movies of each rating arethere?
--Note that , the moive table does not exist, I use film table instead
select * from film

Select rating, Count(*) 
from film 
group by rating;


--Show all customers who have made a single payment above $6.99


select customer.customer_id, customer.first_name ,customer.last_name, payment.amount 
from customer
inner join payment
on customer.customer_id=payment.customer_id
where payment.amount > 6.99;

--How many free rentals did our store give away
select count(*) as free_rentals
from payment
where amount=0



