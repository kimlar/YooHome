
-- 08. Edit order
USE "YooHome";

-- Order id
DECLARE @curr_id INTEGER;
SELECT @curr_id = '18';

-- Product name
DECLARE @curr_name NVARCHAR(50);
SELECT @curr_name = 'Microsoft Lumia 635';

-- New quantity
DECLARE @curr_quantity INTEGER
SELECT @curr_quantity = 4

----------------------------------------------------------------------------------------------------------------------

-- BEFORE Editing orders quantity
SELECT * FROM OrderItem
WHERE OrderItem.oid = @curr_id AND sid = (SELECT StockItem.id FROM StockItem WHERE StockItem.name = @curr_name);

-- Change quantity
UPDATE OrderItem
SET OrderItem.quantity = @curr_quantity
WHERE OrderItem.oid = @curr_id AND sid = (SELECT StockItem.id FROM StockItem WHERE StockItem.name = @curr_name);

-- AFTER Editing orders quantity
SELECT * FROM OrderItem
WHERE OrderItem.oid = @curr_id AND sid = (SELECT StockItem.id FROM StockItem WHERE StockItem.name = @curr_name);
