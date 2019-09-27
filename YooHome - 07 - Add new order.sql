
-- 07. Add new order
USE "YooHome";

-- Select customer id
DECLARE @cust_id INTEGER;
SELECT @cust_id = 1;

-- Create order head
INSERT INTO Orders(cid, orderDate)
VALUES(@cust_id, GETDATE());

-- Save Orders.id into @curr
DECLARE @curr INTEGER;
SELECT @curr=SCOPE_IDENTITY();

-------------------------------------------

-- Add product: 2x White Siberian Headset
INSERT INTO OrderItem(oid, quantity, sid)
VALUES(@curr, 2, (SELECT StockItem.id FROM StockItem WHERE StockItem.name = 'White Siberian'));

-- Add product: 1x Gamer PC 2015 Hardcore
INSERT INTO OrderItem(oid, quantity, sid)
VALUES(@curr, 1, (SELECT StockItem.id FROM StockItem WHERE StockItem.name = 'Gamer PC 2015 Pro'));

-- Add product: 1x Microsoft Lumia 640
INSERT INTO OrderItem(oid, quantity, sid)
VALUES(@curr, 1, (SELECT StockItem.id FROM StockItem WHERE StockItem.name = 'Microsoft Lumia 635'));
