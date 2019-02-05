.echo on
.headers on

--Name: Michelle Caballero
--File Exercise03
--Date: 26 January 2019


-- Create a line Item report that contains a line for each product in the order
-- with the following columns: orderid, productid, unitprice, quantity sold,
-- item price, percent of that line item constitutes of thetotal amount of order.


select od.orderid, od.productid, od.unitprice, od.quantity,
(od.unitprice * od.quantity) as linetotal,
(od.unitprice * od.quantity) /
(select sum(od1.unitprice * od1.quantity)
from order_details od1 where od.orderid = od1.orderid) * 100 as pct
from order_details od limit 20;


-- 2. Know the unique cities, regions, and postal code

-- (a) Where we have both customers and employees,
select distinct e.city, e.region, e.postalcode
from employees e
inner join customers c
on e.city = c.city
order by e.city;

-- (b) Where we have customers but no employees AND both customers and employees
select distinct c.city, c.region, c.postalcode, e.city, e.region, e.postalcode
from customers c
left outer join employees e
on c.city = e.city
order by e.city;

--- (c) Where we have employees but no customers AND both customers and employees
select distinct e.city, e.region, e.postalcode, c.city, c.region, c.postalcode
from employees e
left outer join customers c
on e.city = c.city
order by c.city;

-- 3. Using subqueries, create a report that lists the ten most expensive
-- products.

select productid, productname, unitprice
from products
where unitprice >
(select unitprice from products where unitprice = 43.9)
order by unitprice desc;

-- 4. Using subqueries, create a report that shows the date of the last order
-- by all employees.

select o.employeeid, o.orderdate
from orders o
where o.orderdate =
(select max(o2.orderdate)
from orders o2 where o.employeeid = o2.employeeid)
group by employeeid
order by o.employeeid;
