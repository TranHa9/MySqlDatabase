-- 1 Lấy ra tên các thành phố và tên các quốc gia tương ứng của thành phố đó
select city.city, country.country from city
inner join country
on city.country_id = country.country_id;

-- Lấy ra tên các thành phố của nước Mỹ
select city.city, country.country from city
inner join country
on city.country_id = country.country_id
where country = 'United States';


-- 3. Lấy ra các địa chỉ của thành phố Hanoi
select address.address as diaChi, city.city as thanhPho
from address inner join city
on address.city_id = city.city_id
where city.city = "Hanoi";

-- 4. Lấy ra tên, mô tả, tên category của các bộ phim có rating = R
select film.title as tenPhim, film.description as moTa, category.name as theLoai
from film
inner join film_category on film.film_id = film_category.film_id
inner join category on category.category_id = film_category.category_id
where film.rating = 'R';

-- 5. Lấy ra thông tin của các bộ phim mà diễn viên NICK WAHLBERG tham gia
select * from film
inner join film_actor on film.film_id = film_actor.film_id
inner join actor on actor.actor_id = film_actor.actor_id
where actor.first_name = 'NICK' and actor.last_name = 'WAHLBERG';

-- 6. Tìm email của các khách hàng ở Mỹ
select customer.email, country.country from customer
inner join address on  customer.address_id = address.address_id
inner join city on address.city_id = city.city_id
inner join country on city.country_id = country.country_id
where country.country = 'United States';