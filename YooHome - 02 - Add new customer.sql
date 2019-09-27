
-- 02. Add new customer
USE "YooHome";

INSERT INTO Customer(firstName, lastName, email, hashPassword, realPassword, phoneHome, phoneWork, address1, address2, city, zipCode, country)
VALUES('Tony', 'Stark', 'tony.stark@stark.com', HASHBYTES('sha2_256', 'IronMan123'), 'IronMan123', '5555 5555', '6666 6666', 'Stark 1', 'Seaford district', 'California', 555666, 'USA');

/*
-- Show hashed password and real password
PRINT N'Hashed password: ';
PRINT HASHBYTES('sha2_256', 'IronMan123');
PRINT N'Real password:';
PRINT N'IronMan123';
*/

-- List all customers
SELECT * FROM Customer;

-- NOTE: email column is unique (IX_Constraint)