SELECT * FROM pizza_sales
-- Total Revenue:
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales;

-- Average Order Value
SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value FROM pizza_sales

-- Total Pizzas Sold
SELECT SUM(quantity) AS Total_pizza_sold FROM pizza_sales

-- Total Orders
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales

-- Average Pizzas Per Order
SELECT SUM(quantity) / COUNT(DISTINCT order_id) AS Avg_Pizzas_per_order FROM pizza_sales;

-- Daily Trend for Total Orders
SELECT 
    DAYNAME(order_date) AS order_day,
    COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY DAYNAME(order_date), order_date
ORDER BY order_date;

-- Hourly Trend for Orders
SELECT 
    HOUR(order_time) AS Order_Hour,
    COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY HOUR(order_time)
ORDER BY Order_Hour;

-- % of Sales by Pizza Category
SELECT 
    pizza_category,
    SUM(total_price) AS Category_Revenue,
    ROUND(SUM(total_price) * 100.0 / (SELECT SUM(total_price) FROM pizza_sales)) AS Pct_of_Total_Sales
FROM pizza_sales
GROUP BY pizza_category
ORDER BY Category_Revenue DESC;

-- % of Sales by Pizza Size
SELECT pizza_size, SUM(total_price) AS Size_Revenue,
ROUND(SUM(total_price) * 100.0 / (SELECT SUM(total_price) FROM pizza_sales), 2) AS Pct_of_Total_Sales
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size

-- Total Pizzas Sold by Pizza Category
SELECT pizza_category, SUM(quantity) AS Total_Pizzas_Sold
FROM pizza_sales
GROUP BY pizza_category
ORDER BY Total_Pizzas_Sold DESC;

-- Top 5 Best Sellers by Total Pizzas Sold
SELECT pizza_name, SUM(quantity) AS Total_Pizzas_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizzas_Sold DESC
LIMIT 5;

-- Bottom 5 Worst Sellers
SELECT pizza_name, SUM(quantity) AS Total_Pizzas_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizzas_Sold ASC
LIMIT 5;
