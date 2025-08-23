-- Drop tables if they exist
DROP TABLE If EXISTS order_items;

DROP TABLE IF EXISTS orders;

DROP TABLE IF EXISTS products;

DROP TABLE IF EXISTS categories;

DROP TABLE IF EXISTS users;

DROP TABLE IF EXISTS user_profiles;

-- Create Users table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    name VARCHAR(255) NOT NULL,
    status VARCHAR(20) DEFAULT 'active',
    created_at TIMESTAMP DEFAULT current_timestamp,
    updated_at TIMESTAMP DEFAULT current_timestamp
);

-- User Profiles table (1:1 relationship with users)
CREATE TABLE user_profiles (
    id SERIAL PRIMARY KEY,
    user_id INT UNIQUE,
    phone VARCHAR(20),
    address TEXT,
    city VARCHAR(100),
    country VARCHAR(100),
    date_of_birth DATE,
    Foreign Key (user_id) REFERENCES users (id) on delete CASCADE
);

-- Create Categories table
CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Products table
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    category_id INT,
    stock_quantity INT DEFAULT 0,
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES categories (id) ON DELETE SET NULL
);

-- Create Orders table
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    user_id INT,
    order_number VARCHAR(255) NOT NULL UNIQUE,
    total_amount DECIMAL(10, 2),
    status VARCHAR(50) DEFAULT 'pending',
    order_date DATE DEFAULT CURRENT_DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE SET NULL
);

-- Create the products table
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    category_id INT,
    stock_quantity INT DEFAULT 0,
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES categories (id) ON DELETE SET NULL
);

-- Create Order Items table
CREATE TABLE order_items (
    id SERIAL PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    unit_price DECIMAL(10, 2) NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    -- on delete CASCADE enforce the , if an order is deleted, all its items are also deleted
    FOREIGN KEY (order_id) REFERENCES orders (id) ON DELETE CASCADE,
    --on delete RESTRICT enforce the , if a product is already referenced by an order, it cannot be deleted
    FOREIGN KEY (product_id) REFERENCES products (id) ON DELETE RESTRICT
);

-- Create Indexes
-- syntax CREATE INDEX index_name ON table_name (column_name);
CREATE INDEX idx_users_email ON users (email);

CREATE INDEX idx_users_status ON users (status);

CREATE INDEX idx_products_category ON products (category_id);

CREATE INDEX idx_products_active ON products (is_active);

CREATE INDEX idx_orders_user ON orders (user_id);

CREATE INDEX idx_orders_status ON orders (status);

CREATE INDEX idx_orders_date ON orders (order_date);

CREATE INDEX idx_order_items_order ON order_items (order_id);

CREATE INDEX idx_order_items_product ON order_items (product_id);

-- Insert  data

-- Insert Users
INSERT INTO
    users (
        id,
        email,
        name,
        status,
        created_at
    )
VALUES (
        1,
        'john.doe@email.com',
        'John Doe',
        'active',
        '2023-01-15 10:30:00'
    ),
    (
        2,
        'jane.smith@email.com',
        'Jane Smith',
        'active',
        '2023-02-20 14:22:00'
    ),
    (
        3,
        'mike.johnson@email.com',
        'Mike Johnson',
        'inactive',
        '2023-03-10 09:15:00'
    ),
    (
        4,
        'sarah.wilson@email.com',
        'Sarah Wilson',
        'active',
        '2023-04-05 16:45:00'
    ),
    (
        5,
        'david.brown@email.com',
        'David Brown',
        'active',
        '2023-05-12 11:20:00'
    ),
    (
        6,
        'lisa.davis@email.com',
        'Lisa Davis',
        'active',
        '2023-06-18 13:35:00'
    ),
    (
        7,
        'robert.miller@email.com',
        'Robert Miller',
        'inactive',
        '2023-07-22 08:10:00'
    ),
    (
        8,
        'emily.taylor@email.com',
        'Emily Taylor',
        'active',
        '2023-08-14 15:50:00'
    ),
    (
        9,
        'james.anderson@email.com',
        'James Anderson',
        'active',
        '2023-09-03 12:25:00'
    ),
    (
        10,
        'maria.garcia@email.com',
        'Maria Garcia',
        'active',
        '2023-10-08 17:40:00'
    ),
    (
        11,
        'william.jones@email.com',
        'William Jones',
        'active',
        '2023-11-15 10:05:00'
    ),
    (
        12,
        'jessica.white@email.com',
        'Jessica White',
        'suspended',
        '2023-12-01 14:30:00'
    ),
    (
        13,
        'daniel.lee@email.com',
        'Daniel Lee',
        'active',
        '2024-01-10 09:45:00'
    ),
    (
        14,
        'amanda.clark@email.com',
        'Amanda Clark',
        'active',
        '2024-02-14 16:20:00'
    ),
    (
        15,
        'christopher.hall@email.com',
        'Christopher Hall',
        'active',
        '2024-03-20 11:55:00'
    );

