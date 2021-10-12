---- 1. Country 별로 ContactName이 ‘A’로 시작하는 Customer의 숫자를 세는 쿼리를 작성하세요.
SELECT Country, COUNT(Country) Cnt
FROM Customers
WHERE ContactName like 'A%'
GROUP BY Country;


---- 2. Customer 별로 Order한 Product의 총 Quantity를 세는 쿼리를 작성하세요.
SELECT A.CustomerID, B.CustomerName, SUM(C.Quantity) AS Quantity 
FROM Orders AS A
	LEFT JOIN Customers AS B ON A.CustomerID = B.CustomerID
  LEFT JOIN OrderDetails AS C ON A.OrderID = C.OrderID
GROUP BY A.CustomerID;

---- 3. 년월별, Employee별로 Product를 몇 개씩 판매했는지를 표시하는 쿼리를 작성하세요.
SELECT OrderDate, EmployeeID, SUM(Quantity) AS Quantities
FROM OrderDetails AS A
	LEFT JOIN Orders AS B ON A.OrderID = B.OrderID
GROUP BY OrderDate, EmployeeID;
