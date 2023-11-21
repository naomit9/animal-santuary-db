/*FEATURE 1: 
This script is used to create the initial tables in the database to support the first problem
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
	gender VARCHAR(50) NOT NULL,
	categories VARCHAR(50) NOT NULL,
	animal_type_description VARCHAR(50),
	enclosure_type VARCHAR(50) NOT NULL,
	arrival_date DATE NOT NULL,
    transfer_date DATE,
	animal_status VARCHAR(50),
    CONSTRAINT PK_animal PRIMARY KEY (animal_id) REFERENCES animals(animal_id),
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

CREATE TABLE animal_status (	
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
    animal_id INT FOREIGN KEY,
    enclosure_id INT FOREIGN KEY,
    animal_name VARCHAR(50) NOT NULL,
    transfer_date DATE NOT NULL,
    animal_status VARCHAR(50) NOT NULL,
    new_location VARCHAR(50),
    CONSTRAINT CHK_status CHECK (animal_status IN ('Active', 'Died', 'Transferred', 'Adopted')),
    CONSTRAINT FK_animal FOREIGN KEY (animal_id) REFERENCES animals(animal_id),
	CONSTRAINT FK_enclosure FOREIGN KEY (enclosure_id) REFERENCES transfer(enclosure_id)
);
