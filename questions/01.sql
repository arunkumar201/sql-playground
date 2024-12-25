CREATE TABLE Products (Order_date date, Sales int);

INSERT INTO
    Products (Order_date, Sales)
VALUES ('2021-01-01', 20),
    ('2021-01-02', 32),
    ('2021-02-08', 45),
    ('2021-02-04', 31),
    ('2021-03-21', 33),
    ('2021-03-06', 19),
    ('2021-04-07', 21),
    ('2021-04-22', 10)

select *
from Products;
    -- Find monthly sales and sort it by desc order
SELECT extract(
        year
        from Order_date
    ) as years, to_char(Order_date, 'Mon') as months, sum(Sales) as TotalSales
FROM Products
GROUP BY
    1,
    2
ORDER BY TotalSales DESC

