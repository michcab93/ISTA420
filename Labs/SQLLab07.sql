-- Name: Michelle Caballero
-- File: Lab07.sql
-- Date: February 04, 2019


use TSQLV4;

-- 1. query against the dbo.Orders tabel that computes both a rank and a dense rank for each
-- customer order, particioned by custid and order by qty

select * from dbo.orders; 

Select custid, orderid, qty, 
	rank() OVER(partition by custid order by qty) as rnk,
	dense_rank() over(partition by custid order by qty) as drnk 
	from dbo.orders;

-- 2. Write a qurey against the dbo.Orders table that computes for ech customer order both the difference
-- between the current order quantity and the customer's previous order quantity and the difference
-- between the current order quantity and the customer's next order quantity:

select custid, orderid, qty,
qty - lag(qty) over (partition by custid order by orderdate) as prevdiff,
qty - lead(qty) over (partition by custid order by orderdate) as nextdiff

from dbo.orders;



-- how many orders did each emp place this year compared to last year 

select empid, count(distinct orderid), year(oderdate),

select * from sales.orders;

select empid, count(orderid) as numoford, year(orderdate) as year from sales.orders group by empid, year(orderdate);

with T1 as 
(select empid, count(orderid) as numoford, year(orderdate) as year from sales.orders group by empid, year(orderdate)

select empid, 



 
