/* FEATURE 1 
##### TRIGGER 1: UPDATE THE ANIMALS TABLE WHEN AN ANIMAL ARRIVES AT THE SANCTUARY
When a new animal arrives, a new record is inserted in the `animals` table and this event creates a trigger to automatically update the status column in the `animals` table.
*/

DELIMITER $$
CREATE TRIGGER after_animals_insert
AFTER INSERT
ON animals
FOR EACH ROW
BEGIN
        IF NEW.status IS NULL OR NEW.status = '' THEN
	    UPDATE animals
	    SET status = 'Active'
	    WHERE animal_id = NEW.animal.id;
END IF; 
END; $$
DELIMITER ;  

/*
##### TRIGGER 2: UPDATE THE TRANSFER TABLE WHEN AN ANIMAL LEAVES THE SANCTUARY
When an animal leaves, their record is inserted in the `transfer` table and this event creates a trigger to automatically update the status column to 'Transferred' in the `animal` table
and at the same time, update the transfer_date column in the animals table.
*/
DELIMITER $$
CREATE TRIGGER after_transfer_insert
AFTER INSERT
ON transfer
FOR EACH ROW
BEGIN
	    UPDATE animals
	    SET status = 'Transferred'
	    WHERE animal_id = OLD.animal.id; /*UPDATE THE TRANSFER DATE ALSO*/
END; $$
DELIMITER ; 