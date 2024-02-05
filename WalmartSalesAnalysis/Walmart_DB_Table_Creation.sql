drop database if exists walmart;
create database if not exists Walmart;
use Walmart;
# --------------------------------------------Database Created -----------------------------------------------------
create table if not exists sales(
	invoice_id varchar(30) not null primary key,
    branch varchar(5) not null,
    city varchar(30) not null,
    customer_type varchar(30) not null,
    gender varchar(10) not null,
    product_line varchar(100) not null,
    unit_price decimal(10,2) not null,    # unit_price decimal(precision, scale) ex:- vat(345.00)
    quantity int not null,
    vat float(6,4) not null, # value added tax  # vat float(precision, scale) ex:- vat(0.3456)
    total decimal(12,4) not null,
    date datetime not null,
    time time not null,
    payment_method varchar(15) not null,
    cogs  decimal(10,2) not null,   # cost of goods sold
    gross_margin_pct float(11,9),
    gross_income decimal(12, 4) not null,
    rating float(2,1)    # ex:- 4.5 or 6.9, ect...
);
/*
 import the data by right click the table and selecting  Table data import Wizard
*/

-- ------------------------------------Table Created ----------------------------------------------
select * from sales;
-- Add the time_of_day column
ALTER TABLE sales ADD COLUMN time_of_day VARCHAR(20);

-- For this to work turn off safe mode for update
-- Edit > Preferences > SQL Edito > scroll down and toggle safe mode
-- Reconnect to MySQL: Query > Reconnect to server
UPDATE sales
SET time_of_day = (
	CASE
		WHEN `time` BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
        WHEN `time` BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
        ELSE "Evening"
    END
);
select * from sales;
--      OR      ----------
/*
SELECT
	time,
	(CASE
		WHEN `time` BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
        WHEN `time` BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
        ELSE "Evening"
    END) AS time_of_day
FROM sales;
*/
-- Add day_name column
# SELECT date, DAYNAME(date) FROM sales;

ALTER TABLE sales ADD COLUMN day_name VARCHAR(10);
UPDATE sales SET day_name = DAYNAME(date);
select * from sales;
-- Add month_name column
# SELECT date, MONTHNAME(date) FROM sales;

ALTER TABLE sales ADD COLUMN month_name VARCHAR(10);

UPDATE sales SET month_name = MONTHNAME(date);

select * from sales;