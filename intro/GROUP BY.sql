-- Active: 1712767786781@@127.0.0.1@5433@practice_db
CREATE TABLE sales (
    region VARCHAR(15), product_id INTEGER, revenue INTEGER
);

INSERT INTO
    sales (region, product_id, revenue)
VALUES ('East', 1, 100),
    ('East', 2, 150),
    ('West', 1, 200),
    ('West', 3, 120),
    ('East', 2, 180),
	 ('south', 3, 4000);

-- Query 1:Total Revenue per Region
select region, sum(revenue) from sales GROUP BY region;

-- Query 2:Average Revenue per Product
select product_id,avg(revenue) as avg_revenue from sales 
GROUP BY product_id
HAVING AVG(revenue)>100
ORDER BY product_id desc
LIMIT 10;
