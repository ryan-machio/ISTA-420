# Ryan Manchanthasouk
### TSQL Homework 5
### January 3rd, 2020
1. A table expression is a named query expression that represents a valid relational table.
1. Derived tables are located in the FROM clause of an OUTER QUERY.
1. The inner query and outer query are merged into one query directly against the underlying objects in a table expression.
The inner query is run before the outer query, so logically speaking the table values exist for the outer query to use.
1. WITH
1. Yes
1. Yes
1. No
1. WITH CHECK prevents modifications that conflict with the view's filter
1. It binds the schema of referenced objects and columns to the schema of the referencing object.  This is important because it indicates that referenced objects cannot be dropped and that the referenced columns cannot be dropped or altered.
prevents inconsistency of a view for an underlying table
1. Table valued functions are reusable table expressions that support input parameters.
1. APPLY allows you to join two table expressions.
1. OUTER APPLY and CROSS APPLY
