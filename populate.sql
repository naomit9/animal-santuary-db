/* FEATURE 1
This script is used to populate all of the Tables in the Database. 

NOTE: FEATURE 2 SEE BELOW*/

/* Script to populate ANIMALS table */
INSERT INTO animals VALUES (101, 'Dumbo', 1, 1, 1, 1004, '2022-10-23', null , 1);
INSERT INTO animals VALUES (102, 'Fuzzy', 2, 2, 2, 1002, '2021-11-09', null, 1);
INSERT INTO animals VALUES (103, 'Berry', 1, 3, 3, 1002,'2023-02-01', null, 1);
INSERT INTO animals VALUES (104, 'Bernard', 1, 1, 4, 1005, '2019-12-01', '2020-12-31', 3);
INSERT INTO animals VALUES (105, 'Cray-cray', 2, 5, 5, 1003, '2023-05-05', null, 1);
INSERT INTO animals VALUES (106, 'Gigi', 2, 1, 6, 1001, '2018-12-03', '2020-12-31', 3);
INSERT INTO animals VALUES (107, 'Marlow', 3, 1, 7, 1001, '2019-10-27', '2020-12-31', 3);
INSERT INTO animals VALUES (108, 'Tikki', 2, 5, 4, 1001, '2022-10-23', '2020-12-31' , 3);
INSERT INTO animals VALUES (109, 'Lucky', 3, 1, 2, 1003, '2021-11-09', '2020-12-31', 3);
INSERT INTO animals VALUES (110, 'Nicholas', 2, 2, 3, 1004,'2023-02-01', null, 1);
INSERT INTO animals VALUES (111, 'Fluffy', 1, 3, 4, 1006, '2019-12-01', '2020-12-31', 3);
INSERT INTO animals VALUES (112, 'Buddy', 1, 3, 5, 1006, '2023-05-05', null, 1);
INSERT INTO animals VALUES (113, 'Scrappy', 3, 1, 6, 1001, '2018-12-03', '2020-12-31', 3);
INSERT INTO animals VALUES (114, 'Snoopy', 3, 1, 7, 1002, '2019-10-27', '2020-12-31', 3);

/* Script to populate ENCLOSURES table */
INSERT INTO enclosures VALUES (1001, 'Savannah Enclosure', 'Suitable for animals that inhabit grasslands, such as zebras, giraffes, and antelopes.');
INSERT INTO enclosures VALUES (1002, 'Rainforest Enclosure', 'Suitable for animals like primates, reptiles, and tropical birds.');
INSERT INTO enclosures VALUES (1003, 'Aquarium', 'Suitable for aquatic animals, including fish, marine mammals, and invertebrates.');
INSERT INTO enclosures VALUES (1004, 'Elephant Enclosure', 'A spacious area with features like mud baths and watering holes for elephants.');
INSERT INTO enclosures VALUES (1005, 'Arctic Enclosure', 'An enclosure with a cold climate and water features, designed for penguins.');
INSERT INTO enclosures VALUES (1006, 'Primate Enclosure', 'Suitable for primates like monkeys and apes.');


/* Script to populate ANIMAL_GENDER table */
INSERT INTO animal_gender VALUES (1, 'Male');
INSERT INTO animal_gender VALUES (2, 'Female');
INSERT INTO animal_gender VALUES (3 , 'Not Specified');


/* Script to populate ANIMAL_CATEGORIES table */
INSERT INTO animal_categories VALUES (1, 'Mammal');
INSERT INTO animal_categories VALUES (2, 'Bird');
INSERT INTO animal_categories VALUES (3, 'Reptile');
INSERT INTO animal_categories VALUES (4, 'Amphibian');
INSERT INTO animal_categories VALUES (5, 'Fish');
INSERT INTO animal_categories VALUES (6, 'Insect');


/* Script to populate ANIMAL_TYPE table */
INSERT INTO animal_type VALUES (1,'Elephant');
INSERT INTO animal_type VALUES (2, 'Parrot');
INSERT INTO animal_type VALUES (3, 'Snake');
INSERT INTO animal_type VALUES (4, 'Penguin');
INSERT INTO animal_type VALUES (5, 'Stingray');
INSERT INTO animal_type VALUES (6, 'Giraffe');
INSERT INTO animal_type VALUES (7, 'Zebra');


/* Script to populate ANIMAL_STATUS table */
INSERT INTO animal_status VALUES (1, 'Active');
INSERT INTO animal_status VALUES (2, 'Died');
INSERT INTO animal_status VALUES (3, 'Transferred');


/* Script to populate TRANSFER table */
INSERT INTO transfer VALUES (1, 104, 1005,'Bernard', '2020-12-31', 3, 'Chicago Zoo');
INSERT INTO transfer VALUES (2, 106, 1001,'Blue', '2020-12-31', 3, 'Chicago Zoo');
INSERT INTO transfer VALUES (3, 107, 1002,'Marlow', '2020-12-31', 3, 'Chicago Zoo');

/* Script to populate ARRIVAL table */ /**/
INSERT INTO arrival VALUES(1, 101, 1004, '2022-10-23', 'Dumbo', 1);
INSERT INTO arrival VALUES(2, 102, 1002, '2021-11-09', 'Fuzzy', 1);
INSERT INTO arrival VALUES(3, 103, 1002, '2021-11-09', 'Berry', 1);
INSERT INTO arrival VALUES(4, 105, 1003, '2021-11-09', 'Cray-cray', 1);
-------------------------------------------------------------------------------------------------------

/* FEATURE 2
This script is used to populate all of the Tables in the Database. */

