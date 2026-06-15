CREATE DATABASE amazon_sales_db;
USE amazon_sales_db;
create table amazon_sales(order_id int,order_date date,product_id int,product_category varchar(50),price decimal(10,2),discount_percent int,quantity_sold int,customer_region varchar(50),payment_region varchar(50),payment_method varchar(50),rating decimal(3,1),review_count int,discounted_price decimal(10,2),total_revenue decimal(10,2));
desc amazon_sales;
alter table amazon_sales drop column payment_region;
desc amazon_sales;
USE amazon_sales_db;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/amazon_sales_dataset.csv'
INTO TABLE amazon_sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
select * from amazon_sales limit 10;
select * from amazon_sales;
select sum(total_revenue) as Total_revenue from amazon_sales;
select product_id,product_category,sum(total_revenue) as Total_Revenue from amazon_sales group by product_id,product_category order by total_revenue desc limit 10;
select product_category,sum(total_revenue) as Total_revenue from amazon_sales group by product_category order by total_revenue desc limit 10
select year(order_date) as Year,month(order_date) as Month,sum(total_revenue) as Total_revenue from amazon_sales group by Year,Month order by Year,Month;
select customer_region as Cust_Region,sum(total_revenue) as Total_revenue  from amazon_sales group by customer_region order by Total_revenue desc;
select avg(total_revenue) as Avg_Total_Revenue from amazon_sales;
select product_category,sum(total_revenue) as Total_revenue from amazon_sales group by product_category having total_revenue > 10900000;
select product_category, avg(rating) as Average_Rating from amazon_sales group by product_category order by Average_Rating desc;
select payment_method,sum(order_id) as order_id from amazon_sales group by payment_method order by order_id desc;
select month(order_date) as Month,sum(total_revenue) as Total_revenue from amazon_sales group by Month order by total_revenue desc limit 1;
select discount_percent,count(order_id) as Order_id,avg(total_revenue) as Total_revenue from amazon_sales group by discount_percent order by discount_percent asc;
select customer_region,product_category,sum(total_revenue) as Total_revenue from amazon_sales group by customer_region,product_category order by total_revenue desc;