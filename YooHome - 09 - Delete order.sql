
-- 09. Delete order
USE "YooHome";

-- Order id (to delete)
DECLARE @curr_id INTEGER;
SELECT @curr_id = '21'; -- Order id

----------------------------------------------------------------------------------------------------------------------

-- Delete all items in that order
DELETE FROM OrderItem
WHERE OrderItem.oid = @curr_id;

-- Delete Order Head (must be delete AFTER items due to constraints)
DELETE FROM Orders
WHERE Orders.id = @curr_id;
