--Name: Ryan Manchanthasouk
--File: Ch04-lab.sql
--Date: February 3 2020

use TSQLV4;

--1 
--what is our highest priced product?
--Report the product id, product name, and unit price.
--Use a self-contained, scalar valued subquery.
select productid, productname, unitprice
	FROM production.Products
	WHERE unitprice =
		(select max(unitprice) from Production.Products);

go
--2 
--What is our most popular product in terms of quantity sold?
--Report the product name and productid.
--Use a self-contained, scalar valued subquery.
select productid, productname
	FROM production.products
	WHERE productid = (
	select TOP (1) productid
		FROM sales.orderdetails
		group by productid
		order by sum(qty) desc);

go
--3
--Who is our top salesperson overall?
--Include the employee id, title, first name, and last name.
--Use a self-contained, scalar valued subquery.
select empid, firstname, lastname, title
	from hr.employees
	where empid = (
		select TOP (1) empid
			FROM sales.Orders
			GROUP BY empid
			ORDER BY count(orderid) desc);

go
--4
--I want to examine the individual orders. Specifically, I want to look at each order and compare the
--total of each order line with the average total of all order lines in the order. 
--Report the order id, the total of each order line, and the average of all order lines for each order. 
--Use a correlated, scalar valued subquery.
select od.orderid, (od.unitprice * od.qty) as line_total, (
	select avg(ood.unitprice * ood.qty)
	from sales.OrderDetails ood
	where ood.orderid = od.orderid
) as order_avg
	from sales.orderdetails od;
go

--5 
--What is the largest quantity ordered by a customer for every order? 
--Report the order id, the productid, and the quantity ordered. 
--Use a correlated subquery in the WHERE clause.
select od.orderid, od.productid, qty
	from sales.orderdetails od
		where qty = (
			select max(ood.qty)
	from sales.OrderDetails ood
		where ood.orderid = od.orderid)
	order by od.orderid;