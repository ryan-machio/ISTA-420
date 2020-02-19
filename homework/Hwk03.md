# Ryan Manchanthasouk
### TSQL Hwk 3
### January 27th, 2020
1. You would join two or more tables together to compare and contrast data.
1. An inner join applies a cartesian product, or common value, between the
two input tables and filters rows based on what columns you specify.
1. An outer join is used to match rows between.
1. A cross join will combine each row from the first row set with each row from the second row set
1. round on the ends and high in the middle
1. FROM dbo.Table1 AS T1
  INNER JOIN dbo.table2 as t2
    ON t1.col1 = t2.col1
    AND t1.col2 = t2.col2
1. The COUNT(*) query takes inner rows and outer rows because it counts row regardless of content, while the bottom rows is only taking the count of O.orderid.
1. any value null will be discarded bc of the >
