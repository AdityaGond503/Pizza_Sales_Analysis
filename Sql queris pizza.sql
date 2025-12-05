SELECT * FROM pizza_sales.pizza_sales;

select sum(total_price) as total_revenue  from pizza_sales.pizza_sales;

select sum(total_price)/ count(distinct order_id) as avg_order_value from pizza_sales.pizza_sales;

select sum(quantity) as Total_pizza_sold from pizza_sales.pizza_sales;

select count(distinct order_id) as Total_orders from pizza_sales.pizza_sales;

select Cast(sum(quantity)/ count(distinct order_id) as decimal (10,2)) as avg_pizza_perorder from pizza_sales.pizza_sales;

DESCRIBE pizza_sales.pizza_sales;
-- Daily trend
SELECT order_day, total_orders
FROM (
    SELECT 
        DAYNAME(STR_TO_DATE(order_date, '%d-%m-%Y')) AS order_day,
        COUNT(DISTINCT order_id) AS total_orders
    FROM pizza_sales.pizza_sales
    GROUP BY DAYNAME(STR_TO_DATE(order_date, '%d-%m-%Y'))
) AS t
ORDER BY FIELD(order_day,
    'Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday');
    
-- Hourly trend
-- SELECT 
--     HOUR(order_time) AS order_hour,
--     COUNT(DISTINCT order_id) AS total_orders
-- FROM pizza_sales.pizza_sales
-- GROUP BY HOUR(order_time)
-- ORDER BY HOUR(order_time);

-- Select pizza_category, sum(total_price) as Total_Sales, sum(total_price) * 100/
-- (select sum(total_price)from pizza_sales.pizza_sales ) as PCT
-- from pizza_sales.pizza_sales
-- group by pizza_category

-- Select pizza_size, sum(total_price) as Total_Sales,cast(sum(total_price) * 100/
-- (select sum(total_price)from pizza_sales.pizza_sales )as decimal (10,2)) as PCT
-- from pizza_sales.pizza_sales
-- group by pizza_size
-- order by PCT desc

-- select pizza_category,sum(quantity) as Total_pizzas_sold
-- from pizza_sales.pizza_sales
-- group by pizza_category

select pizza_name, sum(quantity) as Total_pizza_sold
from pizza_sales.pizza_sales
group by pizza_name
order by Total_pizza_sold limit 5

 











