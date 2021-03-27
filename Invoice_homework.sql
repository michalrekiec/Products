/*  Homework week 6  */

/*  1. Invoice number, First Name, Last Name  */

SELECT i.Number AS [Numer Faktury], c.FirstName AS [Imię], c.LastName AS [Nazwisko]
FROM Invoices i
INNER JOIN Clients c ON c.Id = i.ClientNumber

/*  2. Invoice number, Product name, and price  */

SELECT i.Number AS [Numer faktury], p.Name AS [Nazwa produktu], p.Price AS [Cena]
FROM InvoicePositions ip
INNER JOIN Invoices i ON i.Id = ip.InvoiceId
INNER JOIN Products p ON p.Id = ip.ProductId

/*  3. Invoice number, sum of product quantity  */

SELECT i.Number AS [Numer Faktury], SUM(ip.Quantity) AS [Ilość produktów]
FROM InvoicePositions ip
INNER JOIN Invoices i ON i.Id = ip.InvoiceId
GROUP BY i.Number

/*  4. Invoice number, final price  */

SELECT i.Number AS [Numer Faktury], SUM(ip.Quantity * p.Price) AS [Cena całkowita] 
FROM InvoicePositions ip
INNER JOIN Invoices i ON i.Id = ip.InvoiceId
INNER JOIN Products p ON p.Id = ip.ProductId
GROUP BY i.Number
