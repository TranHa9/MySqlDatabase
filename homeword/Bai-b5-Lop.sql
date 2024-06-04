-- 1
select COUNT(actor_id)  from actor;

-- 2
select MAX(length) , MIN(length)  from film;

-- 3
select COUNT(film_id) FROM film WHERE rating = 'R';

-- 4
select avg(film.rental_rate) from film where length > 60;

-- 1 
select * from address where address like '%San%';

-- 2
select * from address where address like '1%y';

-- 3
select * from address where address like '__a%';

-- 4
select customer.first_name, customer.last_name 
from customer
inner join address on customer.address_id = address.address_id
where address.address like '%o';

-- 5
select film.title, category.name
from film
inner join film_category on film.film_id = film_category.film_id
inner join category on film_category.category_id = category.category_id
where category.name like '%Games%';

-- 6
select * from testsql.person where salary between 2000 and 3000;

-- 7
select * from testsql.person where month(birthday) between 7 and 12;

-- 8
select *, 'Happy birthday!' as message 
from testsql.person 
where month(birthday) = month(CURDATE());

-- 9 
select * from testsql.person where year(birthday) in (2000, 1990, 1991);


