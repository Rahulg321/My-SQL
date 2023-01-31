
CREATE DATABASE STUDENT_INFO;

USE DATABASE STUDENT_INFO;


--a primary key is automatically not null and unique 

create table animals (
    student_id INT PRIMARY KEY,
    name VARCHAR(50)
);


INSERT INTO animals VALUES(123, 'Rahul Gupta');

select * from animals;

-- WRITE SQL KEYWORDS IN CAPITALS
-- creating a table 
CREATE TABLE student (
   student_id INT PRIMARY KEY,
   name VARCHAR(20),
   major VARCHAR(20)
);

--gives a description about the table
DESCRIBE student;

--deletes the entire table
DROP TABLE student;

--adds a new column
ALTER TABLE student ADD gpa DECIMAL(3,2);

--drops a new column
ALTER TABLE student DROP COLUMN gpa;

--inserting values into the table
INSERT INTO student VALUES(1, 'jACK', 'Biology');
INSERT INTO student VALUES(2, 'Chris', 'Science');
INSERT INTO student VALUES(3, 'Will', 'Computer Science');

--insert into specific columns
--you cannot insert values with duplicate primary keys
--INSERT INTO student VALUES(4, NULL,'IAN');

INSERT INTO student VALUES(5, 'Mike', NULL);
INSERT INTO student(student_id, major) VALUES(6, 'Mike');
INSERT INTO student(student_id, name) VALUES(1, 'Rachel');

--retrieve all the values from the table
SELECT * FROM student;
DROP TABLE student;

--creating a table in a way it is easier for us to insert stuff

--name cannot be null
--every major needs to be unique 
CREATE TABLE student (
   student_id INT PRIMARY KEY,
   name VARCHAR(20) NOT NULL,
   major VARCHAR(20) UNIQUE
);

--setting a default value
CREATE TABLE student (
   student_id INT PRIMARY KEY,
   name VARCHAR(20),
   major VARCHAR(20) DEFAULT 'undecided'
);


--AUTO INCREMENTING PRIMARY KEY FOR US
CREATE TABLE student (
   student_id INT NOT NULL AUTO_INCREMENT,
   name VARCHAR(20),
   major VARCHAR(20) DEFAULT 'undecided',
   PRIMARY KEY (student_id)
);


INSERT INTO student(name, major) values('Jack', 'Biology');
INSERT INTO student(name, major) values('kate', 'science');

SELECT * FROM student;
