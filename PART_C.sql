CREATE TABLE sales_data_store (
 OrderNo INT,
 ProductNo INT, 
 Price DECIMAL(10,2),
 Quantity INT,
 Sales DECIMAL(10,2),
 QtrId INT,
 MonthId INT,
 YearId INT
);

INSERT INTO sales_data_store (OrderNo, ProductNo, Price, Quantity, Sales, QtrId, MonthId, YearId)
VALUES
(10107, 2, 85.7, 30, 2587, 1, 2, 2003);

INSERT INTO sales_data_store (OrderNo, ProductNo, Price, Quantity, Sales, QtrId, MonthId, YearId)
VALUES
(10107, 5, 95.8, 39, 3879.49, 1, 2, 2003);

INSERT INTO sales_data_store (OrderNo, ProductNo, Price, Quantity, Sales, QtrId, MonthId, YearId)
VALUES
(10121, 5, 71.5, 34, 2700, 1, 2, 2003);

INSERT INTO sales_data_store (OrderNo, ProductNo, Price, Quantity, Sales, QtrId, MonthId, YearId)
VALUES
(10134, 2, 94.74, 41, 3884.34, 3, 7, 2004);

INSERT INTO sales_data_store (OrderNo, ProductNo, Price, Quantity, Sales, QtrId, MonthId, YearId)
VALUES
(10134, 5, 100, 27, 3307.77, 3, 7, 2004);

INSERT INTO sales_data_store (OrderNo, ProductNo, Price, Quantity, Sales, QtrId, MonthId, YearId)
VALUES
(10159, 14, 100, 49, 5205.27, 4, 10, 2005);

INSERT INTO sales_data_store (OrderNo, ProductNo, Price, Quantity, Sales, QtrId, MonthId, YearId)
VALUES
(10168, 1, 96.96, 36, 3479.66, 4, 10, 2006);

INSERT INTO sales_data_store (OrderNo, ProductNo, Price, Quantity, Sales, QtrId, MonthId, YearId)
VALUES
(10180, 12, 100, 42, 4695.6, 4, 11, 2006);

SELECT * FROM sales_data_store;

SELECT ProductNo, YearId, MonthId, SUM(Quantity) AS TotalQuantity
FROM sales_data_store
GROUP BY ProductNo, YearId, MonthId
