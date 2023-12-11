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