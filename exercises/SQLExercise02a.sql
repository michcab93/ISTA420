.echo on
.headers on

--Name: Michelle Caballero
--File Exercise02
--Date: 19 January 2019

--1. Create mailing labels for customer representatives. Each label should
--consist of six lines. The mailing labels should be suitable for printing
--and on sticky label paper, specifically Avery 8160 labels. FORMAT

--TITLE FIRSTNAME LASTNAME
--COMPANYNAME
--STREET ADDRESS
--CITY STATE ZIP COUNTRY
--[blank line]
--[blank line]

select contacttitle ||' '|| contactname ||'
   ...> '|| companyname ||'
   ...> '|| address ||'
   ...> '|| city ||' '|| postalcode ||' '|| country ||'
   ...> '||' '||'
   ...> ' from customers limit 10;


 --2. Create a telephone book for customer representatives. Each line in the
 --telephone book should consist of the representative last name, representative
 --first name, company name, and telephone number. FORMAT

 --LASTNAME, FIRSTNAME MIDDLENAME [tab] COMPANYNAME [tab] PHONENUMBER

select substr(contactname, instr(contactname, " "), length(contactname))
 ||', '|| substr(contactname, 1, instr(contactname, " "))
 ||'                   '|| companyname ||'                     '||
 phone from customers order by substr(contactname, instr(contactname," "),
 length(contactname)) limit 20;


 --3. Create a report from Orders showing the shipping lag between order date
 --and shipped date. The report should contain four columns: the order number,
 --the order date, the order shipped date, and the difference in days between
 --the order date and shipping date.
 select orderid, orderdate, shippeddate,
 julianday(shippeddate) - julianday(orderdate) as "waitTime"
 from orders order by orderid limit 10;

-- 4. Your Age: How old are you, in days, today? Use Sqlite to calculate this.
select julianday('now') - julianday('1993-05-19');
