-- Name: Ryan Manchanthasouk
-- File: tsql-lab05.sql
-- January 4th, 2020

-- 1 
-- Write a report returning the order id, the shipper name, the 
-- order date and the city shipped to using a derived table.
 select so.orderid, so.shippername, so.orderdate, so.shipcity
  from (
  select s.companyname as shippername, s.shipperid, o.orderid, o.orderdate, o.shipcity
    from sales.orders o join sales.shippers s on o.shipperid = s.shipperid
	) so;
go
-- 2.I need a report showing how many orders each customer made during each year. 
-- Return the customerid, the year, and the number of orders the customer placed during that year. 
-- Use a derived table.
select ria.custid, ria.custyear, ria.totalorders
	from (
		select o.custid, year(o.orderdate) as custyear, count(o.orderid) as totalorders
	from sales.orders o
	group by o.custid, year(o.orderdate) 
	) ria
order by ria.custid, custyear;
go
-- 3 What is the growth or decline in the number of orders taken year by year? 
-- Your report should contain the year, this years order's, last year's orders, 
-- and the difference between the two. Join two derived tables.
select this_year, cur_orders, prev_orders, (cur_orders - prev_orders) as difference
	from (
	(select year(orderdate) as this_year, count(orderid) as cur_orders from sales.orders
	group by year(orderdate)) cy
	left join
	(select year(orderdate) as last_year, count(orderid) as prev_orders from sales.orders
	group by year(orderdate)) py
	on cy.this_year = py.last_year + 1);
go

-- 6
-- Create a view that aggregates the number of orders per customer per year. 
-- Then run a query against the view sorting the customers by customer id. 
-- Don't forget to drop the view if one exists before you create it. Use the DBO schema.
DROP VIEW IF EXISTS dbo.bob;
GO
CREATE VIEW dbo.bob
AS
SELECT
	custid, year(orderdate) as custyear, count(orderid) as order_count
	from sales.orders
	GROUP BY custid, year(orderdate)
	-- ORDER BY custid, custyear;
GO
select custid, custyear, order_count from dbo.bob
	order by custid, custyear;

-- 7
-- Create a view similar to the Production.Products table, 
-- but include the category name as a column.
-- Use the DBO schema. 
-- This is an example of denormalizing a database table. 
-- After going to all the trouble of normalizing a database, 
-- can you think of a good reason to denormalize it?
drop view if exists dbo.prodcat;
go
create view dbo.prodcat
as
select p.productid, p.productname, p.unitprice, c.categoryname
  from production.products p
  join production.Categories c
    on p.categoryid = c.categoryid;
go
select * from dbo.prodcat;