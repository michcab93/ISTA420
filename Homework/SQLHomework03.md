# SQL Chapter 03, Joins

### Michelle Caballero
##### 20 January 2019

1. In general, why would you even want to join two (or more) tables together?
This is a good time to think about the nature of relational algebra.

``You would want to join two tables together when you want to view certain
information from table one in relation to information from table 2.``

``For example, table one(customers) has customerid, customername, and
customerphone. Table two(orders) has orderid, orderdate, and customerid(of
costumer that placed order). If you want customername, and customerphone of
customers that placed orders on 2019-01-01 you would want to join tables
because each table only gives you partial information you want. Orders table
gives you the orderid, orderdate, customrerid, but not the customername or
customerphone. Customers table gives you customerid, customername, and
customerphone but not orderdate. Because tables are related by customerid you
can join tables. New table will display orderid, orderdate, customerid, and
customername, customerphone as referenced from customers table.``


2. Describe in your own words the output from an inner join.

``Inner join pairs every row in table one to every row in table two but only
displays rows that have a relation to each other based on the predicate you
give it.``

``For example, if you did a inner join of the orders table and customer table,
this operation would only return rows in which the customerid had a relational
orderid.``


3. Describe in your own words the output from an outer join.

 ``Outer join pairs every row in table one to every row in table two and returns
 all combination of rows. Rows that have a relation to other and rows that
 return value in relation to each other is NULL.``

 `` For example if you wanted to know out of all the customersid which customerid
 placed an order on 2019-01-01 and which customerid did not. An a outer join of
 the costumer table and order table, would return a customerid in relation to an
 orderid if order was made, but it would also return customerid with orderid of
 NULL if no order was made, because in this case no orderid was ever created or
 related with customer id.``

4. Describe in your own words the output from an cross join.

``Cross join pairs every row in table 1 to every row in table 2, the output is
every possible combination of the two tables. The number of rows in the new
table will be the number of rows in table 1 times number of rows in table 2.
Table one has 3 rows, table two has 3 rows, new table will have 9 rows because
3 * 3 = 9``

``Example``

Table 1
shoe type  |
-----      |
boot       |
sneaker    |
heal       |

Table 2
shoe color |
------     |
black      |
white      |
red        |

========= new table ========

 shoe type | shoe color
 ----      | ------
 boot | black
 sneaker | black
 heal | black
 boot | white
 sneaker | white
 heal | white
 boot | red
 sneaker | red
 heal | red

5. A convenient mnemonic for remembering the various joins is “Ohio.” Why is
this true?

`` ``

6. Give an example of a composite join.

``A composite join matches multiple attributes from each side. For example
table Customers has columns customerid, companyname, contactname, contactphone,
address and table SecondLocation has columns customerid, companyname, contactname2,
contactphone2, address2 (because you have the same customer with same account but
they have a second location that you ship products to). If you wanted one table
to display information for both locations you would do a composite join that
would join the customerid and companyname and display all other information for
both locations.``

SELECT C.customerid, C.companyname, C.contactname, C.contactphone, C.address,

S.customerid, S.companyname, S.contactname2, S.contactphone2, S.address2

FROM Customers AS C, SecondLocation AS S

ON C.customerid = L.customersid

and C.companyname = C. companyname


7. What is the diﬀerence between the following two queries? The business
problem is “How many orders do we have from each customer?”

`` The first query does not recognize values inside rows, so if there is a
NULL in that row, meaning the customerid does not  have any orderid associated,
 or customer did not place any order, the COUNT(*) function still counts it as one.
The second query process values inside the rows and associates the NULLS with a
false statement there for does not count them at all. If we want to get an accurate
number of orders placed by customerid we must do the second query and not count
rows with nulls as order.``


================first query===============
SELECT C.custid, COUNT(*) AS numorders

FROM Sales.Customers AS C

LEFT OUTER JOIN Sales.

Orders AS O

ON C.custid = O.custid

GROUP BY C.custid;

================second query===============

SELECT C.custid, COUNT(O.orderid) AS numorders

FROM Sales.Customers AS C

LEFT OUTER JOIN Sales.Orders AS O

ON C.custid = O.custid

GROUP BY C.custid;



8. What might be one reason the following query does not return the column
custID in this query?

``There is no way it would not return a custID column, if there where no order
placed after 20160101 then there would be no information in the column but the
column would still be there.``


================ query ===============

SELECT C.custid, C.companyname, O.orderid, O.orderdate

FROM Sales.Customers AS C

LEFT OUTER JOIN Sales.Orders AS O

ON C.custid = O.custid

WHERE O.orderdate >= ’20160101’;
