# SQL Chapter 04, Subqueries

### Michelle Caballero
##### 22 January 2019


1. In your own words, what is a subquery?

`` A subquery is a query that returns a value or variable to be used in another
subquery``

2. In your own words, what is a self contained subquery?

`` A self contained subquery is a query that does not depend on the tables from
the outer query to return a value. ``

3. In your own words, what is a correlated subquery?

`` A correlated subquery is a query that utilizes tables of the outer query to
return a value or variable ``

4. Give an example of a subquery that returns a single value. When would you
use this kind of subquery?

select orderid, empid

from sales.orders

where empid =

(selectmax(e.empid) from sales.orders  as e);

`` This would select all of the orders placed by the most recently hired employee
assuming employeeids are assigned in ascending order making his the highest
employee id ``

5. Give an example of a subquery that returns multiple values. When would you
use this kind of subquery?

SELECT productid, productname, unitprice

FROM sales.products

WHERE unitprices >= (SELECT max(unitprice) from sales.producs as p);


`` This query would return the productid and product name for the products with
the highest price. The reason this is consider a multivalue query and not a
scalar query, even though it only returns one value, is because it is possible
to have multiple products with the same prices. We did not know if multiple
products where the most expensive or if only one product was the most expensive.``

6. Give an example of a subquery that returns table values. When would you use
this kind of subquery?

** use a table value subquery in the from clause, suppose you need a table you
want to run your query against you can create this table in a subquery.

7. What does the exists predicate do? Give an example.

``The exists predicate filters out any rows where the one column value does not
have a value assigned to it in the other column.``


8. What happens if we use the not operator before a predicate? Give an example.

`` It returns the opposite results of the predicate.``

9. When you use exists or not exists with respect to a row in a database, does
it return two or three values? Explain your answer.

`` It returns two values because it uses two value logic, either true or false.``

10. How would you use a subquery to calculate aggregates? For example, you want
to calculate yearly sales of a product, and you also want to keep a running sum
of total sales. Explain how you would use a subquery to do this.

`` You would select a subquery that summed the quantities if the variable in
the second instance was less then the variable value in first instance, therefor
adding on the quantity in the next sequenced order.``
