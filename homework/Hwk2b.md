# Ryan Manchanthasouk
### TSQL Hwk 2b
### January 22nd, 2020
1. A data type is a specific kind of data item that is defined by the values it can take.
   Data types tell MMU how much memory requirement it has before the program compiles.
1. Collation is a property of character data that encapsulates several aspects.
  The four elements of a collation are: instance, database, column, and expression | language support, sort order,
1. You can use the LTRIM and RTRIM, LTRIM strips the white space at the beginning,
  while RTRIM strips the whitespace at the end.
1. select collegeID, universityID, collegeName, universityName from college where type like 'Institute';
1. select patindex('%[0-7]%','Barack Hussein Obama'); select substr("John Adams", 1, instr("John Adams", " ")); or select substr("Barach Hussein Obama", 1, instr("Barack Hussein Obama", " "));
1. SUBSTRING(presidents, 1, 1);
1. Starting from level 1, ~ (NOT), level 2: *, /, %, level 3: postiive, negative, addtion, concatenation, subtraction, bitwise AND, bitewise or
  level 4 comparison operators, 5 NOT, 6 AND, 7 ALL, ANY, BETWEEN, IN, LIKE, OR, SOME 8 = (ASSIGNMENT)
1. the order of precedence is logical complements are performed first, logical conjunctions are performed next, and
  logical disjunctions are performed at the end
1. simple compares an expression to a set of simple expressions to determine the result,
  the searched expression evaluate a set of boolean expressions to determine the result
1.
SELECT
  SUBSTRING(FullName, 1, CHARINDEX(' ', FullName) - 1) AS FirstName,
  REVERSE(SUBSTRING(REVERSE(FullName), 1, CHARINDEX(' ', REVERSE(FullName)) - 1)) AS LastName
FROM
  [PERSON_TABLE]
1.
SELECT
  SUBSTRING(FullName, 2, CHARINDEX(' ', FullName) - 1) AS LastName,
  REVERSE(SUBSTRING(REVERSE(FullName), 2, CHARINDEX(' ', REVERSE(FullName)) - 1)) AS FirstName
FROM
  [PERSON_TABLE]
