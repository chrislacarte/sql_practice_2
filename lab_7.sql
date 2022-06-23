USE sakila;
SET sql_mode = '';

-- 1 How many films are there for each of the categories in the category table. Use appropriate join to write this query.

SELECT C.category_id AS 'category id', COUNT(DISTINCT F.film_id) AS 'film count'
FROM sakila.film_category F
JOIN sakila.category C
ON F.category_id = C.category_id
GROUP BY C.category_id; 

-- 2 Display the total amount rung up by each staff member in August of 2005.

SELECT SUM(p.amount) AS 'Tot Payments', s.staff_id
FROM sakila.staff s
JOIN sakila.payment p 
ON s.staff_id = p.staff_id
WHERE month(p.payment_date)=08 AND year(p.payment_date)=2005
GROUP BY s.staff_id;

-- 3 Which actor has appeared in the most films?

SELECT max(F.actor_id),A.actor_id, A.first_name
FROM sakila.film_actor F 
JOIN sakila.actor A
ON  F.actor_id = A.actor_id
ORDER BY A.first_name desc;

-- 4 Most active customer (the customer that has rented the most number of films)
SELECT max(R.customer_id), C.customer_id, C.first_name         
FROM sakila.rental R 
JOIN sakila.customer C
ON  R.customer_id=C.customer_id
ORDER BY C.first_name desc;

-- 5 Display the first and last names, as well as the address, of each staff member.
SELECT S.first_name, S.last_name , A.address_id, A.address
FROM sakila.staff S
JOIN sakila.address A
ON A.address_id = S.address_id;

-- 6 List each film and the number of actors who are listed for that film.
SELECT F.title, COUNT(A.actor_id) AS actor_id
FROM sakila.film F
JOIN sakila.film_actor A
ON A.film_id = F.film_id
GROUP BY F.title;


-- 7 Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT C.last_name, sum(P.amount) AS 'total amount paid'
FROM payment P
JOIN customer C
ON C.customer_id=P.customer_id
GROUP BY C.last_name;

-- 8 List number of films per category.
SELECT F.category_id, COUNT(F.film_id), C.name
FROM film_category F
JOIN category C
ON F.category_id = C.category_id
GROUP BY C.category_id;