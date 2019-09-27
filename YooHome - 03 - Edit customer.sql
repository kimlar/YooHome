
-- 03. Edit customer
USE "YooHome";

UPDATE Customer
SET email = 'tony.stark@marvel.com'
WHERE firstName = 'Tony' AND lastName = 'Stark' AND email = 'tony.stark@stark.com';
