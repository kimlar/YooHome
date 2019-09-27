
-- 13. Trigger

/*
-- STEP 1 - Create a table
USE "YooHome";

-- Create a recipe table for testing the trigger
CREATE TABLE Recipe(id int IDENTITY(1,1) PRIMARY KEY, price smallmoney);
*/


/*
-- STEP 2 - Create a trigger
CREATE TRIGGER trigAddTax
ON Recipe
AFTER INSERT
AS
BEGIN
	-- Get id from inserted item
	DECLARE @id int;
	SET @id = (SELECT id FROM inserted);
	
	-- Add 25% tax
	UPDATE Recipe SET Recipe.price = Recipe.price * 1.25 WHERE Recipe.id = @id;
END
*/


/*
-- STEP 3 - Test if it works
USE "YooHome";
INSERT INTO Recipe(price) VALUES('5.00');
INSERT INTO Recipe(price) VALUES('7.00');
INSERT INTO Recipe(price) VALUES('8.00');
*/