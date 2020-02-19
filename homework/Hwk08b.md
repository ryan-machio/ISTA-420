# Ryan Manchanthasouk
## TSQL Hwk 8b
## February 18th, 2020
1. The sales tax rate for a state just changed. How would you update the state sales tax table to reflect the changes? Assume that this table has an ID column, an RATE column, and a STATE column.

    - UPDATE salestax
    - SET rate = rate + 0.5
    - WHERE state = 'va';
1. The Revenue Division has requested that you provide a report on what the actual sales taxes would have been for all orders in the past year, assuming the retroactivity of the new sales tax rate. How would you calculate this?

    - SELECT (unitprice * quantity) as order,
    - (order * rate) as old_tax_rate,
    - (order * rate + 0.5) new_tax_rate
    - FROM salestax
    - WHERE orderdate = '2019-%-%';
1. Explain how the proprietary assignment update command works.

  - T-SQL supports a proprietary UPDATE syntax that both updates data in a table and assigns values to variables at the same time. This syntax saves you the need to use separate UPDATE and SELECT statements to achieve the same task.
1. What is one very important purpose of the MERGE SQL statement? What is ETL (not in book)?

  - ETL is extract, transform, and load.  It's a process used to extract data from various sources, transform the data, and load the data into a destination
1. What are the semantics of MERGE?

  - Based on JOIN semantics.  You specify the target table name in the MERGE clause and the source table name in the USING clause. You define a merge condition by specifying a predicate in the ON clause. The merge condition defines which rows in the source table have matches in the target and which don’t.
  - Runs insert, update, or delete operations on a target table from the results of a join with a source table.
1. Write a typical INSERT OUTPUT statement.

  - INSERT INTO dbo.T1(datacol)
  - OUTPUT inserted.keycol, inserted.datacol
  - SELECT lastname
  - FROM HR.Employees
  - WHERE country = N'USA';
1. Write a typical UPDATE OUTPUT statement.

  - UPDATE table
  - SET variable
  - OUTPUT
  - INSERTED.column
  - DELETED.column
  - more inserted.columns
  - WHERE variablename = value;
1. Write a typical DELETE OUTPUT statement.

  - DELETE FROM dbo.Orders
  - OUTPUT
  - deleted.orderid,
  - deleted.orderdate,
  - deleted.empid,
  - deleted.custid
  - WHERE orderdate < '20160101';
1. Write a typical MERGE OUTPUT statement.

  - MERGE INTO tgttable AS TGT
  - USING srctable AS SRC
  - ON TGT.id = SRC.id
  - WHEN MATCHED THEN
  - UPDATE SET
  - tgt.column = src.column  
  - WHEN NOT MATCHED THEN
  - INSERT (columns)
  - VALUES (SRC.columns)
  - OUTPUT @action AS the action, inserted.srcid
  - deletedcolumn AS oldcolumn
  - insertedcolumn AS newcolumn
1. What is nested DML?

  - T-SQL supports a feature called nested DML you can use to directly insert into the final target table only the subset of rows you need from the full set of modified rows.
1. (Not in book) Write a query adding a new column to a table named PERSON. The new column name is DayOfBirth and the data type is string. Use ANSI SQL syntax.

  - ALTER TABLE person
  - ADD DayOfBirth string;
1. (Not in book) Write a query adding a DEFAULT constraint to the column DayOfBirth. The constraint is that the value matches one of SUN, MON, TUE, WED, THU, FRI, or SAT.

  - ALTER TABLE person
  - ALTER DayOfBirth SET DEFAULT 'SUN';
1. (Not in book) Write a query adding a foreign key to the column DayOfBirth. The referenced table is
named WEEK and the referenced column is ValidDay.

  - ALTER TABLE person
  - ADD FOREIGN KEY (personid) REFERENCES person(personid);
