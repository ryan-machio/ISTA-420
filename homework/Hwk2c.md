# Ryan Manchanthasouk
### TSQL Hwk 2C
### January 26th, 2020
1.
  -DATETIME
  -SMALLDATETIME
  -DATETIME
  -TIME
  -DATETIME2
  -DATETIMEOFFSET
1. You express a date/time literal in string format, i.e. 'YYYYMMDD'
1. DATEFORMAT determines how SQL Server interprets the literals you enter when they are converted from a character -string type to ad ate and time type.
1. This FORMAT () function in the SQL is utilized for formatting a field in order to be brought into its displayable standard format.
1. FORMAT (value, format [, GERMAN])
1. -CAST: converts an expression of one data type to another in the first argument, translated to the second data type as provided by the second data argument
   -PARSE: returns the result of an expression, translated to the requested data type in SQL Server
   -CONVERT(): converts an expression of one data type to another.
1. Functions: GETDATE, CURRENT_TIMESTAMP, GETUTCDATE, SYSDATE TIME, SYSUTCDATETIME, SYSDATETIMEOFSET
1. DATEADD(day, 1, 'now')
   DATEADD(week, 1, 'now')
   DATEADD(month, 1, 'now');
   DATEADD(year, 1, 'now');
1. SELECT DATEDIFF(days, 'now', '1996-06-09');
1. use the ISDATE function
1. The EOMONTH function accepts an input date and time value and returns the respective end-of-month date as a DATE typed value.
1. DATEADD(month, 1, 'now')
1. DATEDIFF(datepart, startdate, enddate);
