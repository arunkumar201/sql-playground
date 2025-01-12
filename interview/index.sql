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
