### FEATURE 1:
If an animal joins or leaves the sanctuary, how can you make it easy to
update all necessary tables?

#### PROBLEM STATEMENT
The problem in feature 1 is to track and manage the arrival and departure of animals at the animal sanctuary. The challenge is to design a database that handles updates, such as, status, arrival date and departure date, when an animal joins or leaves the sanctuary. The goal is to create a system that is both normalized and user-friendly. It is important to maintain the data consistently when animals arrive or depart without errors or duplications.

#### ANIMAL TABLE
**This table stores information about each animal at the sanctuary**
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

| animal_id | name      | gender        | categories | animal_type | enclosure_type       | arrival_date | transfer_date | status      |
|-----------|-----------|---------------|------------|-------------|----------------------|--------------|---------------|-------------|
| 101       | Dumbo     | Male          | Mammal     | Elephant    | Elephant Enclosure   | 2022-10-23   |               | Active      |
| 102       | Fuzzy     | Female        | Bird       | Parrot      | Rainforest Enclosure | 2021-11-09   |               | Active      |
| 103       | Berry     | Male          | Reptile    | Snake       | Rainforest Enclosure | 2023-02-01   |               | Active      |
| 104       | Bernard   | Male          | Mammal     | Penguin     | Arctic Enclosure     | 2019-12-01   | 2020-12-31    | Transfered  |
| 105       | Cray-cray | Female        | Fish       | Stingray    | Aquarium             | 2023-05-05   |               | Active      |
| 106       | Gigi      | Female        | Mammal     | Giraffe     | Savannah Enclosure   | 2018-12-03   | 2020-12-31    | Transferred |
| 107       | Marlow    | Not Specified | Mammal     | Zebra       | Savannah Enclosure   | 2019-10-27   | 2020-12-31    | Transferred |



#### TRANSFER TABLE
**This table stores information about the animal being transferred to a different location**
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

| transfer_id  | animal_id  | name  | enclosure_id  | transfer_date  | status      | new_location |
|--------------|------------|-------|---------------|----------------|-------------|--------------|
|             1|         104|Bernard|        1005   |    2020-12-31  | Transferred |   Chicago Zoo|
|             2|         106| Blue  |          1001 |    2020-12-31  | Transferred | Chicago Zoo  |
|             3|         107| Marlow|          1002 |    2020-12-31  | Transferred | Chicago Zoo  |

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
The animal sanctuary is open to the public within certain hours, excluding certain holidays. How can we generate a calendar that shows when the sanctuary is open?

#### PROBLEM STATEMENT
The lack of a systemic and automated approach to communicate the open hours to the public leads to inconvenience and dissatisfaction. The challenge is to generate a calendar showcasing the sanctuary's opening hours while accounting for the holidays. The goal is to make this information more reliable and accessible to the public to enhance their experiences.

#### OPERATING HOURS TABLE
**This table stores information about days of the week and the opening and closing time at the sanctuary**
* _Columns_:
    * `days` (VARCHAR Primary Key)
    * `open_time` (TIME NOT NULL)
    * `close_time` (TIME NOT NULL)

#### HOLIDAYS TABLE
**This table stores information about the Ontario Statutory Holidays when the sanctuary is closed**
* _Columns_:
    * `holiday_date` (DATE Primary Key)
    * `holiday_name` (VARCHAR NOT NULL)
