
-- 12. Show tracking (company + tracknum)
USE "YooHome";

DECLARE @order INTEGER;
SELECT @order = 9;

----------------------------------------------------------------------------------------------------------------------

SELECT trackingCompany, trackingID FROM Orders
WHERE id = @order;
