#1
CREATE TABLE rentals_may AS
SELECT * FROM rental
WHERE MONTH(rental_date) = 5;

#2
INSERT INTO rentals_may
SELECT * FROM rental
WHERE MONTH(rental_date) = 5;

#3
CREATE TABLE rentals_june AS
SELECT * FROM rental
WHERE MONTH(rental_date) = 6;

#4
INSERT INTO rentals_june
SELECT * FROM rental
WHERE MONTH(rental_date) = 6;


#5
SELECT customer_id, COUNT(*) AS num_rentals
FROM rentals_may
GROUP BY customer_id;

#6
SELECT customer_id, COUNT(*) AS num_rentals
FROM rentals_june
GROUP BY customer_id;



