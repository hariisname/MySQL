use walmart;

-- 1Q) give me all the information/ details present in sales table
select * from sales;

-- 2Q) give me description or information  of the table
describe sales;
--         OR
-- 2Q) Using SHOW COLUMNS FROM
SHOW COLUMNS FROM sales;

-- 3Q) get me the count of total records/ entries present in a table
select count(*) from sales;

-- 4Q) find the count of unique records  
SELECT count(distinct concat(invoice_id, branch, city, customer_type, gender, product_line, unit_price, quantity, vat, total, date, time, payment_method, cogs, gross_margin_pct, gross_income, rating))
from sales;

-- 5Q) finding the null values in gross_margin_percentage and rating, because apart from this 2 columns all columns are not null constraint is mentioned
select * from sales where rating is null or gross_margin_pct is null;

-- 6Q) get the duplicate records present in table
select sales.*,count(*)
from sales
group by invoice_id, branch, city, customer_type, gender, product_line, unit_price, quantity, vat, total, date, time, payment_method, cogs, gross_margin_pct, gross_income, rating
having count(*) >1;

-- 7Q) How many records are there in the sales data?
select count(*) from sales;

-- 8Q) What are the unique branches in the dataset?
select distinct branch from sales; 

-- 9Q) How many unique cities are covered in the sales data?
select count(distinct city) from sales;
select distinct city from sales;

-- 10Q) What are the different customer types in the dataset?
select distinct customer_type from sales;

-- 11Q) What is the total quantity sold across all records?
select sum(quantity) from sales;

-- 11Q) What is the average unit price of products sold?
select avg(unit_price) as "Average Unit Price" from sales;

-- 12Q) How many different product lines are available in the sales data?
select count(distinct product_line) from sales;

-- 13Q) What is the total VAT (Value Added Tax) collected?
select sum(vat) "Total VAT" from sales;

-- 14Q) What is the overall total sales amount?
select * from sales;
select sum(total) from sales;

-- 15Q) What is the earliest date in the dataset?
select min(date) from sales;

-- 16Q) What is the latest date in the dataset?
select max(date) from sales;

-- 17Q) How many records have a specific payment method (e.g., credit card)?

select payment_method,count(*) "count of records"
from sales
group by payment_method;

-- 18Q) What is the total cost of goods sold (COGS) across all records?
select sum(cogs) from sales;

-- 19Q) What is the average gross margin percentage?
select avg(gross_margin_pct) from sales;

-- 20Q) What is the total gross income across all records?
select sum(gross_income) from sales; 

-- 21Q) How many records have a rating above a certain threshold (e.g., 4.5)
select count(*) from sales where rating > 4.5;

-- 22Q) What is the total sales for a specific branch?
select sum(total), branch from sales group by branch;

-- 23Q) Which product line has the highest average unit price?
select  avg(unit_price),product_line
from sales
group by product_line
order by avg(unit_price) desc
limit 1;

-- 24Q) What is the total quantity sold for each product line?
select sum(quantity),product_line
from sales
group by product_line;

-- 25Q) Which branch has the highest total sales?
select sum(total) "Highest total sales",branch from sales group by branch order by sum(total) desc limit 1;

-- 26Q) What is the distribution of customer types in each branch?
select branch,customer_type, count(*)
from sales
group by branch, customer_type
order by count(*) ;

-- 27Q) Which date had the highest total sales?
select  date, sum(total) "highest Sales"
from sales
group by date 
order by date desc
limit 1;

-- 28Q) What is the average quantity sold per transaction?
select payment_method,avg(quantity) 
from  sales
group by payment_method
order by avg(quantity);
-- OR
select avg(quantity) from sales;

-- 29Q) What is the total VAT collected for each product line?  
use walmart;

select sum(vat),product_line
from sales
group by product_line;

-- 30Q) How many records have missing values in the "gender" column?
select count(*) from sales where gender is null;

-- 31Q) Which payment method is most commonly used?
select count(*),payment_method
from sales
group by payment_method
order by count(*) desc 
limit 1;

-- 32Q) What is the average rating for each product line?
select product_line,avg(rating) Average_Rating from sales group by product_line order by Average_Rating ; 

-- 33Q) What is the total quantity sold for each customer type?
select sum(quantity) Total_Quantity ,customer_type
from sales
group by customer_type;

-- 34Q) How many records have a total sales amount greater than a certain threshold?
select count(*) from sales where total>1000 ;

-- 35Q) What is the average unit price for male and female customers separately?
select avg(unit_price) "Average Unit",gender from sales group by gender;

-- 36Q) Which products have the highest total sales ('total')?
select product_line,sum(total) "Highest Total Sales" from sales group by product_line order by sum(total) desc;
select product_line,sum(total) "Highest Total Sales" from sales group by product_line order by sum(total) desc limit 1; #Correct Answer for given Question

-- 37Q)  How are total sales distributed among different branches?
select sum(total) "Total Sales",branch
from sales
group by branch;

-- 38Q) Which product lines are the most popular in terms of quantity sold?
select product_line, sum(quantity) from sales group by product_line order by sum(quantity) desc;

-- 39Q) What is the daily sales trend over a specific period?
SELECT date(date), SUM(total) as daily_total_sales
FROM sales
WHERE date >= '2019-01-01' AND date <= '2019-03-30' -- Replace with your specific date range
GROUP BY date
ORDER BY date asc;

-- 40Q) During which times of the day do most transactions occur?
select time,date(date), sum(quantity) from sales group by time,date order by sum(quantity) desc;

-- 41Q) How does customer rating correlate with gross income ('gross_income')?
select rating,gross_income from sales order by rating asc , gross_income desc;

-- 42Q) Is there a correlation between the quantity sold and unit price?
select quantity, unit_price
from sales
order by quantity asc, unit_price asc;

-- 43Q) How much VAT is collected in total, and what is the average VAT per transaction?
select sum(vat),avg(vat) from sales;

-- 44Q) Which branches contribute the most to the total revenue?
select city "Branch Location",sum(total) "Total Revenue" from sales group by city order by sum(total) desc; 
select city "Branch Location",sum(total) "Total Revenue" from sales group by city order by sum(total) desc limit 1;
 