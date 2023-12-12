/*STORED FUNCTION FOR FEATURE 1
This function takes in the arrival_date and the transfer_date as parameters and calculates the difference 
*/
DELIMITER //
CREATE FUNCTION calculate_stay_duration(arrival_date DATE, transfer_date DATE)
RETURNS INT
BEGIN   
    DECLARE duration INT;

    /* if the animal is still staying at the sanctuary, it will take in the current date. */
    IF transfer_date IS NULL THEN
        SET transfer_date = CURDATE();
    END IF;

    /* calculate the duration in days */
    SET duration = DATEDIFF(transfer_date, arrival_date);

    RETURN duration;

END //
DELIMITER ;


SELECT
	animal_id,
    arrival_date,
    transfer_date,
    calculate_stay_duration(transfer_date, arrival_date) AS duration
FROM animals;

/*=================================================================================================================================================*/


/* STORED FUNCTION FOR FEATURE 2
This function takes in a date parameter and checks whether the date is associated with a holiday or operating hours
*/

BEGIN
    DECLARE status VARCHAR(50);

    SELECT
        CASE
            WHEN holiday_id IS NOT NULL THEN 'Holiday'
            WHEN operating_hour_id IS NOT NULL THEN 'Operating Hours'
            ELSE 'No Schedule Information'
        END
    INTO status
    FROM SCHEDULE
    WHERE schedule_date = selected_date
	LIMIT 1;
    
    RETURN status;
END

/*this select statement receives the selected_date parameter, and retrieves information about the schedule from the schedule table and assigns a result to the status variable*/


SELECT GetSanctuaryStatus('2024-12-24') AS sanctuary_status;