SET GLOBAL event_scheduler = ON;
USE SpotifyProject;

DELIMITER //
-- an event that will update the number of times songs crazy in love was played by customer_id 2 in the last hour

CREATE EVENT count_times_played 
ON SCHEDULE AT NOW() + INTERVAL 1 HOUR
DO BEGIN
	UPDATE Listening_Times
    SET number_of_times_played = number_of_times_played + 2
    WHERE song_name = 'Crazy In Love (feat.Jay-Z)'AND customer_ID = 1;

END//
DELIMITER ;
