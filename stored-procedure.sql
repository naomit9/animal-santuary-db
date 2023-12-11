/*STORED PROCEDURE FOR FEATURE 1
to calculate the stay duration for a given animal id.
*/

DELIMITER $$

CREATE PROCEDURE CalculateStayDuration (IN animal_id INT, OUT stayDuration INT)
BEGIN
    /*Declare variables*/
    DECLARE arrival_date DATE;
    DECLARE transfer_date DATE;

    /*Get the arrive date*/
    SELECT arrival_date INTO arrivalDate
    FROM animals
    WHERE animal_id = animalID

    /*Get the transfer date*/
    SELECT MAX(transfer_date) INTO transferDate
    FROM transfer
    WHERE animal_id = animalID

    /*Get the duration length*/
    SET stayDuration = DATEDIFF(transferDate, arrivalDate);

END $$
DELIMITER ;

/*Call the stored procedure*/
CALL CalculateStayDuration (1, @duration); /*@duration is a user-defined variable*/

/*Display the value of the duration*/
SELECT @duration AS stayDuration;