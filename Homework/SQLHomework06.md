# SQL Chapter 06, Table Expressions

### Michelle Caballero
##### 29 January 2019


1. What does the set operator do?
``The set operator combines the rows from two queries``

2. What are the general requirements of a set operator?
`` The subquery cannot have an order by clause. The two queries must results
in the same number of columns  and corresponding columns must have same data
types. The names of the new columns are determined by the first query``

3. What is a venn diagram?
`` A venn diagram is a diagram that shows all possible logical relations between
a different sets.``

4. Draw a Venn Diagram of the UNION operator. What does it do?
`` UNION, unifies all the results of two queries, leaving out repeating rows. ``

5. Draw a Venn Diagram of the UNION ALL operator. What dos it do?
`` UNION ALL, unifies all the results of two queries including all duplicate rows``

6. Draw a Venn Diagram of the INTERSECT operator. What does it do?
`` INTERSECT operator returns rows that appear in both queries. ``

7. Draw a Venn Diagram of the INTERSECT ALL operator. What does it do?
`` INTERSECT ALL operator returns rows that appear in both queries and returns
duplicates, so if in query a there are 5 duplicate rows and in query b there
are 3 duplicate rows, 3 duplicate rows will be displayed in the result.``

8. Draw a Venn Diagram of the EXCEPT operator. What does it do?
`` EXCEPT operator return rows that appear in the first query but not in the
second query.``

9. If SQL Server supported the EXCEPT ALL operator, what would it do?
`` EXECPT ALL operator returns only occurrences of a row form the first multiset
that do not have a corresponding occurrence in the second.``

10. What is the precedence of the set operators?
`` (INTERSECT), UNION, and EXECPT in order of appearance.``
