# Ryan Manchanthasouk
## TSQL Chapter 7 Hwk
## February 10th, 2020
1. What is a window function?
A window function is a function that, for each row, computes a scalar result value based on a calculation against a subset of the rows from the underlying query
1. What does PARTITION do?
The window-partition clause (PARTITION BY) restricts the window to the subset of rows that have
the same values in the partitioning columns as in the current row
1. What does ORDER BY do?
The window-order clause (ORDER BY) defines ordering, but don’t confuse this with presentation ordering
1. What does ROWS BETWEEN do?
(ROWS BETWEEN <top delimiter> AND <bottom delimiter>) filters a frame, or a subset, of rows from the window partition between the two specified delimiters.
1. What is a ranking window function? Why would you use it? Give an example.
You use ranking window functions to rank each row with respect to others in the window. ROW_NUMBER, RANK, DENSE_RANK, and NTILE
SELECT orderid, custid, val,
ROW_NUMBER() OVER(ORDER BY val) AS rownum,
RANK()
OVER(ORDER BY val) AS rank,
DENSE_RANK() OVER(ORDER BY val) AS dense_rank,
NTILE(100)
OVER(ORDER BY val) AS ntile
FROM Sales.OrderValues
ORDER BY val;
1. What is an offset window function? Why would you use it? Give an example.
You use offset window functions to return an element from a row that is at a certain offset from the current row or at the beginning or end of a window frame. T-SQL supports two pairs of offset functions: LAG and LEAD, and FIRST_VALUE and LAST_VALUE.
SELECT custid, orderid, val,
LAG(val)
OVER(PARTITION BY custid
ORDER BY orderdate, orderid) AS prevval,
LEAD(val) OVER(PARTITION BY custid
ORDER BY orderdate, orderid) AS nextval
FROM Sales.OrderValues
ORDER BY custid, orderdate, orderid;
1. What do LEAD and LAG DO
The LAG function looks before the current row, and the LEAD function looks ahead
1. What do FIRST VALUE and LAST VALUE do?
You use the FIRST_VALUE and LAST_VALUE functions to return an element from the first and last rows in the window frame, respectively
1. What is an aggregate window function? Why would you use it? Give an example.
You use aggregate window functions to aggregate the rows in the defined window. They support window-partition, window-order, and window-frame clauses.
select empid, ordermonth, val,
SUM(val) OVER(PARTITION BY empid
ORDER BY ordermonth
ROWS BETWEEN UNBOUNDED PRECEDING
AND CURRENT ROW) AS runval
FROM Sales.EmpOrders;
1. What is a pivot table and what does it do?
Pivoting data involves rotating data from a state of rows to a state of columns, possibly aggregating values along the way. In many cases, the pivoting of data is handled by the presentation layer for purposes such as reporting. The solution for pivoting based on an explicit grouped query is standard. T-SQL also supports a proprietary table operator called PIVOT that you can use to achieve pivoting in a more concise manner. As a table operator, PIVOT operates in the context of the FROM clause like any other table operator (for example, JOIN). It operates on the source table or table expression provided to it as its left input, pivots the data, and returns a result table.
1. In mathematical theory, what is a power set? How does this definition of power set relate to grouping
sets?
The set of all subsets of elements that can be produced from a particular set
1. What is a bit array? How can you implement a bit array to represent a set of
ages? How does the
GROUPING ID() function implement a bit array?
A bit array is an array data structure that compactly stores bits. It can be used to implement a simple set data structure. GROUPING ID() implements bit array by returning 1 when the element isn't part of the grouping set and 0 when it is
1. Read the documentation on the UNIX/Linux chmod command. How would interpret this command:
chmod 755 myscript.sql?
7 = allows user to read, write, and execute
5 = allows public to read and execute
5 = allows group to read and execute
