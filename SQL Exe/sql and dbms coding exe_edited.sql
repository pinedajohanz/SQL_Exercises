-- create
CREATE TABLE instructor (
  inst_id SERIAL PRIMARY KEY NOT NULL,
  firstname VARCHAR(50) NOT NULL,
  middleinitial VARCHAR(1),
  lastname VARCHAR(50) NOT NULL
);
ALTER SEQUENCE instructor_inst_id_seq MINVALUE 0;
ALTER SEQUENCE instructor_inst_id_seq RESTART WITH 0;

-- insert
INSERT INTO instructor (firstname, middleinitial, lastname) VALUES ('Jive', 'F', 'Monte');
INSERT INTO instructor (firstname, middleinitial, lastname) VALUES ('Jose', 'J', 'Rizal');

CREATE TABLE class (
  class_code SERIAL PRIMARY KEY NOT NULL,
  class_name VARCHAR(50) NOT NULL,
  location VARCHAR(50) NOT NULL,
  inst_id INT REFERENCES instructor(inst_id)
);
ALTER SEQUENCE class_class_code_seq MINVALUE 0;
ALTER SEQUENCE class_class_code_seq RESTART WITH 0;

-- insert
INSERT INTO class (class_name, location) VALUES ('Kindness' ,'Block 1');
INSERT INTO class (class_name, location) VALUES ('Joy' ,'Block 2');
INSERT INTO class (class_name, location) VALUES ('Temperance' ,'Block 3');
INSERT INTO class (class_name, location) VALUES ('Memory' ,'Block 4');

UPDATE class SET inst_id = 0 WHERE class_code = 1;
UPDATE class SET inst_id = 1 WHERE class_code = 0;


-- create
CREATE TABLE student (
  student_id SERIAL PRIMARY KEY NOT NULL,
  firstname VARCHAR(50) NOT NULL,
  middleinitial VARCHAR(1),
  lastname VARCHAR(50) NOT NULL,
  age INTEGER NOT NULL,
  gender VARCHAR(1) NOT NULL,
  class_code INT REFERENCES class(class_code)
);

ALTER SEQUENCE student_student_id_seq MINVALUE 0;
ALTER SEQUENCE student_student_id_seq RESTART WITH 0;

-- insert
INSERT INTO student (firstname, middleinitial, lastname, age, gender) VALUES ('Jonape', 'F', 'Cabug', '26', 'F');
INSERT INTO student (firstname, middleinitial, lastname, age, gender) VALUES ('Cherlotte', 'J', 'Nisperos', '27', 'M');

UPDATE student SET firstname = 'Charlotte' WHERE firstname = 'Cherlotte';

UPDATE student SET class_code = 0 WHERE student_id = 1;
UPDATE student SET class_code = 1 WHERE student_id = 0;


DELETE FROM class WHERE inst_id IS NULL;

-- fetch 
SELECT * FROM instructor;
SELECT * FROM class ORDER BY class_code;
SELECT * FROM student ORDER BY student_id;




