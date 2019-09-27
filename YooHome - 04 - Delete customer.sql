
-- 04. Delete customer
USE "YooHome";

DELETE FROM Customer
WHERE firstName = 'Tony' AND lastName = 'Stark' AND email = 'tony.stark@marvel.com';
