# Ryan Manchanthasouk
## TSQL Chapter 6 Homework
## February 10th, 2020
1. What does a set operator do?
A set operator compares complete rows between the results of the two input queries involved.
1. What are the general requirements of a set operator
1. What is a Venn Diagram? This is not in the book.
a diagram representing mathematical or logical sets pictorially as circles or closed curves within an enclosing rectangle (the universal set), common elements of the sets being represented by the areas of overlap among the circles.
1. Draw a Venn Diagram of the UNION operator. What does it do?
The UNION operator unifies the results of two input queries
1. Draw a Venn Diagram of the UNION ALL operator. What does it do?
The UNION ALL operator unifies the two input query results without attempting to remove duplicates
from the result
1. Draw a Venn Diagram of the INTERSECT operator. What does it do?
The INTERSECT operator returns only the rows that are common to the results of the two input queries
1. If SQL Server supported the INTERSECT ALL operator, what would it do?
It would return the number of duplicate rows matching the lower of the
counts in both input multisets
1. Draw a Venn Diagram of the EXCEPT operator. What does it do?
The EXCEPT operator implements set differences.
1. If SQL Server supported the EXCEPT ALL operator, what would it do?
The EXCEPT ALL operator is similar to the EXCEPT operator, but it also takes into account the number of
occurrences of each row.
1. What is the precedence of the set operators?
Ordre of precedence: INTERSECT, UNION & EXCEPT
1. The symmetric difference of two sets A and B is all elements in A that are also not in A and B, and all
elements of B that are also not in A and B. For example, if set A consisted of all integers between 1 and
100 that are divisible by 2, and set B consisted of all integers between 1 and 100 that are divisible by
3, the symmetric difference of A and B would include all integers in A and B except integers divisible
by both 2 and 3, e.g., 6, 12, 18, etc. Write a SQL query that computes the symmetric difference of two
tables A and B.
select *
FROM A
UNION
select *
FROM B;
