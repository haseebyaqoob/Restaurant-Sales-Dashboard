USE pizza_sales_analysis;

SELECT * FROM pizza_sales;

-- Requirement 1: Total Revenue
-- Sum of total price of all pizza orders 

SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales;

-- Requirement 2: Average Order values
-- Avg spent amount per order (total revenue / total no of orders)

SELECT SUM(total_price) / COUNT(DISTINCT order_id) 
AS Average_order_value FROM pizza_sales;

-- Requirement 3: Total Pizzas Sold
-- Sum of quantities of pizzas sold

SELECT * FROM pizza_sales;
SELECT SUM(quantity) FROM pizza_sales as total_pizzas_sold;

-- Requirement 4: Total Orders placed
SELECT Count(Distinct(order_id))as total_orders_placed FROM pizza_sales;

-- Requirement 5: Average Pizzas per order
-- Calculated by diving total number of pizzas sold by total number of orders

SELECT SUM(quantity)/ Count(Distinct(order_id)) as avg_pizzas_per_order FROM pizza_sales;



-- Working on data for charts
-- Requirement 1: Daily Trend Orders

SELECT * FROM pizza_sales;
-- We convert order_date to weekday/weekend format for daily trend

SELECT 
    DAYNAME(STR_TO_DATE(order_date, '%m/%d/%Y')) AS order_day, 
    COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY DAYNAME(STR_TO_DATE(order_date, '%m/%d/%Y'));


-- Requirement 2 : Hourly Trend
SELECT 
    HOUR(order_time) AS order_hour,
    COUNT(*) AS Total_orders
FROM pizza_sales
GROUP BY HOUR(order_time)
ORDER BY order_hour;


-- Requirement 3: Percentage of Sales by Pizza Category

SELECT 
    pizza_category, SUM(total_price) * 100 AS Total_Sales , 
    SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) AS percentage
FROM pizza_sales
GROUP BY pizza_category;


