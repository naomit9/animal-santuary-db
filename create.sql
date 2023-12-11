/*FEATURE 1: 
This script is used to create the initial tables in the database to support the first problem

NOTE: FEATURE 2 SEE BELOW
*/

/* 
creates a table ANIMALS with proper constraints, datatypes, and key declarations. 
store information about each animal at the sanctuary.
primary key cannot be null.
animal_id is the primary key used.
*/

CREATE TABLE animals (	
	animal_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    animal_name VARCHAR(50) NOT NULL,
	gender_id INT,
	categories_id INT,
	animal_type_id INT,
	enclosure_type VARCHAR(50) NOT NULL,
	arrival_date DATE NOT NULL,
    transfer_date DATE,
	status_id INT,
    CONSTRAINT FK_gender FOREIGN KEY (gender_id) REFERENCES gender(gender_id),
	CONSTRAINT FK_categories FOREIGN KEY (categories_id) REFERENCES categories(categories_id),
	CONSTRAINT FK_animal_type FOREIGN KEY (animal_type_id) REFERENCES animal_type(animal_type_id),
	CONSTRAINT FK_status FOREIGN KEY (status_id) REFERENCES animal_status(status_id)
);

/* 
creates a table ENCLOSURES with datatypes, and key declarations. 
store information about each enclosure at the sanctuary.
primary key cannot be null.
enclosure_id is the primary key used.
no foreign key used.
*/

CREATE TABLE enclosures (	
	enclosure_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    enclosure_type VARCHAR(50) NOT NULL,
	enclosure_description TEXT
);

/* 
creates a table GENDER with datatypes, and key declarations. 
store information about the animal gender at the sanctuary.
primary key cannot be null.
gender_id is the primary key used.
no foreign key used.
check constraint for gender to ensure that gender is one of a predefined set of values.
*/

CREATE TABLE gender (	
	gender INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    gender_type VARCHAR(50) NOT NULL,
    CONSTRAINT CHK_Gender CHECK (gender IN ('Male', 'Female', 'Not Specified'))
);

/* 
creates a table CATEGORIES with datatypes, and key declarations. 
store information about the animal categories at the sanctuary.
primary key cannot be null.
categories_id is the primary key used.
no foreign key used.
*/

CREATE TABLE categories (	
	categories_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    categories_type VARCHAR(50) NOT NULL
);

/* 
creates a table ANIMAL TYPE with datatypes, and key declarations. 
store information about the type of animal at the sanctuary.
primary key cannot be null.
animal_type_id is the primary key used.
no foreign key used.
*/

CREATE TABLE animal_type (	
	animal_type_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    animal_type_description VARCHAR(50) NOT NULL
);

/* 
creates a table ANIMAL STATUS with datatypes, and key declarations. 
store information about the status of animal at the sanctuary.
primary key cannot be null.
status_id is the primary key used.
no foreign key used.
*/

CREATE TABLE status (	
	status_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    animal_status VARCHAR(50) NOT NULL,
    CONSTRAINT CHK_status CHECK (animal_status IN ('Active', 'Died', 'Transferred', 'Adopted'))
);

/* 
creates a table TRANSFER with proper constraints, datatypes, and key declarations. 
store information about the information of animal leaving the sanctuary.
primary key cannot be null.
transfer_id is the primary key used.
animal_id and enclosure_id are the foreign keys.
*/

CREATE TABLE transfer (	
	transfer_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    animal_id INT,
    enclosure_id INT,
    animal_name VARCHAR(50) NOT NULL,
    transfer_date DATE NOT NULL,
    status_id int,
    new_location VARCHAR(50),
    CONSTRAINT CHK_status CHECK (status_id IN ('Active', 'Died', 'Transferred', 'Adopted')),
	CONSTRAINT FK_animal_transfer FOREIGN KEY (animal_id) REFERENCES animals(animal_id),
	CONSTRAINT FK_enclosure_transfer FOREIGN KEY (enclosure_id) REFERENCES enclosures(enclosure_id),
	CONSTRAINT FK_status_transfer FOREIGN KEY (status_id) REFERENCES animal_status(status_id)
);


CREATE TABLE arrival (	
	arrival_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    animal_id INT,
    enclosure_id INT,
    animal_name VARCHAR(50) NOT NULL,
    arrival_date DATE NOT NULL,
    status_id INT,
    CONSTRAINT CHK_status CHECK (status_id IN ('Active', 'Died', 'Transferred', 'Adopted')),
	CONSTRAINT FK_animal_arrival FOREIGN KEY (animal_id) REFERENCES animals(animal_id),
	CONSTRAINT FK_enclosure_arrival FOREIGN KEY (enclosure_id) REFERENCES enclosures(enclosure_id),
	CONSTRAINT FK_status_arrival FOREIGN KEY (status_id) REFERENCES animal_status(status_id)
);
----------------------------------------------------------------------------------------------------
/*FEATURE 2: 
This script is used to create the initial tables in the database to support the second problem
*/

CREATE TABLE operating_hours (
    operating_hours_id INT,
    days_of_week VARCHAR(50) PRIMARY KEY,
    open_time TIME NOT NULL,
    close_time TIME NOT NULL
);

CREATE TABLE holidays (
    holiday_id INT,
    holiday_date DATE PRIMARY KEY,
    holiday_name VARCHAR(50) NOT NULL
);

CREATE TABLE schedule (
    schedule_id INT,
    operating_hours_id INT,
    holiday_id INT,
    open_time TIME NOT NULL,
    close_time TIME NOT NULL
);