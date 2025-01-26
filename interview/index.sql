-- Active: 1729945397893@@127.0.0.1@5432@my_user
CREATE DATABASE MY_USER;

create Table MY_USER (
	id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(20) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

SELECT * FROM MY_USER;




insert into MY_USER (name, email, phone) values ('John', 'john@gmail.com', '1234567890');

--Find the second highest salary from a table.sql 
SELECT MAX(salary) FROM employees WHERE salary < (SELECT MAX(salary) FROM employees);
--or
SELECT salary FROM employees ORDER BY salary DESC LIMIT 1 OFFSET 1;



-- unique second highest salary
SELECT DISTINCT salary FROM employees ORDER BY salary DESC LIMIT 1 OFFSET 1;

-- Find the employees who earn more than the average salary.
SELECT * FROM employees WHERE salary > (SELECT AVG(salary) FROM employees);


-- Find the average salary of employees in each department.
SELECT department, AVG(salary) FROM employees GROUP BY department;

-- Find the total number of employees in each department.
SELECT department, COUNT(*) FROM employees GROUP BY department;

-- Find the highest salary in each department.
SELECT department, MAX(salary) FROM employees GROUP BY department;

-- Find the lowest salary in each department.
SELECT department, MIN(salary) FROM employees GROUP BY department;

-- Find the median salary in each department.
SELECT department, AVG(salary) FROM employees GROUP BY department;


--Write a query to find duplicate rows in a table.
SELECT column1, column2, COUNT(*)
FROM MY_USER
GROUP BY column1, column2
HAVING COUNT(*) > 1;

--Fetch the nth highest salary from a table.
SELECT DISTINCT salary 
FROM employees 
ORDER BY salary DESC 
LIMIT 1 OFFSET n-1;



select * from Employees 
where name LIKE "%a"



SELECT user_id, starts from "reviews" where starts = 3;


-- query to compute the average rating of different products:
select product_id, avg(rating) from reviews group by product_id ORDER BY product_id;



/*
Given the reviews table,
write a query to retrieve the average star rating for each product,
grouped by month.The output should display the month as a numerical value,
product ID,
and average star rating rounded to two decimal places.Sort the output first by month
and then by product ID
*/

SELECT
    EXTRACT(
        DAY
        from submit_date
    ) as mth,
    product_id as product,
    ROUND(AVG(stars), 2) as avg_stars
FROM reviews
GROUP BY
    mth,
    product
ORDER BY mth, product;


-- the review should have 4 or more stars
-- the review ID is less than 6000
-- the review ID is more than 2000
-- the review can't come from user 142
-- Column Name Type review_id integer user_id integer submit_date datetime product_id integer stars integer(1 -5)


SELECT * FROM reviews 
WHERE stars >= 4 
AND review_id > 2000 
AND review_id < 6000
AND user_id != 142;
-- also the cleaner way 
select * from reviews
where stars >=4 AND
review_id BETWEEN 2000 AND 5999
AND user_id <> 142;

/*
"=" - equals to - "=" is used to compare two values for equality
"<> or !=" - not equal to - "<> or !=" is used to compare two values for inequality
">" - greater than - ">" is used to compare two values and returns true if the first value is greater than the second value
"<" - less than - "<" is used to compare two values and returns true if the first value is less than the second value
">=" - greater than or equal to - ">=" is used to compare two values and returns true if the first value is greater than or equal to the second value
"<=" - less than or equal to - "<=" is used to compare two values and returns true if the first value is less than or equal to the second value
*/


/*

the start count is greater than 2,
and less than
or equal to 4 the review must come
from either user 123, 265,
    or 362

*/
SELECT *
FROM reviews
where
    stars > 2
    and stars <= 4
    and user_id IN (123, 265, 362);

-- another way 
SELECT *
FROM reviews
WHERE stars BETWEEN 3 AND 4 AND user_id IN (123, 265, 362);

/*

the review must come from a user who has made at least 5 reviews,
and the average star rating of these reviews must be greater than 4
*/
-- answer
/*
The query selects user IDs from the reviews table where:
1. The user has made at least 5 reviews.
2. The average star rating of these reviews is greater than 4.
*/
SELECT user_id
FROM reviews
GROUP BY
    user_id
HAVING
    COUNT(*) >= 5
    AND AVG(stars) > 4;

/*

medicines which sold between 100,000 units and 105,000 units
AND were manufactured by either Biogen, AbbVie, or Eli Lilly
The output should look like this:
table: pharmacy_sales
manufacturer	drug	units_sold
*/
select manufacturer, drug, units_sold from pharmacy_sales
where units_sold BETWEEN 100000 AND 105000
and manufacturer IN ('Biogen', 'AbbVie', 'Eli Lilly');

--other way 
SELECT manufacturer, drug, units_sold from pharmacy_sales
WHERE units_sold >= 100000 AND units_sold <= 105000
AND (manufacturer = 'Biogen' OR manufacturer = 'AbbVie' OR manufacturer = 'Eli Lilly');


/*
which were manufactured by either Roche, Bayer, or AstraZeneca
and did not sell between 55,000 and 550,000 units
Output the manufacturer name, drug name, 
and the # of units sold. for all the medicines which match that criteria.
*/
select manufacturer, drug, units_sold from pharmacy_sales
where unit_sales NOT BETWEEN 55000 AND 550000
AND manufacturer IN ('Roche', 'Bayer', 'AstraZeneca');


/*
Find all customers who are between the ages of 18 and 22 (inclusive),
 live in either Victoria, Tasmania, Queensland, 
their gender isn't "n/a", and their name starts with either 'A' or 'B'.
*/
SELECT *
FROM customers
WHERE
    age BETWEEN 18 AND 22
    AND state IN (
        'Victoria',
        'Tasmania',
        'Queensland'
    )
    AND gender <> 'n/a'
    AND (customer_name LIKE 'A%' OR customer_name LIKE 'B%');
