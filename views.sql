/* FEATURE 1
##### VIEW
To view all the active animals who come to the sanctuary in 2023.
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
To take in the current day of the week and display the status of the sanctuary operating hours based on open, close or holiday.
 */

