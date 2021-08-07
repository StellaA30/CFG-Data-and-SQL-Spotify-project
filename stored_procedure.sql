SELECT * FROM SpotifyProject.Albums;

DELIMITER //
-- Create Stored Procedure
CREATE PROCEDURE albumName(name_of_album varchar(50)
)
BEGIN
SELECT  year_released , no_of_tracks FROM Albums WHERE album_name = name_of_album;

END// DELIMITER ;

-- use separate SQL query tab for this
USE SpotifyProject;
CALL albumName('Good News');