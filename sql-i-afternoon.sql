------TABLE-PERSON------

--CREATE TABLE--
CREATE TABLE person (
  id SERIAL,
  name VARCHAR(100),
  age INTEGER,
  height INTEGER,
  city VARCHAR(100),
  favorite_color VARCHAR(100)
)

--ADD 5 PEOPLE--
INSERT INTO person (name, age, height, city, favorite_color)
VALUES ('Rachel', 20, 110, 'Dallas', 'Black'),
('Leora', 46, 105, 'Midland', 'Grey'),
('Timothy', 25, 107, 'Seattle', 'Red'),
('Jim', 40, 113, 'Chicago', 'Green'),
('Josh', 21, 111, 'Odessa', 'Blue');
SELECT * FROM person

--TALLEST TO SHORTEST--
SELECT * FROM person ORDER BY height DESC

--SHORTEST TO TALLEST-- 
SELECT * FROM person ORDER BY height ASC

--OLDEST TO YOUNGEST--
SELECT * FROM person ORDER BY age DESC

--OLDER THAN AGE 20--
SELECT * FROM person
WHERE age > 20

--PEOPLE WHO ARE 18--
SELECT * FROM person 
WHERE age = 18

--PEOPLE WHO ARE LESS THAN 20 OLDER THAN 30-- 
SELECT * FROM person 
WHERE age < 20 OR age > 30

--PEOPLE THAT ARE NOT 27--
SELECT * FROM person 
WHERE age != 27

--FAVORITE COLOR NOT RED--
SELECT * FROM person 
WHERE favorite_color != 'Red'

--FAVORITE COLOR IS NOT RED OR BLUE--
SELECT * FROM person 
WHERE favorite_color != 'Red' AND favorite_color != 'Blue'

--FAVORITE COLOR IS ORANGE OR GREEN--
SELECT * FROM person 
WHERE favorite_color = 'Orange' OR favorite_color = 'Green'

--FAVORITE COLOR IS ORANGE, GREEN, OR BLUE--
SELECT * FROM person 
WHERE favorite_color IN ('Orange', 'Green', 'Blue')

--FAVORITE COLOR IS YELLOW OR PURPLE--
SELECT * FROM person 
WHERE favorite_color IN ('Yellow', 'Purple')




------TABLE ORDERS------

--CREATE TABLE--
CREATE TABLE orders (
  person_id SERIAL,
  product_name VARCHAR(30),
  product_price NUMERIC,
  quantity INTEGER
)

--ADD 5 ORDERS--
INSERT INTO orders (person_id, product_name, product_price, quantity)
VALUES (1,'Brisket', 10.50, 2),
(2, 'Hotdog', 7.50, 3),
(3, 'Taco', 1.00, 1000),
(4, 'Churro', 4.00, 5),
(5, 'Cheese stick', 15.90, 8);

--SELECT ORDER RECORDS--
SELECT * FROM orders

--TOTAL ORDERS ADDED--
SELECT SUM(quantity) FROM orders

--TOTAL PRICE--
SELECT SUM(product_price * quantity) FROM orders

--TOTAL ORDER PRICE FROM SINGLE PERSON--
SELECT SUM(product_price * quantity) FROM orders 
WHERE person_id = 4



------TABLE-ARTIST------

--ADD 3 NEW ARTIST--
INSERT INTO artist (name) 
VALUES ('Imagine Dragons'), ('Fallout Boy'), ('Odesza');

--10 ARTISTS IN REVERSE ALPHABETICAL ORDER--
SELECT * FROM artist ORDER BY name DESC LIMIT 10

--5 ARTIST IN ALPHABETICAL ORDER--
SELECT * FROM artist ORDER BY name ASC LIMIT 5

--ALL ARTIST THAT START WITH THE WORD 'BLACK'--
SELECT * FROM artist WHERE name LIKE 'Black%' 

--ARTIST THAT CONTAIN THE WORD BLACK--
SELECT * FROM artist WHERE name LIKE '%Black' 



------TABLE-EMPLOYEE------

--EMPLOYEES FIRST & LAST NAME THAT LIVE IN CALGARY--
SELECT first_name, last_name FROM employee WHERE city = 'Calgary'

--BIRTHDATE FOR YOUNGEST EMPLOYEE--
SELECT MAX(birth_date) FROM employee

--BIRTHDATE FOR OLDEST EMPLOYEE--
SELECT MIN(birth_date) FROM employee

--EVERYONE THAT REPORTS TO NANCY EDWARDS--
SELECT * FROM employee WHERE reports_to = 2

--TOTAL PEOPLE LIVING IN LETHBRIDGE--
SELECT COUNT(*) FROM employee WHERE city = 'Lethbridge'



------TABLE-INVOICE------

--TOTAL ORDERS MADE IN USA--
SELECT COUNT(*) FROM invoice WHERE billing_country = 'USA'

--LARGEST ORDER TOTAL AMOUNT--
SELECT MAX(total) FROM invoice

--SMALLEST ORDER TOTAL AMOUNT--
SELECT MIN(total) FROM invoice

--ALL ORDERS BIGGER THAN $5--
SELECT * FROM invoice WHERE total > 5

--COUNT HOW MANY ORDERS ARE SMALLER THAN $5--
SELECT COUNT(*) FROM invoice WHERE total < 5

--COUNT HOW MANY ORDERS WERE IN CA, TX, OR AZ--
SELECT COUNT(*) FROM invoice WHERE billing_state IN ('CA', 'TX', 'AZ')

--GET THE AVERAGE TOTAL OF ORDERS--
SELECT AVG(total) FROM invoice

--GET THE TOTAL SUM OF THE ORDERS--
SELECT SUM(total) FROM invoice