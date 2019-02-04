# Chapter 02b, Background to T-SQL
### Homework 02b

### Michelle Caballero
##### 8 January 2019

1. What is a data type? Why do we have data types?

>> A data type refers to whether an attribute is an, interger, character,
string, double. It essentially specifies the "type" of data the attribute is.
We have data types in order to ensure that only the correct type of data is
stored in that column. Data types provide the most fundamental data integrity
constraints

*all the computer sees is ones and zeros it is up to us to interpret ones and
zeros, we must tell the computers what the ones and zeros represent.*


2. What is a collation? Name four elements of collation.

>> Collation is setting that determines how the database engine
should treat each character. It is a set of rules of how to handle each data type,
and it defines characteristics of that data type.

>> Four (levels) of collation are, instance, database, column, and expression.
>> Four elements of collation are
  + Latin_Genneral, what kind of characters it supports
  + dictionary sorting, how characters are sorted and compared.
  + CI, whether it is case insensitive
  + AS, if it is accent sensitive

3. How would you strip whitespace form a string? For example, suppose you had
"____DAVE____" but wanted only "Dave".

>> In order to remove whitespace from a string you use *RTRIM(string)* ,
*LTRIM(string)* for example
*SELECT RTRIM(LTRIM)('   abs   '));

*you can also use *TRIM* ([characters *FROM*] string)
EXAMPLE:
SELCT TRIM ('     test     ') string

4. Suppose you wanted to make a list of every college and university that was
called an Institute from the college table. Write a query.

>> SELECT collegename
>> FROM colleges
>> HAVING collegename like "%institue%",


5. How would you find out the index of the first space in a string? For example
, the index of the first space in "Barack Hussein Obama" would be 7.

*SELECT charindex(' ', 'Barack Hussein Obama') as myspace
returns  7*

6. How would you select just the first name in a list of the presidents. Each
record looks like the: "George Washington", "John Adams". First names can be an
arbitrary length, from "Cal" to "Benjamin". (e.g. Cal College, Benjamin Harrison)

*SELECT  SUBSTRING("George Washington", 1, charindex(' ', 'George Washington'))

SQL Server
*SELECT SUBSTRING(presidentname, charindex(' ', presidentname) len(contactname))
AS firstname;*

SQLite
SELECT substring(contact name, 1, instr(contactname, ' '))

7. What is the order of precedence for the logical operators?
 =,>,<,>=,<=,<> Comparison Operators
 *NOT*
 *AND*
 *BETWEEN, IN, LIKE, OR*
 = Assignment

8. What is the order of precedence for the math operators?
1. () Parentheses
2. * Multiplication, / Division, % Module
3. + Positive, - Negative, + Addition, + Concatenation, - Subtraction


9. What is the difference between a simple and a search CASE expression?

>> Pretty much assigning a new value to a value which meets the criteria meet.
A simple CASE expression does this in a list format. It first list what the critiria
for the value you want to rename, and then list what you want the new value to be.
If no value met your requiered criteria then the value assigned to that row will
be "ELSE NULL" or what ever value you assign to the *ELSE* clause.

>> A simple CASE expression compares one value or scalar expression with a list
of possible values and returns a value for the first match. If no value in the
list is found then it returns value assigned in the *ELSE* clause

>> A search CASE expression assigns a new value to a value  that meets one or
more logical conditions. In a search CASE expression you can specify predicates,
rather then being restricted to a equality comparison listed.

10. How would you turn a list of names like this: "FIRSTNAME LASTNAME", to a list
like this: "LASTNAME, FIRSTNAME"?

>> EXAMPLE 'CABALLERO, MICHELLE'
SELECT SUBSTRING(customername, charindex(' ', customername), len(customername)
+ ' ' + SUBSTRING(customername, 1, charindex(' ',customername))

11. How would you turn a list of names like this: "FRIST NAME LAST NAME", to a
list like this: "LASTNAME, FIRSTNAME"?

>>EXAMPLE 'MICHELLE CABALLERO'
SELECT SUBSTRING(customername, charindex(' ',customername), len(customername)
+ ' ' + SUBSTRING(customername, 1, charindex(' ', customername));
