### FEATURE 1:
If an animal joins or leaves the sanctuary, how can you make it easy to
update all necessary tables?

#### PROBLEM STATEMENT
The problem in feature 1 is to track and manage the arrival and departure of animals at the animal sanctuary. The challenge is to design a database that handles updates when an animal joins or leaves the sanctuary and tracks the history of the animal’s past enclosures. The goal is to create a system that is both normalized and user-friendly. It is important to maintain the data consistently when animals arrive or depart without errors or duplications.

#### ANIMAL TABLE
* _Columns_:
    * `animal_id` (Primary Key)
    * `animal_name` (VARCHAR)
    * `animal_gender` ('Male', 'Female', 'Not Specified')
	* `animal_categories` (VARCHAR)
	* `animal_type_description` (VARCHAR)
	* `enclosure_type` (VARCHAR)
	* `arrival_date` (DATE)
    * `transfer_date` (DATE, NULLABLE)
	* `animal_status` ('Active', 'Died', 'Transferred', 'Adopted')
* _Constraints_:
    * Ensure `animal_gender` and `animal_status` must be the predefined values.

#### TRANSFER TABLE
* _Columns_:
    * `transfer_id` (Primary Key)
    * `animal_id` (Foreign Key)
    * `animal_name` (VARCHAR)
	* `enclosure_id` (Foreign Key)
    * `transfer_date` (DATE)
	* `animal_status` ('Active', 'Died', 'Transferred', 'Adopted')
    * `new_location` (VARCHAR)
* _Constraints_:
    * Ensure foreign key `animal_id` is referencing to the `animal_id` in `animals` table
    * Ensure foreign key `enclosure_id`  is referencing to the `enclosure_id` in the `enclorsures` table
    * Ensure `animal_status` must be the predefined values.


##### TRIGGER 1: UPDATE THE ANIMALS TABLE WHEN AN ANIMAL ARRIVES AT THE SANCTUARY
* Animal Status Triggered
    * Triggered when a new record is inserted in the `animals` table
    * Automatically update the status column to `Active` for newly arrived animals
* Justification:
    * To ensure real-time updates to the `status` when a new animal arrives, so it reduces manual data entry, reduces human error, and increases data accuracy.

##### TRIGGER 2: UPDATE THE TRANSFER TABLE WHEN AN ANIMAL LEAVES THE SANCTUARY
* Animal Status Triggered
    * Triggered when a record is inserted in the `transfer` table
    * Automatically update the status column to `Transferred` for animals that are leaving
    * Automatically insert the `transfer_date` in the `animals` table, this column is set as `NULL` 
* Justification:
    * To ensure real-time updates the `status` and `transfer_date` when an animal leaves. This centralized control over updating the `status` and `transfer_date` ensures accuracy and consistency.


##### VIEW
To view all the active animals who come to the sanctuary in 2023.

-----

### FEATURE 2:
The animal sanctuary is open to the public within certain hours,excluding certain holidays. How can we generate a calendar that shows when the sanctuary is open?
