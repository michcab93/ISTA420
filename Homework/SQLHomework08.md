# SQL Chapter 08, Data Modification

### Michelle Caballero
##### 04 February, 2019


1. When using INSERT, is the list of columns necessary? Why or why not?

`` The list of columns is not necessary, but they help identify the
association of that value with a column. If no columns are used SQL
server will use a default value. If no default was assigned and NULLS
are permitted it will use a NULL but if there are no default value
and NULLS are not permitted the INSERT statement will fail.``

2. When using INSERT SELECT, do you use a subquery (derived table)? Under
what circumstances do you not use a subquery?

`` Yes, you use a subquery.``

3. What is the operand for the INSERT EXEC statement?

`` The INSERT EXECT statement returns results from a stored procedure or
a dynamic SQL batch.``

4. How would you use the INSERT INTO statement?

`` You can use the SELECT INTO statement by selecting columns you want
from one table syntax (INTO) the name of the table you want to insert them
into and syntax (FROM) what table did you select columns from.``

5. What are the parameters to the BULK INSERT statement?

`` The parameters are targeted table, the source file, and "options".
Options can be data type, field terminator, row terminator, etc.``

6. Does IDENTITY guarantee uniqueness? If not, how do you guarantee uniqueness?

`` IDENTITY does not guarantee uniqueness, if you want uniqueness then you
need to define a primary key or unique constrain on that column.``

7. How do you create a SEQUENCE object?

`` To create a new SEQUENCE object you use the function NEXT VALUE FOR
< the sequence name >. ``


8. How do you use a SEQUENCE object?

`` After you create the SEQUENCE object you INSERT INTO  <name of table>
VALUES (new values)``

9. How do you alter a SEQUENCE object?

`` ``

10. What is the difference between DELETE and TRUNCATE?

`` DELETE has filters that select specific things to delete, TURNICATE
does not.``

11. What is the difference between DELETE and DROP TABLE?

`` DELETE deletes the date DROP TABLE deletes the table``
