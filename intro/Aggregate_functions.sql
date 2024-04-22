-- Active: 1712767786781@@127.0.0.1@5433@practice_db
SELECT * from movies;

-- Count aggregate fun is used to calculate the num of rows
select COUNT(*) as total_movies from movies;

-- sum() is used to calculate the sum of the rows values

select sum(rating) as sum_of_rating from movies ;



CREATE TABLE sales (
    product_id INT, revenue DECIMAL(10, 2) 
);


INSERT INTO
    sales (product_id, revenue)
VALUES (1, 100),
    (2, 150),
    (1, 200),
    (3, 120),
	(2, 110),
	(1, 190),
	(3, 170),
	(2, 160),
    (2, 180);


select * from sales;

-- query counts the total number of rows in the sales table. 

select COUNT(*) as total_sales from sales;

-- query calculates the total revenue from all sales
select sum(revenue) as sales_revenue from sales;

-- query calculates the average revenue per sale
select avg(revenue) as avg_revenue from sales;

-- queries find the minimum and maximum revenue values in the sales table.

select min(revenue) as min_revenue, max(revenue) as max_revenue from sales;

SELECT round(revenue,2) from sales;
