-- Active: 1729945397893@@127.0.0.1@5432@interview
-- Create Customers table
CREATE TABLE Customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    join_date DATE
);

-- Create Products table
CREATE TABLE Products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    unit_price DECIMAL(10, 2)
);

-- Create Orders table
CREATE TABLE Orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers (customer_id)
);

-- Create OrderDetails table
CREATE TABLE OrderDetails (
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10, 2),
    PRIMARY KEY (order_id, product_id), -- composite primary key
    FOREIGN KEY (order_id) REFERENCES Orders (order_id),
    FOREIGN KEY (product_id) REFERENCES Products (product_id)
);

/* ------------------------------------------------------------------
INSERTING DATA
------------------------------------------------------------------ */

INSERT INTO
    Customers
VALUES (
        1,
        'John',
        'Doe',
        'john.doe@email.com',
        '2023-01-15'
    ),
    (
        2,
        'Jane',
        'Smith',
        'jane.smith@email.com',
        '2023-02-20'
    ),
    (
        3,
        'Bob',
        'Johnson',
        'bob.j@email.com',
        '2023-03-10'
    );

--return all customers

select * from customers;

INSERT INTO
    Products
VALUES (
        1,
        'Laptop',
        'Electronics',
        999.99
    ),
    (
        2,
        'Headphones',
        'Electronics',
        89.99
    ),
    (
        3,
        'Coffee Maker',
        'Appliances',
        49.99
    );
--get all products
select * from products;

INSERT INTO
    Orders
VALUES (1, 1, '2023-04-01', 1089.98),
    (2, 2, '2023-04-15', 49.99),
    (3, 1, '2023-05-01', 89.99);
--get all orders
select * from Orders;

INSERT INTO
    OrderDetails
VALUES (1, 1, 1, 999.99),
    (1, 2, 1, 89.99),
    (2, 3, 1, 49.99),
    (3, 2, 1, 89.99);

--get the orders details
SELECT * FROM Customers;

SELECT * FROM Products;

SELECT * FROM Orders;

SELECT * FROM OrderDetails;

-- Question: Select specific columns with column aliasing
/*
Column aliases (using AS) make output more readable and are
essential when working with calculated fields or joining tables
*/
SELECT
    first_name AS FirstName,
    last_name AS LastName,
    email AS EmailAddress
FROM Customers;

/* ------------------------------------------------------------------
FILTERING AND SORTING
WHERE and ORDER BY are fundamental to data retrieval
------------------------------------------------------------------ */

/*
The WHERE clause filters rows before grouping operations.
Multiple conditions can be combined using 
AND, OR, NOT , IN, LIKE, BETWEEN, IS NULL, IS NOT NULL
*/
SELECT product_name, unit_price
FROM Products
WHERE
    unit_price <= 100
ORDER BY unit_price DESC;

/* ------------------------------------------------------------------
JOINS
------------------------------------------------------------------ */
/*
INNER JOIN returns only the rows where there's a match in both tables.
*/

SELECT o.order_id, c.first_name, c.last_name, o.order_date, o.total_amount
FROM Orders as o
    INNER JOIN Customers as c ON o.customer_id = c.customer_id;

-- Left Join to find all customers and their orders (if any)
/*
LEFT JOIN returns all rows from the left table and matching rows
from the right table. If no match, NULL values are returned.
*/
SELECT c.first_name, c.last_name, o.order_id as order_id
FROM Customers as c
    LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    o.order_id,
    c.last_name
HAVING
    order_id IS NOT NULL;

/* ------------------------------------------------------------------
 AGGREGATION AND GROUPING
------------------------------------------------------------------ */

-- Find total sales by category
/* the total sales by category and number of orders and 
total sales rounded to two decimal places 
from  orders , products tables,orderDetails table
having total_amount > 100;
*/

select
    p.category,
    count(DISTINCT o.order_id) as unique_orders,
    ROUND(
        SUM(od.quantity * od.unit_price),
        2
    ) as total_sales
from
    Products as P
    INNER JOIN OrderDetails as od ON P.product_id = Od.product_id
    INNER JOIN Orders as o on o.order_id = od.order_id
GROUP BY
    p.category
HAVING
    SUM(od.quantity * od.unit_price) > 100
ORDER BY total_sales DESC;

/* ------------------------------------------------------------------
SUBQUERIES
Subqueries can appear in SELECT, FROM, or WHERE clauses
------------------------------------------------------------------ */

-- Find customers who have made purchases above average
SELECT c.first_name, c.last_name, o.total_amount
FROM Customers c
    INNER JOIN Orders o ON c.customer_id = o.customer_id
WHERE
    o.total_amount > (
        SELECT AVG(total_amount)
        FROM Orders
    );

/* ------------------------------------------------------------------
STRING OPERATIONS AND FORMATTING
Data cleaning and formatting
------------------------------------------------------------------ */

-- Format customer names and emails
SELECT
    CONCAT(
        UPPER(LEFT(first_name, 1)),
        LOWER(SUBSTRING(first_name, 2))
    ) as formatted_first_name,
    CONCAT(
        UPPER(LEFT(last_name, 1)),
        LOWER(SUBSTRING(last_name, 2))
    ) as formatted_last_name,
    LOWER(email) as lowercase_email,
    CONCAT(first_name, ' ', last_name) as full_name
FROM Customers;

/* ------------------------------------------------------------------
DATE AND TIME OPERATIONS
------------------------------------------------------------------ */
SELECT
    first_name,
    last_name,
    join_date,
    DATEDIFF (day, join_date, GETDATE ()) as days_since_joining,
    DATEADD (year, 1, join_date) as membership_renewal_date
FROM Customers;

/* ------------------------------------------------------------------
 AGGREGATION
*/
SELECT
    o.order_date,
    o.total_amount,
    SUM(o.total_amount) OVER (
        ORDER BY o.order_date
    ) as running_total,
    AVG(o.total_amount) OVER (
        ORDER BY o.order_date ROWS BETWEEN 2 PRECEDING
            AND CURRENT ROW
    ) as moving_average_3_days
FROM Orders o
ORDER BY o.order_date;

-- BETWEEN operator 
-- it is a logical operator that selects values within a given range. The values can be numbers, text,
-- or dates. It has to be paired with the AND operator.

-- Syntax
-- BETWEEN expression1 AND expression2

-- Select records from a table where the age is between 25 and 30
SELECT * FROM orders WHERE total_amount BETWEEN 100 AND 3000;

--the BETWEEN operator's range is inclusive. 
--it means both the start and end values of the range are included!
