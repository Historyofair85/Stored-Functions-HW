-- 1. Create a Stored Procedure that will insert a new film into the film table with the
-- following arguments: title, description, release_year, language_id, rental_duration,
-- rental_rate, length, replace_cost, rating

SELECT*
FROM film 

INSERT INTO film(title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating)
VALUES()

CREATE OR REPLACE PROCEDURE add_film
(title VARCHAR, description VARCHAR, release_year INTEGER, language_id INTEGER, rental_duration INTEGER, 
rental_rate NUMERIC(5,2), length INTEGER, replacement_cost NUMERIC(5,2), rating mpaa_rating)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO film(title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating)
	VALUES(title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating);
END;
$$;

CALL add_film('Ready Player One', 'A film about virtual reality and how real it can be just with your imagination', 2018, 1, 9, 2.99, 140, 16.99, 'PG-13');
CALL add_film('Akira', 'Neo Future Tokyo is in danger by a secret government project with powerful psychics gone wrong ', 1988, 1, 10, 5.99, 124, 16.99, 'R');


-- 2. Create a Stored Function that will take in a category_id and return the number of
-- films in that category



SELECT  count(*) AS number_of_films
FROM category c
JOIN film_category fc 
ON fc.category_id = c.category_id 
WHERE c.category_id = 12

GROUP BY c.category_id , name

CREATE OR REPLACE FUNCTION number_of_film(num INTEGER)
RETURNS INTEGER
LANGUAGE plpgsql
AS $$
	DECLARE cat_id INTEGER;
BEGIN
	SELECT  count(*) INTO cat_id
	FROM category c
	JOIN film_category fc 
	ON fc.category_id = c.category_id 
	WHERE c.category_id = num
	GROUP BY c.category_id , name;
	RETURN cat_id;
END;
$$;


SELECT number_of_film(12);
SELECT number_of_film(14);