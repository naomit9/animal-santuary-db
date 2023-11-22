/* FEATURE 1
##### VIEW
To view all the active animals who come to the sanctuary in 2023.
*/

CREATE VIEW animals_2023
AS
SELECT animal_id, animal_name, animal_type, enclosure_type
FROM animals
WHERE arrival_date LIKE '%2023%' 
AND animal_status = 'Active';




/* FEATURE 2
##### VIEW
To take in the current day of the week and display the status of the sanctuary operating hours based on open, close or holiday.
 */

