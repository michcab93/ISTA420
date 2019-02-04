-- Name:
-- File: Lab05.sql
-- Date:

-- 1
SELECT orderid, orderdate, custid, empid,
  DATEFROMPARTS(YEAR(orderdate), 12, 31) AS endofyear
FROM Sales.Orders
WHERE orderdate <> DATEFROMPARTS(YEAR(orderdate), 12, 31);


with C as
(
Select *, 
DATEFROMPARTS(YEAR(orderdate), 12, 31) AS endofyear
FROM Sales.Orders
)
Select orderid, orderdate, custid, empid, endofyear
from c
where orderdate <> endofyear;


--2

select empid, max(orderdate) as maxorderdate 
from sales.orders group by empid order by empid;

select o.empid, o.orderid, o.custid, d.maxorderdate
from sales.orders o join 
(select empid, max(orderdate) as maxorderdate 
from sales.orders group by empid) d
on o.orderdate = d.maxorderdate
and o.empid = d.empid order by o.empid;


with d as
(select empid, max(orderdate) as maxorderdate 
from sales.orders group by empid)

select o.empid, o.orderid, o.custid, d.maxorderdate
from sales.orders o
join d on 
o.empid = d.empid
and o.orderdate = d.maxorderdate;


-- 3 
with ordersRN as
(
select orderid, orderdate, custid, empid, 
ROW_NUMBER() over (order by orderdate, orderid) as rownum
from sales.orders 
)
select * from ordersRN where rownum between 11 and 20; 


-- 4 

-- 5 

select o.empid, year(o.orderdate) as orderyear, sum(od.qty)
from sales.orders o join sales.orderdetails od 
on o.orderid = od.orderid group by o.empid, year(o.orderdate)
order by o.empid, year(o.orderdate);



drop view if exists sales.vemporders;
go
create view sales.vemporders as 
(
select o.empid, year(o.orderdate) as orderyear, sum(od.qty) as qtysum
from sales.orders o join sales.orderdetails od 
on o.orderid = od.orderid group by o.empid, year(o.orderdate));  

select * from sales.vemporders order by empid, orderyear; 








