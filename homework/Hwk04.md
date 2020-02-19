# Ryan Manchanthaosuk
### C# Homework 4
### February 2nd, 2020
1. A subquery is another query embedded in the where clause.
1. A self-contained subquery is a query that does not require input from the outer query.
1. Correlated subqueries are subqueries that refer to the attributes from the tables that appear on the outer query.
SELECT custid, orderid, orderdate, empid
FROM Sales.Orders AS O1
WHERE orderid =
(SELECT MAX(O2.orderid)
FROM Sales.Orders AS O2
WHERE O2.custid = O1.custid);
1. Scalar subquery - you would use this subquery when searching for one specific value.
1. Multivalued subquery - SOME, ANY, ALL.  Used in outer query to handle a subquery that returns multiple rows.
SELECT orderid
FROM Sales.Orders
WHERE empid IN
(SELECT E.empid
FROM HR.Employees AS E
WHERE E.lastname LIKE N'D%');
1. Correlated subquery - used to read every row in a table and compare values in each row against related data.  Use when you want to return a table, used in FROM clause.
1. EXISTS  accepts a subquery as input and returns true if the subquery returns any rows and false otherwise.  I.e. you are searching for specific values as false values, so you would do NOT exists, and if you had query results that would mean you have an error in the db.  Used in a list subquery
1. NOT negates everything following a predicate.  NOT EXISTS (variable)
1. It would return two values, you must specify two logical values for EXISTS and NOT exists to return a value.  Two values because it is either there or not there; can only be true or false, not unknown.
1. you would use select yearly sales, qty, ()(SELECT SUM(PRODUCT)) WHERE 02.productyear <= 01 productyear) AS productqty.  You would use an expression to place value to calculate the sum of total sales, where you would use variables explaining the specific dates you want to query.  
