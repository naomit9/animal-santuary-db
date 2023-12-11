/* FEATURE 1 
the trigger is configured to update the animals table when a new record is inserted into the transfer table.*/
UPDATE animals
SET status = 'Active',
    arrival_date = NEW.arrival_date
	WHERE animal_id = NEW.animal_id;

DELIMITER $$
CREATE TRIGGER update_animal_arrival
BEFORE UPDATE ON animals
FOR EACH ROW
BEGIN
	    SET NEW.status = 'Active';
		SET NEW.arrival_date = NOW();
END; $$
DELIMITER ; 

/*
##### TRIGGER 2: UPDATE THE ANIMALS TABLE WHEN AN ANIMAL LEAVES THE SANCTUARY
*/
UPDATE animals
SET status = 'Transferred',
    transfer_date = NEW.transfer_date
	WHERE animal_id = NEW.animal_id;

DELIMITER $$
CREATE TRIGGER update_animal_transfer
BEFORE UPDATE ON animals
FOR EACH ROW
BEGIN
	    SET NEW.status = 'Transferred';
		SET NEW.transfer_date = NOW();
END; $$
DELIMITER ; 