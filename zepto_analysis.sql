drop table if exists zepto;
create table zepto(
sku_id SERIAL PRIMARY KEY,
category VARCHAR(120),
name VARCHAR(150) NOT null,
mrp NUMERIC(8,2),
discountPercent numeric(5,2),
availableQuantity INTEGER,
disocuntedSellingPrice NUMERIC(8,2),
weightInGms INTEGER,
outOfStock BOOLEAN,
quantity INTEGER
);
--data exploration
--count of rows
SELECT COUNT(*) FROM zepto;
-- sample data
SELECT * FROM zepto limit 10;
SELECT * FROM zepto
where name is NULL 
OR
 category is NULL 
or
 mrp is null 
or
 discountPercent is null 
or
 discountedSellingPrice is null 
or
 availableQuantity is null 
or
 outOfStock is null 
or
 quantity is null 
or
 weightInGms is null ;

--different product categories
select distinct category
from zepto
order by category;

--products in stock vs out of stock
select outOfStock, count(sku_id)
from zepto
group by outOfStock;

--product name present multiple times
select name, count(sku_id) as "Number of SKUs"
from zepto
group by name
having count(sku_id)>1
order by count(sku_id) desc;

--data cleaning
--products having mrp=0
select * from zepto
where mrp=0 or disocuntedSellingPrice=0;

delete from zepto 
where mrp=0;

--convert paise to rupees
UPDATE zepto 
set mrp=mrp/100.0,
disocuntedSellingPrice=disocuntedSellingPrice/100.0;
select mrp, disocuntedSellingPrice from zepto;


--find the top 10 best-value products based on the discount percentage
select distinct name,mrp,discountPercent
from zepto
order by discountPercent desc
limit 10;

--what are the products with high mrp but out of stock
select distinct name,mrp,outOfStock
from zepto
where outOfStock='Yes' and mrp>300
order by mrp desc;


--calculate estimated revenue from each category
select category,SUM(disocuntedSellingPrice) as total_revenue
from zepto
group by category
order by total_revenue DESC;

--find all products where mrp is greater than 500 and discount is less than 10%
select name,mrp,discountPercent
from zepto
where mrp>500 and discountPercent<10;

--identify the top 5 categories offering the highest average discount percentage
select distinct category ,round( Avg(discountPercent) ,2)as Average_discount_percent
from zepto
group by category
order by Average_discount_percent desc
limit 5;

--find the price per gram for products above 100g and sort by best value
select distinct name,
weightInGms,
round(weightInGms/disocuntedSellingPrice,2) as price_per_gram
from zepto
where weightInGms>=100
order by price_per_gram ;

--group the products into categories like low, medium, bulk
select distinct name , weightInGms,
Case when weightInGms<1000 then 'Low'
when weightInGms<5000 then 'Medium'
else 'Bulk'
end as weight_category
from zepto;

--what is the total inventory weight per category
select category,sum(weightInGms*availableQuantity) as total_weight
from zepto
group by category
order by total_weight;