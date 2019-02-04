.echo on
.headers on

--Name: Michelle Caballero
--File: Lab 02
--Date: 8 January 2019



--1 What are the regions?

--2 What are the cities?
 select * from territories;

--3 What are the cities in the Southern region?
 select * from territories where regionid = 4;

--4 how do you run this query with a table alias?
 select t.territoryid, t.territorydescription, t.regionid from 
territories t where t.regionid = 4;

--6 what is the contact name, telephone number, city, 
 select contactname, companyname, phone, city from customers;

--7 What are the products currently out of stock?
select p.productid, p.productname, p.supplierid, p.unitsinstock 
from products p where p.unitsinstock = 0;

--8 What are the ten products currently in stock with the least amount on hand?