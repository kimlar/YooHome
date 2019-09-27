
-- 05. List order #n (name + price)
USE "YooHome";

SELECT StockItem.name, StockItem.unitPrice, OrderItem.quantity, (OrderItem.quantity * StockItem.unitPrice) AS [Price] FROM StockItem
INNER JOIN OrderItem
ON OrderItem.sid = StockItem.id
WHERE OrderItem.oid = 10; -- Order id
