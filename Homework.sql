-- HOMEWORK 

-- 1. How many actors are there with the last name ‘Wahlberg’?
SELECT last_name  
FROM actor 
WHERE last_name = 'Wahlberg'; -- Answer: 2


-- 2. How many payments were made between $3.99 and $5.99?
SELECT COUNT(*)
FROM payment 
WHERE amount >= 3.99 AND amount <= 5.99; -- Answer: 5,607


-- 3. What films have exactly 7 copies? (search in inventory) 
SELECT COUNT(*)
FROM inventory 
WHERE film_id = 7; -- Answer 5


-- 4. How many customers have the first name ‘Willie’?
SELECT COUNT(first_name)
FROM customer 
WHERE first_name = 'Willie'; -- Answer 2


-- 5. What store employee (get the id) sold the most rentals (use the rental table)?
SELECT staff_id, COUNT(*) AS total_rental 
FROM rental 
GROUP BY staff_id 
ORDER BY total_rental 
LIMIT 1; -- Answer 2


-- 6. How many unique district names are there?
SELECT COUNT(DISTINCT country)
FROM country; -- Answer 109


-- 7. What film has the most actors in it? (use film_actor table and get film_id) 
SELECT film_id, COUNT(actor_id)
FROM film_actor 
GROUP BY film_id  
ORDER BY COUNT(actor_id) DESC; -- Answer Lambs Cincinatti 


-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
SELECT COUNT(*) AS customer_count 
FROM customer  
WHERE store_id = 1 AND last_name LIKE '%es%'; -- Answer 15


-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers with ids between 380 and 430? (use group by and having > 250)
SELECT amount, COUNT(*)
FROM payment
WHERE customer_id BETWEEN 380 AND 430 
GROUP BY amount; -- Answer 2


-- 10. Within the film table, how many rating categories are there? And what rating has the most movies total?
SELECT COUNT(DISTINCT rating) AS num_rating_categories, rating, COUNT(*) AS total_movies
FROM film 
GROUP BY rating
ORDER BY total_movies DESC 
LIMIT 1; -- Answer PG-13
