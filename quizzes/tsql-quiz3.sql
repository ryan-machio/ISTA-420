-- Name: Ryan Manchanthasouk
-- File: tsql-quiz3.sql
-- January 4th, 2020

use Northwind;
-- 1
-- Write a report giving the employee id, rst name, last name, 
-- and the average amount of all orders by
that employee.
select e.employeeid, e.firstname, e.lastname, avg(od.UnitPrice * od.quantity) avg_sale
	from employees e
	join orders o
	on e.employeeid = o.EmployeeID
	join [order details] od
	on o.OrderID = od.orderid
	group by e.EmployeeID, e.firstname, e.lastname
	order by avg_sale desc;
go

-- 2
-- Write a report that lists our product categories and the average price of
-- all products of that category.
-- Include the category id, the category name, and the average price.
select c.categoryid, c.categoryname, avg(p.UnitPrice) as avg_sales
	from categories c
	join products p
	on c.CategoryID = p.CategoryID
	group by c.CategoryID, c.Categoryname
	order by categoryid;

-- 3
-- In some cities, we have customers, suppliers, and employees. 
-- Write a report that lists the customer's contact name, the supplier's 
-- contact name, the employee's name, and the city in 
-- which all three are located. Here is my output:

select c.contactname as customername, 
	s.contactname as suppliername, 
	e.firstname as employee_firstname, 
	e.lastname as employee_lastname, 
	e.city
	from customers c
		inner join orders o
	on c.customerid = o.CustomerID
		inner join employees e
	on o.EmployeeID = e.EmployeeID
		inner join [order details] od
	on o.OrderID = od.OrderID
		inner join products p
	on od.ProductID = p.ProductID
		inner join suppliers s
	on p.SupplierID = s.SupplierID
	where e.city like 'london'
	order by c.ContactName;
go