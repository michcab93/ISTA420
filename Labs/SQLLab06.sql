.echo on
.headers on


-- Name:
-- File: Lab06.sql
-- Date:

-- 1. Create a list of every country where we have either a customer or supplier.
select country from suppliers union select country from customers;

-- 2. Create a list of every city and country where we have either a customer or supplier.
select city, country from suppliers union select city, country from customers;

-- 3. Create a list of every country where we have both a customer and and a supplier.
select country from suppliers intersect select country from customers;

-- 4. Create a list of every city and country where we have both a customer and a
-- supplier.

select city, country from suppliers intersect select city, country from customers;

-- 5. Create a list of every country were we have customers but not suppliers.
select country from customers except select country from suppliers;

-- 6. Create a list of every country were we have suppliers but not customers.
select country from suppliers except select country from customers;

-- 7. Create a list of every country where we have suppliers but not customer
-- and where we have a customers and suppliers. Do not include any country where we
-- have both suppliers and customers
with CountryWithCus as
(
Select country from customers except select country from suppliers
)
, CountryWithSup as
(
Select country from suppliers except select country from customers
)
select country from CountryWithCus union select * from CountryWithSup;
