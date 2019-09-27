
-- 10. Change order status (O -> P -> C)
USE "YooHome";

-- Order id
DECLARE @curr_id INTEGER;
SELECT @curr_id = 20;

-- New status
DECLARE @status CHAR(1);
SELECT @status = 'P'; -- O/P/C

----------------------------------------------------------------------------------------------------------------------

-- Set new status on order N
UPDATE Orders
SET Orders.orderStatus = @status
WHERE Orders.id = @curr_id;
