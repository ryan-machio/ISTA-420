use Northwind;

-- 1. Rank employees by sales showing IDs.
select top(5) EmployeeID,
        count(EmployeeID) as TotalSales
  from orders 
  group by EmployeeID
  order by TotalSales desc;

-- 2. report avg discounts taken by all customers for products that cost more than $50.00
-- ordering from the highest price to the lowest price
select ProductID, UnitPrice,
	avg(Discount) as AvgDiscount
  from [Order Details]
  where UnitPrice > 50.0
  group by ProductID, UnitPrice
  order by UnitPrice desc;
 
-- 3. Shippers ship to each country, report showing numb of orders each shippper 
-- delivered to each country.  10 >,
-- listed by country and numb of orders shipped to that country
select ShipVia, ShipCountry, 
  count(OrderID) as order_count
  from Orders
  Group by ShipVia, ShipCountry having count(OrderID) > 10
  Order By ShipCountry, order_count desc;
-- 4. For each order, what was the time lag between the order date and ship date?
SELECT OrderDate, ShippedDate, 
datediff(day, orderdate, shippeddate) as Lag 
from orders;

-- 5. I need the average time lag for each shipper.
select shipvia, avg(DATEDIFF(day, orderdate, shippeddate)) as Avg
from orders 
group by shipvia;

-- 6. I need to know the total price of each product on hand, that is, the price of each product line, sorted by product name
select productname, categoryid, (unitprice * unitsinstock) as totalinvcost 
from products 
order by productname asc;
-- 7. What is the dollar total we have tied up in inventory?
select sum(unitprice * unitsinstock) as TotalVal 
from products;
-- 8. common employee/customer pairs, number of times employee took
-- orders fromo the customer, number of oroders, alpha by customerid,
-- omit customer/employee pairs where the number of orders is < 5
select EmployeeID, CustomerID, 
count(customerID) as TotalCustomers
from orders 
group by employeeid, customerid
having count(customerID) > 4
order by CustomerID;
-- 9. How many days were you in the service, or how many days will you serve?
SELECT datediff(d                            , '20160424', '20200425');
-- 10. Answer these questions using built-in time and date function.
-- What is today's date?
SELECT GETDATE();
select DATEFROMPARTS(year(getdate()), month(getdate()), 1);
select DATEFROMPARTS(year(getdate()), month(getdate()) + 1, 1);
select EOMONTH(getdate());
