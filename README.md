### FEATURE 1:
If an animal joins or leaves the sanctuary, how can you make it easy to
update all necessary tables?

#### PROBLEM STATEMENT
The problem in feature 1 is to track and manage the arrival and departure of animals at the animal sanctuary. The challenge is to design a database that handles updates, such as, status, arrival date and departure date, when an animal joins or leaves the sanctuary. The goal is to create a system that is both normalized and user-friendly. It is important to maintain the data consistently when animals arrive or depart without errors or duplications.

#### ANIMAL TABLE
**This table stores information about each animal at the sanctuary**

_[How table is created](./create.sql)_

_[How table is populated](./populate.sql)_
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

#### SAMPLE TABLE

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

_[How table is created](./create.sql)_

_[How table is populated](./populate.sql)_

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

#### SAMPLE TABLE

| transfer_id  | animal_id  | name  | enclosure_id  | transfer_date  | status      | new_location |
|--------------|------------|-------|---------------|----------------|-------------|--------------|
|             1|         104|Bernard|        1005   |    2020-12-31  | Transferred |   Chicago Zoo|
|             2|         106| Blue  |          1001 |    2020-12-31  | Transferred | Chicago Zoo  |
|             3|         107| Marlow|          1002 |    2020-12-31  | Transferred | Chicago Zoo  |

#### TRIGGER 1: UPDATE THE ANIMALS TABLE WHEN AN ANIMAL ARRIVES AT THE SANCTUARY [See file](./triggers.sql)
* Animal Status Triggered
    * Triggered when a new record is inserted in the `animals` table
    * Automatically update the status column to `Active` for newly arrived animals
* Justification:
    * To ensure real-time updates to the `status` when a new animal arrives, so it reduces manual data entry, reduces human error, and increases data accuracy.

#### TRIGGER 2: UPDATE THE TRANSFER TABLE WHEN AN ANIMAL LEAVES THE SANCTUARY [See file](./triggers.sql)
* Animal Status Triggered
    * Triggered when a record is inserted in the `transfer` table
    * Automatically update the status column to `Transferred` for animals that are leaving
    * Automatically insert the `transfer_date` in the `animals` table, this column is set as `NULL` 
* Justification:
    * To ensure real-time updates the `status` and `transfer_date` when an animal leaves. This centralized control over updating the `status` and `transfer_date` ensures accuracy and consistency.


#### VIEW - [See file](./views.sql)
To view all the active animals who come to the sanctuary in 2023.

------------------------------------------------------------------------------------------------------------------------------

### FEATURE 2:
The animal sanctuary is open to the public within certain hours, excluding certain holidays. How can we generate a calendar that shows when the sanctuary is open?

#### PROBLEM STATEMENT
The aim is to generate a calendar showcasing the sanctuary's opening hours while accounting for the holidays. The goal is to develop a database schema and associated functionalities to efficiently manage and display the operating hours.

#### OPERATING HOURS TABLE
**This table stores information about days of the week and the opening and closing time at the sanctuary**
* _Columns_:
    * `operating_hour_id` (INT Primary Key)
    * `days_of_week` (VARCHAR)
    * `open_time` (TIME NOT NULL)
    * `close_time` (TIME NOT NULL)

#### SAMPLE TABLE: OPERATING HOURS

| operating_hour_id | days_of_week | open_time | close_time |   
|-------------------|--------------|-----------|------------|
| 1                 | Monday       | 9:00:00   | 16:00:00   |
| 2                 | Tuesday      | 9:00:00   | 16:00:00   |
| 3                 | Wednesday    | 9:00:00   | 16:00:00   |
| 4                 | Thursday     | 9:00:00   | 16:00:00   |
| 5                 | Friday       | 9:00:00   | 16:00:00   |
| 6                 | Saturday     | 9:00:00   | 16:00:00   |
| 7                 | Sunday       | 9:00:00   | 16:00:00   | 

#### HOLIDAYS TABLE
**This table stores information about the Ontario Statutory Holidays when the sanctuary is closed**
* _Columns_:
    * `holiday_id` (INT Primary Key)
    * `holiday_name` (VARCHAR NOT NULL)
    * `holiday_date` (DATE)

#### SAMPLE TABLE: HOLIDAYS

| holiday_id | holiday_name   | holiday_date |
|------------|----------------|--------------|
| 1          | New Year's Day | 2024-01-01   |
| 2          | Family Day     | 2024-02-20   |
| 3          | Good Friday    | 2024-04-07   |
| 4          | Easter Monday  | 2024-04-10   |
| 5          | Victoria Day   | 2024-05-22   |
| 6          | Canada Day     | 2024-07-01   |
| 7          | Labour Day     | 2024-09-04   |
| 8          | Thanksgiving   | 2024-10-09   |
| 9          | Christmas      | 2024-12-25   |
| 10         | Boxing Day     | 2024-12-26   |

#### VIEW: PUBLIC SCHEDULE [See file](./views.sql)
To take in the current day of the week, convert it into a string and use it to display the status of the sanctuary operating hours to either open, close or holiday.
* _Columns_:
    * `current_date` (DATE)
    * `status` ('Open', 'Closed', 'Holiday')
    * IF THE STATUS IS 'Open', the `open_time` and `close_time` will appear.
    * IF THE STATUS IS 'Closed' or 'Holiday', the `open_time` and `close_time` will **not** appear.

    * Ensure `status` must be the predefined values.

#### FOR EXAMPLE: PUBLIC SCHEDULE VIEW STATUS: OPEN

| current_date | status | open_time | close_time |
|--------------|--------|-----------|------------|
|   2023-11-21 | Open   | 9:00:00   | 16:00:00   |

#### FOR EXAMPLE: PUBLIC SCHEDULE VIEW STATUS: HOLIDAY OR CLOSED

| current_date | status |
|--------------|--------|
|   2023-12-25 | Closed |


#### TRIGGER: UPDATE THE SCHEDULE STATUS BEFORE INSERT INTO PUBLIC SCHEDULE VIEW [See file](./triggers.sql)
1. A trigger is created to call a function before each insert into the `public_schedule` view.
2. The function takes in the current date and runs it against the `holiday` table
3. Using conditional statements, the function will update the `status` column to either `open` or `closed` or `holiday`.
4. If it is not a holiday, the status will display 'Open'.
5. If it is a holiday, the status will display 'Holiday'.
6. If it is neither a holiday, nor a regular day, the status will display 'Closed'.

#### STORED FUNCTION: CALCULATE THE REMAINING HOURS THE ANIMAL SANCTUARY WILL HAVE UNTIL CLOSING TIME
* _Parameters_:
    * `close_time` (TIME NOT NULL)
* _Returns_: the remaining time as an INTERVAL data type
1. The function takes in one parameter, `close_time`, and subtracts the current time to get the remaining time.
2. If the current time is after the `close_time`, the INTERVAL will return 0.
