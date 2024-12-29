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
