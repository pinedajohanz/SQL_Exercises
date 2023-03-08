-- The new company that hired you instructed you to make a system for pet adoption. The tables included should be for pets and customers.

-- A customer can adopt many pets but a pet can only be adopted by one customer.
-- Include also the pet's details such as name, age, breed, and type of pet (Cat, dog, etc.)

-- create
CREATE TABLE customers (
  customers_id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(50) NOT NULL,
  PRIMARY KEY (customers_id) 
  -- cust_pet_id INT FOREIGN KEY 
);

-- create
CREATE TABLE pets (
  pet_id INT GENERATED ALWAYS AS IDENTITY,
  customers_id INT,
  name VARCHAR(50),
  age INTEGER NOT NULL,
  breed VARCHAR(100) NOT NULL,
  tp_pet VARCHAR(100) NOT NULL,
  PRIMARY KEY (pet_id),
  CONSTRAINT pet_cust_id FOREIGN KEY (customers_id) REFERENCES  customers(customers_id)
);

-- insert
INSERT INTO pets (name, age, breed, tp_pet) VALUES ('Oreo', '10', 'Husky', 'dog');
INSERT INTO pets (name, age, breed, tp_pet) VALUES ('Chewee', '7', 'Golden Retriever', 'dog');
INSERT INTO pets (name, age, breed, tp_pet) VALUES ('Choco', '5', 'Persian Cat', 'cat');

-- fetch 
SELECT * FROM pets;

-- insert
INSERT INTO customers (name) VALUES ('Robert');
INSERT INTO customers (name) VALUES ('Jogs');
INSERT INTO customers (name) VALUES ('Joshua');

-- fetch 
SELECT * FROM customers;


SELECT customers.name, pets.name, pets.age, pets.breed, pets.tp_pet FROM customers INNER JOIN pets ON  customers.customers_id = pets.pet_id;
