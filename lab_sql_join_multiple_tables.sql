USE sakila;

## 1.Write a query to display for each store its store ID, city, and country.
select * from store;
select * from address;
select * from city;
select * from country;

select s.store_id , c.city , cn.country from store s
join
address a on s.address_id = a.address_id
join city c on a.city_id = c.city_id
join country cn on c.country_id = cn.country_id;


## 2.Write a query to display how much business, in dollars, each store brought in.
select * from store;
select * from staff;
select * from payment;

select s.store_id , sum(p.amount) as total_amount_brought from store s
join
staff st on s.store_id = st.store_id 
join
payment p on st.staff_id = p.staff_id
group by s.store_id;

## 3.What is the average running time of films by category?
select * from film;
select * from film_category;
select * from category;

select c.name as category_name , avg(f.length) as Average_running_time from film f
join
film_category fc on f.film_id = fc.film_id
join
category c on fc.category_id = c.category_id
group by c.name;


## 4.Which film categories are longest?

select c.name as category_name ,max(f.length) as lenght_of_film from film f
join
film_category fc on f.film_id = fc.film_id
join
category c on fc.category_id = c.category_id
group by c.name
order by max(f.length) desc;

## 5.Display the most frequently rented movies in descending order.
select * from rental;
select * from inventory;
select * from film;

select f.title , count(r.rental_id) as Number_of_times_films_rented from film f
join
inventory i on f.film_id = i.film_id
join
rental r on i.inventory_id = r.inventory_id
group by f.title
order by count(r.rental_id) desc;


## 6.List the top five genres in gross revenue in descending order.
select * from film;
select * from inventory;
select * from payment;
select * from rental;
select * from category;
select * from film_category;


select c.name as genres , sum(p.amount) as total_revenue_generated from category c
join
film_category fc on c.category_id = fc.category_id
join
inventory i on fc.film_id = i.film_id
join
rental r on i.inventory_id = r.inventory_id
join 
payment p on r.rental_id = p.rental_id
group by c.name
order by sum(p.amount) desc
limit 5;


## 7.Is "Academy Dinosaur" available for rent from Store 1?
select * from film where title = 'Academy Dinosaur';
select * from inventory ;
select * from store;

select f.film_id , f.title , s.store_id , i.inventory_id from film f
join
inventory i on f.film_id = i.film_id
join 
store s on i.store_id = s.store_id
where f.title = 'Academy Dinosaur' AND s.store_id = 1;
