# Chapter 02c, Background to T-SQL
### Homework 02c

### Michelle Caballero
##### 15 January 2019


1. Payments are du exactly 30 days from the date of the last function, Write a select quere that calculates
the date of the next payment. Pretend we want to update a column in a database that contains the
date of the next payment. We will do this when we write UPDATE queries.

>> SELECT DATEADD(day, 30, shippeddate)

2. Suppose your son or daughter wants to run a query every day that tells them the number of days until
their 16th birthday. Write a select query that does this.

>> SELECT DATEDIFF(day, '19930519' , '20190115');
SELCT DATEDIFF(day, birthday, currentdate);
SELECT DATEDIFF(day, customerbirthday, getdate());

9. What function returns the current date? This is very useful in a table that maintains a log of events,
such as user logins.

>>
