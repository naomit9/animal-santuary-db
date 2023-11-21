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