-- Insert User Profiles
INSERT INTO
    user_profiles (
        user_id,
        phone,
        address,
        city,
        country,
        date_of_birth
    )
VALUES (
        1,
        '+1-555-0101',
        '123 Main St',
        'New York',
        'USA',
        '1990-05-15'
    ),
    (
        2,
        '+1-555-0102',
        '456 Oak Ave',
        'Los Angeles',
        'USA',
        '1988-12-20'
    ),
    (
        4,
        '+1-555-0104',
        '789 Pine Rd',
        'Chicago',
        'USA',
        '1992-03-10'
    ),
    (
        5,
        '+1-555-0105',
        '321 Elm St',
        'Houston',
        'USA',
        '1985-09-25'
    ),
    (
        6,
        '+44-20-7946-0958',
        '42 Baker Street',
        'London',
        'UK',
        '1991-07-08'
    ),
    (
        8,
        '+1-555-0108',
        '654 Maple Dr',
        'Phoenix',
        'USA',
        '1993-11-30'
    ),
    (
        9,
        '+1-555-0109',
        '987 Cedar Ln',
        'Philadelphia',
        'USA',
        '1987-04-18'
    ),
    (
        10,
        '+34-91-123-4567',
        'Calle Gran Via 45',
        'Madrid',
        'Spain',
        '1989-08-12'
    ),
    (
        13,
        '+1-555-0113',
        '147 Birch Ave',
        'San Antonio',
        'USA',
        '1994-01-05'
    ),
    (
        15,
        '+1-555-0115',
        '258 Willow St',
        'San Diego',
        'USA',
        '1986-10-22'
    );

-- Insert Categories
INSERT INTO
    categories (id, name, description)
VALUES (
        1,
        'Electronics',
        'Electronic devices and gadgets'
    ),
    (
        2,
        'Clothing',
        'Apparel and fashion items'
    ),
    (
        3,
        'Books',
        'Physical and digital books'
    ),
    (
        4,
        'Home & Garden',
        'Home improvement and gardening supplies'
    ),
    (
        5,
        'Sports',
        'Sports equipment and accessories'
    ),
    (
        6,
        'Toys',
        'Toys and games for all ages'
    );

-- Insert Products
INSERT INTO
    products (
        id,
        name,
        price,
        category_id,
        stock_quantity,
        is_active
    )
VALUES (
        1,
        'Laptop Pro 15"',
        1299.99,
        1,
        25,
        true
    ),
    (
        2,
        'Wireless Headphones',
        89.99,
        1,
        50,
        true
    ),
    (
        3,
        'Cotton T-Shirt',
        19.99,
        2,
        100,
        true
    ),
    (
        4,
        'Jeans Classic Fit',
        59.99,
        2,
        75,
        true
    ),
    (
        5,
        'Programming Guide',
        45.50,
        3,
        30,
        true
    ),
    (
        6,
        'Mystery Novel',
        12.99,
        3,
        200,
        true
    ),
    (
        7,
        'Garden Hose 50ft',
        29.99,
        4,
        15,
        true
    ),
    (
        8,
        'Power Drill',
        149.99,
        4,
        20,
        true
    ),
    (
        9,
        'Tennis Racket',
        79.99,
        5,
        12,
        true
    ),
    (
        10,
        'Basketball',
        24.99,
        5,
        40,
        true
    ),
    (
        11,
        'Board Game Deluxe',
        34.99,
        6,
        25,
        true
    ),
    (
        12,
        'Action Figure Set',
        18.99,
        6,
        60,
        true
    ),
    (
        13,
        'Smartphone',
        699.99,
        1,
        0,
        false
    ), -- Out of stock, inactive
    (
        14,
        'Winter Jacket',
        129.99,
        2,
        35,
        true
    ),
    (
        15,
        'Cookbook Collection',
        29.99,
        3,
        45,
        true
    ),
    (
        16,
        'Discontinued Item',
        99.99,
        NULL,
        0,
        false
    ), -- No category, inactive
    (
        17,
        'New Product',
        199.99,
        NULL,
        5,
        true
    );
