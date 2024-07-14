--create employee and customers table 
CREATE TABLE employees (
	employee_id INT,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	city VARCHAR(50)
);

CREATE TABLE customers (
    customer_id INT,
	first_name VARCHAR(50),
    last_name VARCHAR(50),
	email VARCHAR(100)
)

--add employee and customer data
INSERT INTO employees (employee_id, first_name, last_name, city)
VALUES (1, 'John', 'Doe', 'New York');

INSERT INTO customers (customer_id, first_name, last_name, email)
VALUES (1, 'Jane', 'Smith', 'jane.smith@example.');

-- The CONCAT function is used to concatenate two or more strings together.
-- it concatenates the first name and last name columns and assigns it to the full_name column.
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM employees;

-- The UPPER function converts a string to uppercase.
SELECT UPPER(first_name) AS uppercase_firstName
FROM customers;
