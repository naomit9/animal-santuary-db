/* FEATURE 1
This script is used to populate all of the Tables in the Database. 

NOTE: FEATURE 2 SEE BELOW*/

/* Script to populate ANIMALS table */
INSERT INTO animals VALUES (101, 'Dumbo', '2022-10-23', null , 1);
INSERT INTO animals VALUES (102, 'Fuzzy', '2021-11-09', null, 1);
INSERT INTO animals VALUES (103, 'Berry','2023-02-01', null, 1);
INSERT INTO animals VALUES (104, 'Bernard', '2019-12-01', '2020-12-31', 3);
INSERT INTO animals VALUES (105, 'Cray-cray', '2023-05-05', null, 1);
INSERT INTO animals VALUES (106, 'Gigi', '2018-12-03', '2020-12-31', 3);
INSERT INTO animals VALUES (107, 'Marlow',  '2019-10-27', '2020-12-31', 3);
INSERT INTO animals VALUES (108, 'Tikki',  '2022-10-23', '2020-12-31' , 3);
INSERT INTO animals VALUES (109, 'Lucky', '2021-11-09', '2020-12-31', 3);
INSERT INTO animals VALUES (110, 'Nicholas','2023-02-01', null, 1);
INSERT INTO animals VALUES (111, 'Fluffy',  '2019-12-01', '2020-12-31', 3);
INSERT INTO animals VALUES (112, 'Buddy',  '2023-05-05', null, 1);
INSERT INTO animals VALUES (113, 'Scrappy', '2018-12-03', '2020-12-31', 3);
INSERT INTO animals VALUES (114, 'Snoopy',  '2019-10-27', '2020-12-31', 3);


/* Script to populate ANIMAL_STATUS table */
INSERT INTO animal_status VALUES (1, 'Active');
INSERT INTO animal_status VALUES (2, 'Died');
INSERT INTO animal_status VALUES (3, 'Transferred');


/* Script to populate TRANSFER table */
INSERT INTO transfer VALUES (1, 104,'Bernard', '2020-12-31', 3, 'Chicago Zoo');
INSERT INTO transfer VALUES (2, 106, 'Blue', '2020-12-31', 3, 'Chicago Zoo');
INSERT INTO transfer VALUES (3, 107, 'Marlow', '2020-12-31', 3, 'Chicago Zoo');

/* Script to populate ARRIVAL table */ /**/
INSERT INTO arrival VALUES(1, 101, '2022-10-23', 'Dumbo', 1);
INSERT INTO arrival VALUES(2, 102,  '2021-11-09', 'Fuzzy', 1);
INSERT INTO arrival VALUES(3, 103,  '2021-11-09', 'Berry', 1);
INSERT INTO arrival VALUES(4, 105, '2021-11-09', 'Cray-cray', 1);
-------------------------------------------------------------------------------------------------------

/* FEATURE 2
This script is used to populate all of the Tables in the Database. */

INSERT INTO operating_hours VALUES (1, 'Monday', '09:00:00', '17:00:00' );
INSERT INTO operating_hours VALUES (2, 'Tuesday', '09:00:00', '17:00:00' );
INSERT INTO operating_hours VALUES (3, 'Wednesday', '09:00:00', '17:00:00' );
INSERT INTO operating_hours VALUES (4, 'Thursday', '09:00:00', '17:00:00' );
INSERT INTO operating_hours VALUES (5, 'Friday', '09:00:00', '17:00:00' );

INSERT INTO holidays VALUES (1, 'New Year', '2024-01-01');
INSERT INTO holidays VALUES (2, 'Family Day', '2024-02-20');
INSERT INTO holidays VALUES (3, 'Good Friday', '2024-04-07');
INSERT INTO holidays VALUES (4, 'Easter Monday', '2024-04-10');
INSERT INTO holidays VALUES (5, 'Victoria Day', '2024-05-22');
INSERT INTO holidays VALUES (6, 'Canada Day', '2024-07-01');
INSERT INTO holidays VALUES (7, 'Labour Day', '2024-09-04');
INSERT INTO holidays VALUES (8, 'Thanksgiving', '2024-10-09');
INSERT INTO holidays VALUES (9, 'Christmas', '2024-12-25');
INSERT INTO holidays VALUES (10, 'Boxing Day', '2024-12-26');



INSERT INTO schedule VALUES (100, 2, null, '2024-12-24', '09:00:00', '17:00:00');
INSERT INTO schedule VALUES (101, null, 9, '2024-12-25', null, null);
INSERT INTO schedule VALUES (102, null, 10, '2024-12-26', null, null);
INSERT INTO schedule VALUES (103, 5, null, '2024-12-27', '09:00:00', '17:00:00');
INSERT INTO schedule VALUES (104, 1, null, '2024-12-30', '09:00:00', '17:00:00');
INSERT INTO schedule VALUES (105, 2, null, '2024-12-31', '09:00:00', '17:00:00');