-- No category yet, active

-- Insert Orders (including some without users - deleted users)
INSERT INTO
    orders (
        id,
        user_id,
        order_number,
        total_amount,
        status,
        order_date
    )
VALUES (
        1,
        1,
        'ORD-2024-001',
        1389.98,
        'completed',
        '2024-01-15'
    ),
    (
        2,
        2,
        'ORD-2024-002',
        79.98,
        'completed',
        '2024-01-20'
    ),
    (
        3,
        4,
        'ORD-2024-003',
        45.50,
        'completed',
        '2024-02-05'
    ),
    (
        4,
        5,
        'ORD-2024-004',
        199.97,
        'shipped',
        '2024-02-12'
    ),
    (
        5,
        6,
        'ORD-2024-005',
        89.99,
        'completed',
        '2024-02-18'
    ),
    (
        6,
        8,
        'ORD-2024-006',
        164.98,
        'processing',
        '2024-03-01'
    ),
    (
        7,
        9,
        'ORD-2024-007',
        104.98,
        'completed',
        '2024-03-08'
    ),
    (
        8,
        10,
        'ORD-2024-008',
        59.99,
        'shipped',
        '2024-03-15'
    ),
    (
        9,
        13,
        'ORD-2024-009',
        89.98,
        'completed',
        '2024-03-22'
    ),
    (
        10,
        15,
        'ORD-2024-010',
        349.97,
        'processing',
        '2024-03-28'
    ),
    (
        11,
        1,
        'ORD-2024-011',
        129.99,
        'completed',
        '2024-04-02'
    ),
    (
        12,
        2,
        'ORD-2024-012',
        67.48,
        'cancelled',
        '2024-04-05'
    ),
    (
        13,
        NULL,
        'ORD-2024-013',
        199.99,
        'completed',
        '2024-04-08'
    ), -- Deleted user
    (
        14,
        14,
        'ORD-2024-014',
        0.00,
        'pending',
        '2024-04-10'
    ), -- Empty order
    (
        15,
        11,
        'ORD-2024-015',
        234.97,
        'shipped',
        '2024-04-12'
    );

-- Insert Order Items
INSERT INTO
    order_items (
        order_id,
        product_id,
        quantity,
        unit_price,
        total_price
    )
VALUES
    -- Order 1 (John Doe)
    (1, 1, 1, 1299.99, 1299.99),
    (1, 2, 1, 89.99, 89.99),
    -- Order 2 (Jane Smith)
    (2, 3, 2, 19.99, 39.98),
    (2, 6, 3, 12.99, 38.97),
    -- Order 3 (Sarah Wilson)
    (3, 5, 1, 45.50, 45.50),
    -- Order 4 (David Brown)
    (4, 4, 2, 59.99, 119.98),
    (4, 9, 1, 79.99, 79.99),
    -- Order 5 (Lisa Davis)
    (5, 2, 1, 89.99, 89.99),
    -- Order 6 (Emily Taylor)
    (6, 7, 2, 29.99, 59.98),
    (6, 8, 1, 149.99, 149.99),
    -- Order 7 (James Anderson)
    (7, 10, 1, 24.99, 24.99),
    (7, 9, 1, 79.99, 79.99),
    -- Order 8 (Maria Garcia)
    (8, 4, 1, 59.99, 59.99),
    -- Order 9 (Daniel Lee)
    (9, 11, 1, 34.99, 34.99),
    (9, 12, 3, 18.99, 56.97),
    -- Order 10 (Christopher Hall)
    (10, 14, 1, 129.99, 129.99),
    (10, 15, 2, 29.99, 59.98),
    (10, 1, 1, 1299.99, 1299.99),
    -- Order 11 (John Doe - second order)
    (11, 14, 1, 129.99, 129.99),
    -- Order 12 (Jane Smith - cancelled)
    (12, 3, 1, 19.99, 19.99),
    (12, 10, 2, 24.99, 49.98),
    -- Order 13 (Deleted user)
    (13, 17, 1, 199.99, 199.99),
    -- Order 15 (William Jones)
    (15, 2, 1, 89.99, 89.99),
    (15, 5, 1, 45.50, 45.50),
    (15, 6, 8, 12.99, 103.92);

