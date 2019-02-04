.echo on
.headers on

--Name: Michelle Caballero
--File: athomesqllab03.sql
--Date: 22 January 2019

DROP TABLE IF EXISTS Sales.OrderDetailsAudit;

CREATE TABLE Sales.OrderDetailsAudit
(
lsn int not null identity,
orderid int not null,
productid int not null,
dt datetime not null,
loginname sysname not null,
columnname sysname not null,
oldval SQL_VARIANT,
newval SQL_VARIANT,
CONSTRAINT PK_OrderDetailsAudit PRIMARY KEY (lsn),
CONSTRAINT FK_OrderDetailsAudit_OrderDetails
	FOREIGN KEY (orderid, productid)
	REFERENCES Sales.OrderDetails(orderid, productid)
);

SELECT OD.orderid, OD.productid, OD. qty,
	ODA.dt, ODA.loginname, ODA.oldval, ODA.newval
FROM Sales.OrderDetails AS OD
INNER JOIN Sales.OrderDetailsAudit AS ODA
ON OD.orderid = ODA.orderid
WHERE ODA.columnname = N'qty';


SELECT E.empid, E.firstname, E.lastname, N.n
FROM HR.Employees AS E
	CROSS JOIN dbo.Nums as N
	WHERE n < 6;

SELECT E.empid, DATEADD(day, D.n-1, CAST('20160612' AS DATE)) AS dt
FROM HR.Employees AS E
CROSS JOIN dbo.Nums as D
WHERE D.n <= DATEDIFF(day, '20160612', '20160616') + 1
ORDER BY empid, dt;

SELECT C.custid, COUNT(DISTINCT O.orderid)AS numberorders, SUM(OD.qty) totalquantity
FROM Sales.Customers AS C
LEFT OUTER JOIN Sales.Orders AS O
ON C.custid = O.custid
LEFT OUTER JOIN Sales.OrderDetails as OD
ON O.orderid = OD.orderid
WHERE C.country = 'USA'
GROUP BY C.custid;

SELECT C.custid, C.companyname, O.orderid, O.orderdate
FROM Sales.Customers AS C
LEFT OUTER JOIN Sales.Orders AS O
ON C.custid = O.custid;

SELECT C.custid, C.companyname, O.orderid, O.orderdate
FROM Sales.Customers AS C
LEFT OUTER JOIN Sales.Orders AS O
ON C.custid = O.custid
WHERE O.orderid is NULL;

SELECT C.custid, C.companyname, O.orderid, O.orderdate
FROM Sales.Customers AS C
LEFT OUTER JOIN Sales.Orders AS O
ON C.custid = O.custid
WHERE O.orderdate = '20160212';

SELECT C.custid, C.companyname, O.orderid, O.orderdate
FROM Sales.Customers AS C
LEFT OUTER JOIN Sales.Orders AS O
ON C.custid = O.custid
AND O.orderdate = '20160212';

SELECT DISTINCT C.custid, C.companyname,
CASE WHEN O.orderdate IS NOT NULL THEN 'YES' ELSE 'NO' END AS orderplaced
FROM Sales.Customers AS C
LEFT OUTER JOIN Sales.Orders AS O
ON C.custid = O.custid
AND O.orderdate = '20160212';
