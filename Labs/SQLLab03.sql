.echo on
.headers on

--Name: Michelle Caballero
--File: sqllab03.sql
--Date: 22 January 2019


-- 1. What is the order number and the date of each order sold by each employee?


select e.employeeid, e.lastname, e.firstname, o.employeeid, o.orderid, o.orderdate
from employees e inner join orders o
on e.employeeid = o.employeeid order by e.employeeid limit 20;

-- 2. List each territory by region

select t.territoryid, t.territorydescription, t.regionid, r.regionid, r.regiondescription
from territories as t
inner join region as r
on r.regionid = t.regionid
order by r.regiondescription limit 20;

-- 3. What is the supplier name for each product alphabetically by supplier?

select s.supplierid, s.companyname, p.productid, p.productname
from suppliers s
inner join products p
on s.supplierid = p.supplierid
order by s.companyname, p.productname limit 20;

-- 4. From every order on may 5, 1998, how many of each item was ordered, and
-- what was the price of the item?

select o.orderdate, p.productname, sum(od.quantity),
sum(od.quantity * p.unitprice) as total_price
from orders o
inner join order_details od
on o.orderid = od.orderid
inner join products p
on p.productid = od.productid
where o.orderdate like '1998-05-05'
group by o.orderdate, p.productname;

-- 5. For every order in May 5, 1998, how many of each item was ordered giving
-- the name of the item, and what was the price of the item?

-- 6. For every order in May, 1998, what was the customer's name and the shipper's
-- name
select o.orderid, o.orderdate, o.customerid, o.shipperid,
s.companyname as shipper_name, c.companyname as customer_name
from orders o
inner join shippers s on o.shipperid = s.shipperid
inner join customers c on o.customerid =  c.customerid
where o.orderdate like '1998-05%' order by c.companyname;

-- 7. What is the customer's name and the employee's name for every order shipped
-- to France?

 select c.customerid, c.companyname as customer_name, o.orderid, o.shipcountry,
  e.employeeid, e.firstname, e.lastname
  from orders o
  inner join customers c
  on o.customerid = c.customerid
  inner join employees e
  on o.employeeid = e.employeeid
  where o.shipcountry = "France" order by c.companyname;


-- 8. List the products by name that were shipped to Germany.
select p.productid, p.productname, o.shipcountry
from products p
inner join order_details od
on p.productid = od.productid
inner join orders o
on od.orderid = o.orderid
where o.shipcountry = "Germany" order by p.productname;
