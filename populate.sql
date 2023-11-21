/* FEATURE 1
This script is used to populate all of the Tables in the Database. */

/* Script to populate ANIMALS table */
INSERT INTO animals VALUES (101, 'Dumbo', 'Male', 'Mammal', 'Elephant', 'Elephant Enclosure', '2022-10-23', 'Active');
INSERT INTO animals VALUES (102, 'Fuzzy', 'Female', 'Bird', 'Parrot', 'Rainforest Enclosure', '2021-11-09', 'Active');
INSERT INTO animals VALUES (103, 'Berry', 'Male', 'Reptile', 'Snake', 'Rainforest Enclosure', '2023-02-01', 'Active');
INSERT INTO animals VALUES (104, 'Bernard', 'Male', 'Mammal', 'Penguin', 'Arctic Enclosure', '2019-12-01', 'Transfered');
INSERT INTO animals VALUES (105, 'Cray-cray', 'Female', 'Fish', 'Stingray', 'Aquarium', '2023-05-05', 'Active');
INSERT INTO animals VALUES (106, 'Gigi', 'Female', 'Mammal', 'Giraffe', 'Savannah Enclosure', '2018-12-03', 'Tranferred');
INSERT INTO animals VALUES (107, 'Marlow', 'Not Specified', 'Mammal', 'Zebra', 'Savannah Enclosure', '2019-10-27', 'Tranferred');


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


/* Script to populate ANIMAL_STATUS table */
INSERT INTO animal_status VALUES (1, 'Active');
INSERT INTO animal_status VALUES (2, 'Died');
INSERT INTO animal_status VALUES (3, 'Transferred');


/* Script to populate TRANSFER table */
INSERT INTO transfer_table VALUES (1, 104, 'Bernard', 1005, '2020-12-31', 'Transferred', 'Chicago Zoo');
INSERT INTO transfer_table VALUES (2, 106, 'Blue', 1001, '2020-12-31', 'Transferred', 'Chicago Zoo');
INSERT INTO transfer_table VALUES (3, 107, 'Marlow', 1002, '2020-12-31', 'Transferred', 'Chicago Zoo');
