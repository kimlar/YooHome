
-- 11. Change item price
USE "YooHome";

-- Product name
DECLARE @name NVARCHAR(50);
SELECT @name = 'Micro SD card 256 GB';

-- New price
DECLARE @price NVARCHAR(50);
SELECT @price = 799.99;

----------------------------------------------------------------------------------------------------------------------

-- Give new price for product X
UPDATE StockItem
SET StockItem.unitPrice = @price
WHERE StockItem.name = @name;