SELECT setval ( 'users_id_seq', ( SELECT MAX(id) FROM users ) );

SELECT setval (
        'categories_id_seq', (
            SELECT MAX(id)
            FROM categories
        )
    );

SELECT setval (
        'products_id_seq', (
            SELECT MAX(id)
            FROM products
        )
    );

SELECT setval ( 'orders_id_seq', ( SELECT MAX(id) FROM orders ) );

SELECT 'Users' as table_name, COUNT(*) as row_count
FROM users
UNION ALL
SELECT 'User Profiles', COUNT(*)
FROM user_profiles
UNION ALL
SELECT 'Categories', COUNT(*)
FROM categories
UNION ALL
SELECT 'Products', COUNT(*)
FROM products
UNION ALL
SELECT 'Orders', COUNT(*)
FROM orders
UNION ALL
SELECT 'Order Items', COUNT(*) FROM order_items;

select * from users;

select * from orders;

/*
Returns all rows from the left table and the matching rows from the right table. If there is no match in the right table, NULL values are returned for the right table's columns.

here
users table will be considered as Left TABLE
orders table will be considered as Right TABLE
*/
SELECT
    u.id as user_id,
    u.email as user_email,
    u.name as user_name,
    o.id as order_id,
    o.order_number,
    o.total_amount,
    o.status,
    o.order_date
FROM users as u
    LEFT JOIN orders as o ON u.id = o.user_id

/*
Returns all rows from the right table and the matching rows from the left table. If there is no match in the left table, NULL values are returned for the left table's columns.

here
users table will be considered as Left TABLE
orders table will be considered as Right TABLE
*/

SELECT
    u.id as user_id,
    u.email as user_email,
    u.name as user_name,
    o.id as order_id,
    o.order_number,
    o.total_amount,
    o.status,
    o.order_date
FROM users as u
    RIGHT JOIN orders as o ON u.id = o.user_id

/


*

FullJoin ior Full Outer Join
- Returns all rows from both tables, matching rows from both tables, and NULL values for non-matching rows.
Returns all rows when there is a match in either the left or the right table. If there is no match, NULL values are returned for the columns of the table that does not have a match.

here * /

SELECT
    u.id as user_id,
    u.email as user_email,
    u.name as user_name,
    o.id as order_id,
    o.order_number,
    o.total_amount,
    o.status,
    o.order_date
FROM users as u FULL OUTER
    JOIN orders as o ON u.id = o.user_id;

/*
Cross Join - Returns the Cartesian product of the two tables, which means it returns all possible combinations of rows from both tables.
-typically used when there is no common column or specific relationship between the tables.
if users table has 15 rows and orders table has 12 rows then cross join will return 15*12=180 rows
*/
SELECT
    u.id as user_id,
    u.email as user_email,
    u.name as user_name,
    o.id as order_id,
    o.order_number,
    o.total_amount,
    o.status,
    o.order_date
FROM users as u
    CROSS JOIN orders as o;

select * from users;

ALTER TABLE users ADD COLUMN referred_by INT REFERENCES users (id);
/*
Self Join - A self join is a join operation where a table is joined with itself. It is typically used when the table has a self-referential relationship, such as a hierarchical structure or a tree-like structure.

Example: If we had a referral structure in our users table where one user can refer another,
we could use a self join to find all users who were referred by David Brown:
*/
SELECT
    u1.id,
    u1.name,
    u1.email,
    u1.status,
    u2.name AS referred_by,
    u2.id AS referred_by_id
FROM users u1
    JOIN users u2 ON u1.referred_by = u2.id
WHERE
    u2.name = 'David Brown';

--select all orders and their items
SELECT
    o.id as order_id,
    o.order_number,
    o.total_amount,
    o.status,
    o.order_date,
    oi.id as order_item_id,
    oi.product_id,
    oi.quantity,
    oi.unit_price,
    oi.total_price
FROM orders o
    LEFT JOIN order_items oi ON o.id = oi.order_id;
