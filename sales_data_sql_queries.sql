CREATE DATABASE Sales;
USE Sales;

-- 1 order id all parameter checking
-- Check missing order_id
SELECT 
    COUNT(*) AS order_id_count
FROM
    sales_dataset
WHERE
    order_id IS NULL;

-- Check duplicates
SELECT 
    order_id, COUNT(*)
FROM
    sales_dataset
GROUP BY order_id
HAVING COUNT(*) >= 1; 

-- Delete Null values from Order_id
DELETE FROM sales_dataset 
WHERE
    order_id IS NULL;

-- 2 Customer_name all parameter checking 
-- Customer null value count
SELECT 
    COUNT(*) AS null_name
FROM
    sales_dataset
WHERE
    Customer_name = '';

-- customer null values delete from table
DELETE FROM sales_dataset 
WHERE
    customer_name = '';

-- How many orders each customer has placed
SELECT 
    customer_name, COUNT(*) AS total_orders
FROM
    sales_dataset
GROUP BY customer_name
ORDER BY total_orders DESC;

-- CALCULATE SUM OF COUNTS
SELECT 
    SUM(total_orders) AS OVERALL_COUNT_SUM
FROM
    (SELECT 
        customer_name, COUNT(*) AS total_orders
    FROM
        sales_dataset
    GROUP BY customer_name) AS Customers_count;
    
    -- Total unique customers kitne hain?
    SELECT 
    COUNT(DISTINCT customer_name)
FROM
    sales_dataset;
    
    -- Customers repeat buyers
    SELECT Customer_name, COUNT(*) as repeat_orders
    FROM sales_dataset
    GROUP BY customer_name
    HAVING COUNT(*)>1;
    
    -- total quantity orderd by customer
    SELECT customer_name, SUM(quantity) AS quantity_ordered
    FROM sales_dataset
	GROUP BY customer_name
    ORDER BY quantity_ordered DESC;
    
    -- 3 city and all related query 
-- Customer null value count
SELECT 
    COUNT(*) AS null_name
FROM
    sales_dataset
WHERE
    city = '';

-- customer null values delete from table
DELETE FROM sales_dataset 
WHERE
    city = '';
    
-- calulate sum of cout of city 
SELECT 
    SUM(null_name) AS overall_sum
FROM
    (SELECT 
        COUNT(*) AS null_name
    FROM
        sales_dataset
    GROUP BY city) AS total_sum;
    
-- orders from upi
SELECT *
FROM sales_dataset
WHERE payment_mode = 'UPI';

-- delete all ull values from product price 
DELETE FROM sales_dataset
WHERE product_price = "";

-- total sum of count from product_price wich is present 
SELECT 
    SUM(null_name) AS overall_sum
FROM
    (SELECT 
        COUNT(*) AS null_name
    FROM
        sales_dataset
    GROUP BY product_price) AS total_sum;

--  total entries present now 
SELECT 
    COUNT(*)
FROM
    sales.sales_dataset;

-- Revenue Analysis
SELECT 
    SUM(product_price * quantity) AS total_revenue
FROM
    sales_dataset;

-- City wise revenue
SELECT 
    city, SUM(product_price * quantity) AS city_wise_revenue
FROM
    sales_dataset
GROUP BY city
ORDER BY city_wise_revenue DESC;

-- Category wise revenue
SELECT 
    category,
    SUM(product_price * quantity) AS Category_wise_revenue
FROM
    sales_dataset
GROUP BY category
ORDER BY Category_wise_revenue DESC;

-- Datewise wise revenue
SELECT 
    order_date,
    SUM(product_price * quantity) AS Date_wise_revenue
FROM
    sales_dataset
GROUP BY order_date
ORDER BY Date_wise_revenue DESC;

-- Top 5 customers by spending 
SELECT 
    customer_name, SUM(product_price * quantity) AS total_spent
FROM
    sales_dataset
GROUP BY customer_name
ORDER BY total_spent DESC LIMIT 5;

-- Highest single order
SELECT 
    *
FROM
    sales_dataset
ORDER BY (product_price * quantity) DESC
LIMIT 1;

-- Month wise orders
SELECT 
    MONTH(order_date) AS month,COUNT(*)
FROM
    sales_dataset
GROUP BY month
ORDER BY MONTH;

-- Repeat customers
SELECT 
    customer_name, COUNT(*) AS repeat_orders
FROM
    sales_dataset
GROUP BY customer_name
HAVING COUNT(*) > 1;

-- City + category analysis
SELECT 
    city, category, COUNT(*) AS orders
FROM
    sales_dataset
GROUP BY city , category
ORDER BY orders DESC;

-- Customer segmentation
SELECT 
    customer_name,
    CASE
        WHEN SUM(product_price * quantity) > 2000 THEN 'VIP'
        WHEN SUM(product_price * quantity) BETWEEN 1000 AND 2000 THEN 'REGULAR'
        ELSE 'LOW'
    END AS segment
FROM
    sales_dataset
GROUP BY customer_name;

-- most used payment_method
SELECT 
    payment_mode, COUNT(*) AS usage_count
FROM
    sales_dataset
GROUP BY payment_mode
ORDER BY usage_count DESC;

-- UPDATE NAME IN PAYMENT METHOD
UPDATE sales_dataset 
SET 
    payment_mode = 'NULL'
WHERE
    payment_mode = '';

-- UPDATE VALUE IN QUANTITY
UPDATE sales_dataset 
SET 
    quantity = '0'
WHERE
    quantity = '';
    
-- UPDATE VALUE IN DISCOUNT_PERCENT
UPDATE sales_dataset 
SET 
    discount_percent = '0'
WHERE
    discount_percent = '';

SELECT * FROM sales.sales_dataset;






    

    












