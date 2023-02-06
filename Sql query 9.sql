CREATE TABLE rentals_may (
    PersonID int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255)
);

INSERT INTO rental_may
VALUES (rental_id);

CREATE TABLE rentals_june (
    PersonID int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255)
);

SELECT city.city, COUNT(*) AS total_rentals
FROM rental AS r
INNER JOIN customer AS cust on r.customer_id = cust.customer_id
INNER JOIN address AS a on cust.address_id = a.address_id
INNER JOIN city ON city.city_id = a.city_id
GROUP BY city.city_id
ORDER BY total_rentals DESC
LIMIT 1

WITH cte AS (
    SELECT 
      MONTH(rental_date) rental_month_no,
      DATENAME(month, rental_date) rental_month,
      inventory_id,
      COUNT( inventory_id ) no_of_rental,
      ROW_NUMBER( ) OVER ( PARTITION BY MONTH(rental_date) ORDER BY COUNT( inventory_id ) DESC) Rank
    FROM
      rental 
    GROUP BY
      MONTH(rental_date),
      DATENAME(month, rental_date),
      inventory_id 
    HAVING COUNT( inventory_id ) > 1
) 
SELECT
    rental_month,
    cte.inventory_id,
    title,
    no_of_rental,
    rank
FROM
  cte
  JOIN inventory ON cte.inventory_id = inventory.inventory_id
  JOIN film ON inventory.film_id = film.film_id
WHERE
  Rank < 6
ORDER BY rental_month_no, no_of_rental DESC;


