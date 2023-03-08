-- Create a basic database for a classroom system. The tables should include the student table, the teacher table, and a classroom table.

-- Teachers can have many classes but a class can only have one teacher.
-- The students can have many classes as well.
-- Apply normalization techniques


-- teachers one to many 
-- students one to many 
-- class one to one
CREATE TABLE classroom (
  classroom_id INTEGER PRIMARY KEY NOT NULL,
  subject VARCHAR(50) NOT NULL
  -- inst_id INT REFERENCES instructor(inst_id)
);
-- insert
INSERT INTO classroom (classroom_id, subject) VALUES ('0', 'Mathematics');
INSERT INTO classroom (classroom_id, subject) VALUES ('1', 'Software Development');
INSERT INTO classroom (classroom_id, subject) VALUES ('2', 'History');
INSERT INTO classroom (classroom_id, subject) VALUES ('3', 'Foreign Language');

CREATE TABLE teacher (
  teacher_id INT PRIMARY KEY NOT NULL,
  firstname VARCHAR(50) NOT NULL,
  lastname VARCHAR(50) NOT NULL
);
-- insert
INSERT INTO teacher (teacher_id, firstname, lastname) VALUES ('0', 'Jive', 'Monte');
INSERT INTO teacher (teacher_id, firstname, lastname) VALUES ('1', 'Jose', 'Rizal');

CREATE TABLE student (
  student_id INTEGER PRIMARY KEY NOT NULL,
  firstname VARCHAR(50) NOT NULL,
  lastname VARCHAR(50) NOT NULL,
  gender VARCHAR(1) NOT NULL
  -- class_code INT REFERENCES class(class_code)
);

CREATE TABLE student_new (
  student_id INTEGER REFERENCES student(student_id),
  classroom_id INT REFERENCES classroom(classroom_id)
);


CREATE TABLE teacher_new (
    teacher_id INT REFERENCES teacher(teacher_id),
    classroom_id INT REFERENCES classroom(classroom_id)
);

-- insert
INSERT INTO student (student_id, firstname, lastname, gender) VALUES ('0', 'Jonape', 'Cabug', 'F');
INSERT INTO student (student_id, firstname, lastname, gender) VALUES ('1', 'Cherlotte', 'Nisperos', 'M');
INSERT INTO student (student_id, firstname, lastname, gender) VALUES ('2', 'Cherry', 'Ricci', 'F');

INSERT INTO student_new (student_id, classroom_id) VALUES ('0', '1');
INSERT INTO student_new (student_id, classroom_id) VALUES ('0', '2');
INSERT INTO student_new (student_id, classroom_id) VALUES ('1', '0');
INSERT INTO student_new (student_id, classroom_id) VALUES ('1', '3');
INSERT INTO student_new (student_id, classroom_id) VALUES ('2', '2');
INSERT INTO student_new (student_id, classroom_id) VALUES ('2', '3');

INSERT INTO teacher_new (teacher_id, classroom_id) VALUES ('0', '1');
INSERT INTO teacher_new (teacher_id, classroom_id) VALUES ('1', '2');
INSERT INTO teacher_new (teacher_id, classroom_id) VALUES ('1', '3');
INSERT INTO teacher_new (teacher_id, classroom_id) VALUES ('0', '0');
-- fetch 
SELECT * FROM teacher;
SELECT * FROM classroom;
SELECT * FROM student;
-- select the TABLE.COLUMN which contains the VALUES(rows) then FROM table (insert here) inner join table (combine columns) using table_id then inner join table (combine columns) using table_id
SELECT teacher.firstname, teacher.lastname, classroom.subject FROM teacher_new INNER JOIN classroom USING (classroom_id) INNER JOIN teacher USING (teacher_id); --student_id(column) will be use to compare between table classroom and table teacher
SELECT student.firstname, student.lastname, student.gender, classroom.subject FROM student_new INNER JOIN classroom USING (classroom_id) INNER JOIN student USING (student_id); --student_id(column) will be use to compare between table classroom and table student

-- SELECT teacher.teacher_id, teacher.firstname, teacher.lastname, classroom.subject FROM classroom INNER JOIN teacher ON classroom.classroom_id = teacher.teacher_id;