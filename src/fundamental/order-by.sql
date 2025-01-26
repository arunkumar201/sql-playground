INSERT INTO
    Customers (
        first_name,
        last_name,
        email,
        join_date
    )
VALUES (
        'Elena',
        'Rodriguez',
        'elena.r@techcorp.com',
        '2022-03-15'
    ),
    (
        'Michael',
        'Chen',
        'michael.chen@startup.io',
        '2022-01-10'
    ),
    (
        'Sophia',
        'Nakamura',
        'sophia.n@globaltech.com',
        '2022-06-22'
    ),
    (
        'Raj',
        'Patel',
        'raj.patel@innovate.com',
        '2022-04-05'
    );

INSERT INTO
    Products (
        product_name,
        category,
        unit_price
    )
VALUES (
        'Quantum Laptop',
        'Electronics',
        1299.99
    ),
    (
        'Smart Watch Pro',
        'Wearables',
        249.99
    ),
    (
        'Noise-Cancelling Headphones',
        'Audio',
        199.50
    ),
    (
        'Ergonomic Keyboard',
        'Accessories',
        129.99
    );

INSERT INTO
    Orders (
        customer_id,
        order_date,
        total_amount
    )
VALUES (1, '2023-01-15', 1549.98),
    (2, '2023-02-20', 249.99),
    (3, '2023-03-10', 199.50),
    (4, '2023-04-05', 129.99);

INSERT INTO
    OrderDetails (
        order_id,
        product_id,
        quantity,
        unit_price
    )
VALUES (1, 1, 1, 1299.99),
    (1, 2, 1, 249.99),
    (2, 2, 1, 249.99),
    (3, 3, 1, 199.50),
    (4, 4, 1, 129.99);

SELECT first_name, last_name, join_date
FROM Customers
ORDER BY join_date;

SELECT product_name, unit_price
FROM Products
ORDER BY unit_price ASC;

-- Descending sort using DESC keyword
SELECT
    order_id,
    total_amount,
    order_date
FROM Orders
ORDER BY total_amount DESC;

--below sql code will do the multi level sorting with primary on 
-- last_name and secondary on join_date
-- Sort by last_name (1st column), then join_date descending
SELECT first_name, last_name, join_date
FROM Customers
ORDER BY last_name ASC,
    join_date DESC;

-- Column position-based sorting (positional references)
--Sort by column position rather than name
SELECT first_name, last_name, join_date
FROM Customers
ORDER BY 2, 3 DESC;
-- Sort by last_name (2nd column), then join_date descending


SELECT product_name, unit_price
FROM Products
ORDER BY unit_price DESC NULLS LAST;
-- it places the NULL values at end of result set

-- Pagination -  sorting
SELECT product_name, unit_price
FROM Products
ORDER BY unit_price DESC
LIMIT 10 OFFSET 0;

/*------------------------------------------------------------------ */

-- Sorting aggregated results with complex criteria
SELECT
    c.first_name,
    c.last_name,
    COUNT(o.order_id) as total_orders,
    SUM(o.total_amount) as total_spend
FROM Customers c
    LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY total_spend DESC NULLS LAST, -- sorting with Primary: Total spending
    total_orders DESC;
-- soritn on Secondary: Number of orders

-- ----------- 
/*  
- ASC (default) sorts low-to-high, DESC high-to-low
- Use NULLS FIRST/LAST to control NULL placement in sort order
*/
