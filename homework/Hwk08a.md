# Ryan Manchanthasouk
## TSQL Chapter 8a Hwk
## February 17th, 2020
1. When using INSERT, is the list of columns necessary? Why or why not?

  -Specifying the target column names right after the table name is optional, but by doing so, you control the value-column associations instead of relying on the order of the columns in the CREATE TABLE statement. In T-SQL, specifying the INTO clause is optional. If you don’t specify a value for a column, Microsoft SQL Server will use a default value if one was defined for the column. If a default value isn’t defined and the column allows NULLs, a NULL will be used. If no default is defined and the column does not allow NULLs and does not somehow get its value automatically, your INSERT statement will fail.
1. When using INSERT SELECT, do you use a subquery (derived table)? Under what circumstances do you not use a subquery?

  -Yes, because you must SELECT the table you want to insert into the base table.  The exception you would not use a subquery is if you include a system function such as SYSDATETIME, where the function gets invoked only once for the entire query.
1. What is the operand for the INSERT EXEC statement?

  -table name
1. How would you use the INSERT INTO statement?

  -In terms of syntax, simply add INTO <target_table_name> right before the FROM clause of the SELECT query you want to use to produce the result set.  The SELECT INTO statement copies from the source the base structure (such as column names, types, nullability, and identity property) and the data.
1. What are the parameters to the BULK INSERT statement?

  -DATEFILETYPE, FIELDTERMINATOR, ROWTERMINATOR ***important***
1. Does IDENTITY guarantee uniqueness? If not, how do you guarantee uniqueness?

  -Yes it does
1. How do you create a SEQUENCE object?

  -CREATE SEQUENCE variablename AS <TYPE>
  -MINVALUE #
  -CYCLE; --or no cycle
  -ability to create uniqueness throughout the whole database
1. How do you use a SEQUENCE object?

  -invoke the NEXT VALUE command
1. How do you alter a SEQUENCE object?

  -ALTER SEQUENCE
1. What is the difference between DELETE and TRUNCATE?

  -The DELETE statement is a standard statement used to delete data from a table based on an optional
  filter predicate.
  -The standard TRUNCATE statement deletes all rows from a table. Unlike the DELETE statement, TRUNCATE has no filter
1. What is the difference between DELETE and DROP TABLE?

  -DROP TABLE removes the data and table structure, DELETE removes the data
