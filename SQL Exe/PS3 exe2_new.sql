-- The new company that hired you instructed you to make a system for pet adoption. The tables included should be for pets and customers.

-- A customer can adopt many pets but a pet can only be adopted by one customer.
-- Include also the pet's details such as name, age, breed, and type of pet (Cat, dog, etc.)

-- create
CREATE TABLE customers (
  customers_id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL
  -- cust_pet_id INT FOREIGN KEY 
);

-- create
CREATE TABLE pets (
  pet_id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(50),
  age INTEGER NOT NULL,
  breed VARCHAR(100) NOT NULL,
  tp_pet VARCHAR(100) NOT NULL
  -- customers_id INT REFERENCES  customers(customers_id)
);

CREATE TABLE pets_new (
  customers_id INT REFERENCES customers(customers_id),
  pet_id INT REFERENCES pets(pet_id)
);


-- insert
INSERT INTO pets (name, age, breed, tp_pet) VALUES ('Oreo', '9', 'Husky', 'dog'); --1
INSERT INTO pets (name, age, breed, tp_pet) VALUES ('Chewee', '7', 'Golden Retriever', 'dog'); --2
INSERT INTO pets (name, age, breed, tp_pet) VALUES ('Choco', '5', 'Persian Cat', 'cat'); --3
INSERT INTO pets (name, age, breed, tp_pet) VALUES ('Mallows', '3', 'Chuahua', 'dog'); --4

-- insert
INSERT INTO customers (name) VALUES ('Robert'); --1
INSERT INTO customers (name) VALUES ('Jogs'); --2
INSERT INTO customers (name) VALUES ('Joshua'); --3

INSERT INTO pets_new (customers_id, pet_id) VALUES ('1', '2');
INSERT INTO pets_new (customers_id, pet_id) VALUES ('1', '3');
INSERT INTO pets_new (customers_id, pet_id) VALUES ('2', '1');
INSERT INTO pets_new (customers_id, pet_id) VALUES ('2', '4');

-- fetch 
-- fetch 
SELECT * FROM pets;

SELECT * FROM customers;

SELECT customers.name, pets.name, pets.age, pets.breed, pets.tp_pet FROM pets_new INNER JOIN customers USING (customers_id) INNER JOIN  pets USING (pet_id);

--SELECT customers.name, pets.name, pets.age, pets.breed, pets.tp_pet FROM customers INNER JOIN pets ON  customers.customers_id = pets.pet_id;

