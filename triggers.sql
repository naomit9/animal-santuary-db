/* FEATURE 1 */
/* This trigger activates before a new record is inserted into the `transfer` or `arrival` table and automatically updates the status_id in the `animals` table*/
DELIMITER //
CREATE TRIGGER update_animal_transfer
BEFORE INSERT
ON TRANSFER FOR EACH ROW
BEGIN
	DECLARE new_status INT;
	DECLARE new_transfer_date DATE;

	IF NEW.status_id = 3 THEN	
		SET new_status = 3;
		SET new_transfer_date = NOW();
	ELSE
		SET new_status = 0;
		SET new_transfer_date = null;
	END IF;

	/* Update the status in the `animals` table */
	UDPATE animals
	SET status_id = new_status, transfer_date = new_transfer_date
	WHERE animal_id = NEW.animal_id;
END //
DELIMITER ;



DELIMITER //
CREATE TRIGGER update_animal_arrival
BEFORE INSERT
ON ARRIVAL FOR EACH ROW
BEGIN	
	DECLARE new_status INT;
	DECLARE new_arrival_date DATE;

	IF NEW.status_id = 1 THEN
		SET new_status = 1;
		SET new_arrival_date = NOW();
	ELSE
		SET new_status = 0;
		SET new_arrival_date = null;
	END IF;

	UPDATE animals
	SET status_id = new_status, arrival_date = new_arrival_date
	WHERE animal_id = NEW.animal_id;

END //
DELIMITER ;