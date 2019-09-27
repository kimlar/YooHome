
-- 06. Total sum of order #n
USE "YooHome";

SELECT SUM(OrderItem.quantity * StockItem.unitPrice) AS [Price] FROM StockItem
INNER JOIN OrderItem
ON OrderItem.sid = StockItem.id
WHERE OrderItem.oid = 10; -- Order id
