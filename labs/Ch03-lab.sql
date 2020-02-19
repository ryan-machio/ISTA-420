use Northwind;
-- 1.
select * from orders;
select * from employees;

select OrderID, OrderDate, FirstName, LastName
	from Orders as O
	inner join employees as e
	on o.employeeid = e.employeeid;

-- 2.
select *
	from territories as t
	inner join region as r
	on t.regionid = r.regionid
	order by r.regionid;

-- 3. What is the supplier name for each product alphabetically by supplier?
select companyname, productname
	from products as P
	inner join Suppliers as S
	on P.supplierid = s.supplierid
	order by companyname asc;

-- 4. For every order on May 5, 1998, how many of each item was ordered, and what was the price of the item?
select sum(quantity) as Quantity, UnitPrice, OrderDate, ProductID
	from [order details] as OD
	inner join Orders as O
	on OD.OrderID = O.OrderID
	where OrderDate = ('1998-05-05')
	group by ProductID, UnitPrice, OrderDate
	order by ProductID;

-- 5. For every order on May 5, 1998, how many of each item was ordered giving the name of the item, and
-- what was the price of the item?
--steps
select * from Orders where OrderDate = '1998-5-5'
select * from [order details];
select * from products;

select *
	from orders as O
	join [Order Details] as OD
		on O.OrderID = OD.OrderID
	join Products as P
		on OD.ProductID = P.ProductID
	where orderdate = '1998-5-5';
--final answer to 5
select ProductName, OD.UnitPrice, sum(Quantity)
	from Orders as O
	join [Order Details] as OD
		on O.OrderID = OD.OrderID
	join Products as P
		on OD.ProductID = P.ProductID
	where OrderDate = '1998-5-5'
	group by P.ProductID, ProductName, OD.UnitPrice;

-- 6. For every order in May, 1998, what was the customer's name and the shipper's name?
select C.CompanyName, S.CompanyName 
	from orders as O
	join Shippers as S
		on O.ShipVia = S.ShipperID
	join Customers as C
		on O.CustomerID = C.CustomerID
	where month(orderdate) = 5 
		and year(orderdate) = 1998;

-- 7. What is the customer's name and the employee's name for every order shipped to France?
select c.companyname, 
		e.firstname + ' ' + e.lastname as customer
	from orders as o
	join customers as c
		on o.customerid = c.CustomerID
	join employees as e
		on o.employeeid = e.EmployeeID
	where shipcountry = 'France';

-- 8. List the products by name that were shipped to Germany.
select productname
	from orders as O
	join [order details] as OD
	on o.orderid = od.orderid
	join products as p
	on od.productid = p.productid
	where shipcountry = 'germany'
	group by Productname
	order by ProductName;