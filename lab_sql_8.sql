-- List the number of films per category.
SELECT c.category_id, c.name as category, count(fc.film_id) as 'number of films per category'
FROM sakila.category c
LEFT JOIN sakila.film_category fc
  ON c.category_id = fc.category_id
group by 1,2
order by 3 desc;
 
 
-- Display the first and the last names, as well as the address, of each staff member.
SELECT s.staff_id, s.first_name, s.last_name, a.address, a.district
FROM sakila.staff s
LEFT JOIN sakila.address a
  ON s.address_id = a.address_id;


-- Display the total amount rung up by each staff member in August 2005.
select s.first_name, s.last_name, sum(p.amount) as 'total amount'
from sakila.payment p
left join sakila.staff s
  ON s.staff_id = p.staff_id
where year(p.payment_date) = 2005 and month(p.payment_date) = 8
group by 1,2
order by 3 desc;


-- List all films and the number of actors who are listed for each film.
select f.title, count(fa.actor_id) as 'number of actors'
from sakila.film f
left join sakila.film_actor fa
on f.film_id = fa.film_id
group by 1
order by 2 desc;

-- Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. 
	-- List the customers alphabetically by their last names.
select c.customer_id, c.last_name, c.first_name, sum(p.amount) as 'total amount paid'
from sakila.customer c
left join sakila.payment p
on c.customer_id = p.customer_id
group by 1
order by 2,3;