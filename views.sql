/* FEATURE 1
##### VIEW
To view the status of all the animals at the sanctuary without having to open multiple tables
*/

CREATE VIEW animal_status_view
AS
SELECT 
	a.animal_id,
    a.name,
    a.arrival_date,
    a.status_id, 
    s1.animal_status AS current_status,
    t.transfer_id,
    t.transfer_date 
    t.new_location
    s2.animal_status AS transfer_status
FROM 
	animals a
JOIN 
	status s1 ON a.status_id = s1.status_id
LEFT JOIN 
	transfer t ON a.animal_id = t.animal_id
LEFT JOIN
    status s2 ON t.status_id = s2.status_id;



/* FEATURE 2
##### VIEW
To view a schedule with the operating hours and the holidays
 */
CREATE VIEW schedule_view
AS
SELECT
    s.schedule_id,
    s.schedule_date,
    oh.days_of_week,
    oh.open_time AS 'operating_hours_open_time',
    oh.close_time AS 'operating_hours_close_time',
    h.holiday_name,
    s.open_time AS 'scheduled_open_time',
    s.close_time AS 'scheduled_close_time'
FROM
    schedule s
LEFT JOIN
    operating_hours oh ON oh.operating_hours_id = s.operating_hours_id
LEFT JOIN
    holidays h ON s.holiday_id = h.holiday_id;