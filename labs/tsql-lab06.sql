--Name: Ryan Manchanthasouk
--File: tsql-lab06.sql
--Date: February 10th, 2020

--Write a query that returns customer and employee pairs that had order
--activity in January 2016 but not in February 2016

select custid, empid, year(orderdate) as year, month(orderdate) as month
	from sales.orders
	where orderdate like '2016-01%'
EXCEPT
select custid, empid, year(orderdate) as year, month(orderdate) as month
	from sales.orders
	where orderdate like '2016-02%';

--Write a query that returns customer and employee pairs
--that had order activit in both January 2016 and February 2016:
select custid, empid, year(orderdate) as year, month(orderdate) as month
	from sales.orders
	where orderdate like '2016-01%'
INTERSECT
select custid, empid, year(orderdate) as year, month(orderdate) as month
	from sales.orders
	where orderdate like '2016-02%';

--Write a query that returns all customer and employee pairs that had
--activity in January, 2016 and February, 2016, but did NOT have activity
--in both January and February
(select custid, empid, year(orderdate) as year, month(orderdate) as month
	from sales.orders
	where orderdate like '2016-01%'
UNION
select custid, empid, year(orderdate) as year, month(orderdate) as month
	from sales.orders
	where orderdate like '2016-02%')
EXCEPT
(select custid, empid, year(orderdate) as year, month(orderdate) as month
	from sales.orders
	where orderdate like '2016-01%'
INTERSECT
select custid, empid, year(orderdate) as year, month(orderdate) as month
	from sales.orders
	where orderdate like '2016-02%')

--Write a query that returns customer and employee pairs that had activity
--in both January 2016 and February 2016, but not in 2015;
(select custid, empid
	from sales.orders
	where orderdate like '2016-01-%'
UNION
select custid, empid
	from sales.orders
	where orderdate like '2016-02-%')
EXCEPT
select custid, empid
	from sales.orders
	where year(orderdate) = 2015;