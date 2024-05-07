-- Active: 1712767786781@@127.0.0.1@5433@practice_db
CREATE TABLE customers (
    customer_id INT, customer_name VARCHAR(256), address VARCHAR(256)
);

CREATE TABLE subscriptions (
    subscription_id INT, description VARCHAR(256), price_per_month INT, subscription_length TEXT
);

CREATE TABLE orders (
    order_id INT, customer_id INT, subscription_id INT, purchase_date DATE
);

INSERT INTO
    customers (
        customer_id, customer_name, address
    )
VALUES (1, 'John Doe', '123 Main St'),
    (2, 'Jane Smith', '456 Elm St'),
    (
        3, 'Bob Johnson', '789 Oak St'
    ),
    (
        4, 'Alice Williams', '321 Maple St'
    ),
    (
        5, 'Charlie Brown', '654 Pine St'
    ),
    (
        6, 'David Davis', '987 Cedar St'
    ),
    (
        7, 'Eve Edwards', '231 Birch St'
    ),
    (
        8, 'Frank White', '465 Walnut St'
    ),
    (
        9, 'Grace Green', '678 Hickory St'
    ),
    (
        10, 'Harry Black', '891 Cherry St'
    );

INSERT INTO
    subscriptions (
        subscription_id, description, price_per_month, subscription_length
    )
VALUES (
        2, 'Basic Plan', 10, '1 month'
    ),
    (
        4, 'Premium Plan', 20, '3 months'
    ),
    (
        5, 'Deluxe Plan', 30, '6 months'
    ),
    (
        6, 'Ultimate Plan', 40, '12 months'
    ),
    (
        8, 'Family Plan', 50, '12 months'
    ),
    (
        9, 'Business Plan', 60, '12 months'
    );

INSERT INTO
    orders (
        order_id, customer_id, subscription_id, purchase_date
    )
VALUES (1, 3, 2, '2017-10-01'),
    (2, 2, 4, '2017-09-01'),
    (3, 3, 4, '2017-02-26'),
    (4, 9, 9, '2017-04-01'),
    (5, 7, 5, '2017-02-25'),
    (6, 8, 2, '2017-01-18'),
    (7, 5, 8, '2017-01-11'),
    (8, 9, 5, '2017-01-26'),
    (9, 4, 4, '2017-01-25'),
    (10, 1, 7, '2017-01-26'),
    (11, 5, 4, '2017-01-07'),
    (12, 3, 2, '2017-01-21'),
    (13, 3, 5, '2017-01-03'),
    (14, 6, 5, '2017-01-22'),
    (15, 1, 2, '2017-01-06'),
    (16, 1, 2, '2017-01-11'),
    (17, 3, 6, '2017-01-17'),
    (18, 3, 8, '2017-01-29'),
    (19, 4, 9, '2017-01-03'),
    (20, 1, 7, '2017-01-24');

select * from orders limit 5;

select * from subscriptions limit 5;

select * from customers limit 5;


select * from orders
INNER JOIN customers
ON orders.customer_id = customers.customer_id

select * from orders as o,customers as c
where o.customer_id = c.customer_id;

-- join the two tables 
select  order_id from orders
UNION
SELECT customer_id from customers; 


