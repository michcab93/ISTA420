# Chapter 01, Background to T-SQL

### Michelle Caballero
##### 8 January 2019

1. How does the book describe the differences between _imperative_ and
_declarative_ languages?

``In a imperative language you tell the computer how to get something but in a
declarative language you tell the computer what you want to get, that is after
giving it a series of information.``

***this is how I would write Notes***

2. List three categories of command statements in SQL.

``DDL Data Definition Language``

``DML Data Manipulation Language``

``DLC Data Control Language.``

3. Give an informal definition of _database_ as used in the expression "relational
database management system". Given an informal definition of _database_ as used
in the expression "Human Resources database".

``In RDBMS the word database means different types of platforms. In
Human Resources Database, the word database means a collection of data.``

4. How does SQL implement three-valued predicate logic?

``SQL implements three-valued predicate by allowing three different types values
true, false, and unknow (null). An example of this would be when entering data in
a table and a value needed would be phone number, you could enter the correct
form of a  phone number 111-111-1111 which it would accept (true), could enter
incorrect form of a phone number 125742251 which it would not accept (false) or
could put NULL which it would accept as an unknow value, meaning exactly that, you
do not know the phone number.``

5. How does SQL enforce _entity integrity_? How does SQL enforce _referential
integrity_?

``Forced entity integrity is integrity forced by the context, such as the value
in table age can only be values that are integers. Referential integrity is achieved
by only allowing values in that table to be true if they exist in the table that
is being referred. For example if you use the value 31906 referencing from the
table zip codes, in your address table you can because 31906 is a zip code and
should be in the zip code table. But if you use the value abcde referencing from
the table zip codes, in your address table you cannot because the value abcde is
not a zip code and does not exist in the table zip codes.``

6. What is a _relation_ as defined in the textbook? A one word answer to this
question is sufficient.

``A relation is defined in the textbook as a set``

7. Is this table in first normal form? Why or why not? If it is not, how would
you change it?

``The table is not in first normal form because the attributes in the facCreds is
not atomic, it can be further divided by creating a separate relation. The new
relation would just include the facCreds.``

8. Is this table in second normal form? Why or why not? If it is not, how would
you change it?

``The table is not in the second normal form because not all the nonkeys attributes
are depended on the candidate-key attributes. For example you do not need the
candidate-key petID to find the nonkey attribute ownerFirstName. If you separated
the ownerFirstName, ownerLastName, and ownerID from the petName, petType, and petID
to create two different relations then you would have a second normal form relation.``

9. Is this table in third normal form? Why or why not? If it is not, how would
you change it?

``This table is not in third normal form because the city and zip depend on each
other. I would make an relation for zip and city, making the zip the candidate-key
and the city the nonkey attribute.``

10. List the components of a _four-part object name_.

``The four-part object name includes schema-qualified object-database name-instance.``

11. What is the difference between _declarative data integrity_ and _procedural
data integrity_?

``Declarative data integrity is enforced as part of the table definition, and
procedural data integrity is enforced with code.``
