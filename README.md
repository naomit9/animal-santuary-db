# Animal Sanctuary - SQL Project

## Purpose
* To design, build, and document a MySQL database system 
* To cover various database-related concepts and practices, including views, triggers, stored procedures, functions, normalization, data types, keys, and constraints.

## Feature 1: 
If an animal joins or leaves the sanctuary, how can you make it easy to update all necessary tables?

### Goal
To design a database that handles status updates, arrival and transfer dates.

[View](./create.sql)
Table:  `animals`
Stores information of each animal at the sanctuary

Table:  `status`
Stores information of animal status ‘Active’, or ‘Transferred’

Table:  `arrival`
Stores information of when the animal arrives at the sanctuary

Table:  `transfer`
Stores information of when the animal being transferred and its new location

### View: animal_status_view
[View](/views.sql)
This view represents the status of all the animals at the sanctuary without having to open multiple tables.
This view combines information from the four tables: animals, arrival, transfer and status

### Triggers: update_animal_transfer update_animal_arrival
[View](./triggers.sql)
This trigger activates before a new record is inserted into the `transfer` or `arrival` table and automatically updates the status_id in the `animals` table

### Stored Function: calculate_stay_duration
[View](./stored-function.sql)
This function calculates how long an animal stays at the sanctuary before leaving by taking in two dates and returning an integer

This stored function takes in transfer_date and arrival_date as two parameters, calculates the difference, and returns a number of days.

I used DATEDIFF() to calculate the difference between transfer_date and arrival_date 

If the transfer_date is NULL, it means the animal is still staying at the sanctuary, it will take in the current date.


=====================================================
## Feature 2:
The animal sanctuary is open to the public within certain hours, excluding certain holidays. How can we generate a calendar that shows when the sanctuary open?

### Goal: 
To generate a schedule for a particular date and display whether it’s a holiday or not.

[View](./views.sql)
Table:  `operating_hours`
Stores information of days of the week and open/close time

Table:  `holidays`
Stores information of holiday names and dates

Table:  `schedule`
Stores the dates that are imported into the system

### View schedule_view
[View](./views.sql)
This view represents a schedule with operating hours and holidays.
This view combines data from the three tables operating_hours, holidays and schedule.

### Stored Function: GetSanctuaryStatus
[View](./stored-function.sql)
This function takes in a date parameter and checks whether the date is associated with a holiday or operating hours. 

It retrieves information about the schedule from the schedule table and saves a result to the status variable.


