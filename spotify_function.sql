USE SpotifyProject;

DELIMITER //

CREATE FUNCTION subscription_price(type_of_subscription varchar(50))
RETURNS FLOAT(2)	
DETERMINISTIC
BEGIN
	DECLARE price FLOAT(2);
 IF type_of_subscription = 'Free' THEN 
		SET price = 0.00;
	ELSEIF type_of_subscription = 'Premium' THEN
		SET price = 9.99;
	ELSEIF type_of_subscription = 'Premium family' THEN
		SET price = 12.99;
	ELSEIF type_of_subscription = 'Premium student' THEN
		SET price = 4.99;
	END IF;
    
    -- Return th price for each subscription type
    RETURN (price);
END// DELIMITER ;
    
 SELECT * FROM SpotifyProject.Customers;
 SELECT 
    full_name ,
     phone_number,
     email_adress,
     type_of_subscription ,
     subscription_price(type_of_subscription)
FROM
  Customers;