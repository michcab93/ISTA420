use TSQLV4;



WITH T1 AS (
SELECT EMPID, COUNT(ORDERID)AS NUMORDER,
YEAR(ORDERDATE) AS OYEAR
FROM sales.orders 
GROUP BY EMPID, YEAR(ORDERDATE))


SELECT empid, numorder, OYEAR, 
100. * NUMORDER  / sum(numorder) OVER() AS PERCT 
FROM T1 GROUP BY empid, OYEAR, NUMORDER order by empid;

