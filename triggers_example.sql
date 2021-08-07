USE SpotifyProject;

-- Trigger Example - this trigger adds 100 streams to each artist.

DELIMITER //

CREATE TRIGGER Artists_average_monthly_streams_Before_Insert
BEFORE INSERT on Artists
FOR EACH ROW
BEGIN
	SET NEW.average_monthly_streams = NEW.average_monthly_streams+100;
END//
DELIMITER ;
 INSERT INTO Artists (
artist,
artist_ID,
genre,
average_monthly_streams)
VALUES (
'Nina Simone',
11,
'R&B, Jazz‎, ‎Blues‎, Soul',
2186625);
SELECT *
FROM SpotifyProject.Artists;


-- Another trigger example - Verifying potential customer is old enough to create a spotify account.


CREATE TABLE CustomerAge (
customer_ID INT,
FOREIGN KEY (customer_ID) REFERENCES Customers(customer_ID),
age INT);
USE SpotifyProject;
ALTER TABLE Customers;
INSERT INTO CustomerAge 
(customer_ID ,age)
VALUES
(1, 20), 
(2, 29);

DELIMITER //
CREATE TRIGGER Verify_age_eligibility BEFORE INSERT
ON CustomerAge
FOR EACH ROW
IF NEW.age < 18 THEN
SIGNAL SQLSTATE '50001' SET MESSAGE_TEXT = 'Person must be older than 18.';
END IF; //
DELIMITER ;
INSERT INTO CustomerAge 
(customer_ID ,age)
VALUES
(3, 9);


SELECT *
FROM SpotifyProject.Artists;
​