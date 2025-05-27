CREATE DATABASE Webfala;
USE Webfala;
SHOW databases;

CREATE TABLE Students(
Student_ID INT AUTO_INCREMENT PRIMARY KEY,
First_Name varchar(50) not null,
Last_name varchar(50) not null,
Date_of_birth DATE,
Email varchar(50) UNIQUE
);

CREATE TABLE Courses(
Course_ID INT AUTO_INCREMENT PRIMARY KEY,
Course_Name varchar(50) not null,
Credit INT NOT NULL,
Course_Description Text
);

CREATE TABLE Enrollments (
Student_ID INT,
Course_ID INT,
Enrollment_Date DATE,
PRIMARY KEY (Student_ID, Course_ID),
FOREIGN KEY (Student_ID) REFERENCES Students(Student_ID) ON DELETE CASCADE,
FOREIGN KEY (Course_ID) REFERENCES Courses(Course_ID) ON DELETE RESTRICT);


ALTER TABLE Students ADD is_active TINYINT(1) DEFAULT 1;

ALTER TABLE courses ADD Duration_in_Weeks INT DEFAULT 20 NOT NULL;

ALTER TABLE courses ADD (Level INT NOT NULL, Department varchar(20)); -- For adding multiple columns

 # for dropping a column
ALTER TABLE students DROP COLUMN is_active;
ALTER TABLE courses DROP COLUMN Duration_in_Weeks; -- for dropping a column

ALTER TABLE courses RENAME COLUMN Course_Name TO `Course Title`; -- to change column name only but might not be available in all Version of SQL.
ALTER TABLE courses CHANGE `Course Title` Course_Name VARCHAR(100)  NOT NULL; -- to change the column name or data type or constraints etc

ALTER TABLE courses MODIFY course_name VARCHAR(50); -- to change the properties or data type or constraints of a table.

DESC students;

TRUNCATE enrollments;
DROP TABLE IF EXISTS enrollments;

-- Class Challenge

ALTER TABLE students RENAME COLUMN  Student_ID TO Matric_NO;
ALTER TABLE students MODIFY Date_of_birth DATE NOT NULL;
ALTER TABLE students CHANGE Last_name Surname_name VARCHAR(100) ;

-- DATA MANIPULATION LANGUAGE 
-- INSERT Statements - Single & Multiple Rows

INSERT INTO students (First_Name,Surname_name,Date_of_birth,Email)
VALUES ('Osamagbe', 'Nelson', '2023-01-31', 'iduozeejane@gmail.com');

INSERT INTO students
VALUES (2, 'Ivan', 'Ireyuwa', '1993-12-21', 'ivanireyuwa@gmail.com');

INSERT INTO students (First_Name,Surname_name,Date_of_birth,Email)
VALUES ('Blessing', 'Nelson','1992-02-02', 'blessingnelson@gmail.com');

INSERT INTO students (email, First_Name, Matric_No, Surname_name, Date_of_birth)  -- Use when the values are not arranged sequentially like the column headers
VALUES ('osamagbejane@gmail.com', 'Grace', 4,'Idemudia', '2024-11-15');


INSERT INTO students (First_Name,Surname_name,Date_of_birth,Email)
VALUES ('Bob', 'Brown', '1845-01-01', 'bobbrown@gmail.com'),
('Carol', 'Davis', '1991-05-05', 'CAROLDAVIS@GMAIL.COM'),
('Betty', 'John', '2025-05-05', 'bettyjohn@gmail.com'),
('Aishat', 'Buhari', '1991-06-09', 'aishatbuhari@gmail.com'),
('Rosheedat', 'Buhari', '1988-08-08', 'rosheedatbuhari@gmail.com'),
('Adijat', 'Motun', '1888-04-03', 'adijatmotun@gmail.com');

-- UPDATE Statements

UPDATE students
 SET date_of_birth = '2025-01-01'
 WHERE first_name = 'ivan'; -- 
 
 UPDATE students
 SET date_of_birth= '2026-05-06'
 WHERE matric_no = 5; -- this update one row at a time
 
 # UPDATE students
 # SET date_of_birth ='2026-05-06'; -- this is to update all of a particular column at once.
 
 -- Updating multile columns:
 UPDATE students
 SET first_name = 'Bisi', surname_name = 'Lawal'
 WHERE matric_no = 5;      -- this is to change multiple columns but for one rows
 
 UPDATE students
 SET first_name = 'Moyo', surname_name = 'John'
 WHERE surname_name = 'Nelson';   -- this is to change multiple columns and multiple rows
 
 UPDATE students 
 SET email = REPLACE(email, '@gmail', '@webfala'); -- to update a string i.e a part of a string
 
 UPDATE students
 SET email = 'text@gmail.com'
 WHERE matric_no = 5;
 
 UPDATE students
 SET first_name = 'John', surname_name = 'Doe'
 WHERE matric_no < 4;
 
 UPDATE students
 SET date_of_birth = REPLACE(date_of_birth, '2023-01-31', '2023-06-29')
 WHERE matric_no = 1;
 
 UPDATE students
 SET date_of_birth = REPLACE(date_of_birth, '01', '06') 
 WHERE matric_no = 2;
 
 
-- DELETE Statement

-- Delete from table_name; delete all records in the table
-- Delete from table_name where condition; delete base on condition
-- Cascading means you can allow DELETE AND UPDATE when referencing/and they have been used as foreign keys in another table while restrict means you cannot allow


-- Data Query Language - SELECT Statement

SHOW DATABASES;
CREATE DATABASE student;
USE student;
CREATE TABLE student_table
(id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
student_name varchar(20) NOT NULL);

SHOW TABLES; 

DROP TABLE student_table;
DROP TABLE IF EXISTS student_table;

CREATE TABLE IF NOT EXISTS student_table
(id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
student_name VARCHAR(20) NOT NULL,
age VARCHAR (5),
city VARCHAR (20),
gender VARCHAR (20)
);

ALTER TABLE student_table auto_increment=100; -- This is where the auto_increment will start from

DESC student_table;

INSERT INTO student_table (student_name,age,city,gender)
      VALUES ('saheed', 36,'Lagos','M'),
            ('david', 26,'Abuja','M'),
            ('John', 16,'Lagos','M'),
            ('Peace', 36,'PH','F'),
            ('Joy', 19,'Ibadan','F'),
            ('Peter', 24,'Lagos','M'),
            ('Patrick', 21,'Abuja','M'),
            ('Joseph', 16,'Lagos','M'),
            ('kate', 34,'NewYork','F'),
            ('Pate', 17,'London','F'),
            ('Alex', 31,'Rome','M'),
            ('Williams', 21,'London','M');
            
SELECT * 
FROM student_table;

SELECT id, gender,age -- This is going to come out depends on how and the arrangement of the column yiu specified.
FROM student_table;

-- Alais

SELECT age AS student_age, city AS student_city
from student_table;

SELECT student_name FROM student_table;

SELECT matric_No AS Matriculaton_Number, First_name, Surname_name AS Surname, date_of_birth AS DOB,Email AS EMAIL_address
FROM students;

SELECT matric_No AS Matriculation_Number, Surname_name AS Surname, First_name, email AS EMAIL_address
FROM students;

-- WHERE - Logical operators

SELECT student_name, age, city FROM student_table WHERE city = 'Lagos' AND age<20;
SELECT student_name, age, city FROM student_table WHERE (city = 'Lagos' AND age<20) OR age>35;

SELECT student_name, age, city FROM student_table WHERE age=26 OR age =36 OR age=19;
SELECT student_name, age, city FROM student_table WHERE age IN(26,36,19);
SELECT student_name, age, city FROM student_table WHERE city = 'Lagos' AND age<20;
SELECT student_name, age, city FROM student_table WHERE (city = 'Lagos' AND age<20) OR age>35;

SELECT student_name, age, city FROM student_table WHERE age=26 OR age =36 OR age=19;
SELECT student_name, age, city FROM student_table WHERE age NOT IN(26,36,19);

-- Update

UPDATE student_table SET age = 17 WHERE id =28;
UPDATE student_table SET age = 25 WHERE student_name='Joy';
UPDATE student_table SET city = 'Mumbai' WHERE id >33;

SELECT * FROM student_table;

DELETE FROM student_table WHERE id =39;
DELETE FROM student_table WHERE id = 35 AND id= 47;
DELETE FROM student_table WHERE id IN(38,44);

DROP TABLE student_table;



CREATE DATABASE employee;
SHOW DATABASES;

CREATE TABLE employee_table(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
emp_name VARCHAR(30),
emp_age VARCHAR(5),
salary INT,
city VARCHAR(20),
dob  DATE

);

INSERT INTO employee_table(emp_name, emp_age,salary,city,dob) 
			VALUES('peter', 36,66000,'Lagos','2000-11-10'),
            ('paul', 26,77000,'PH','1998-01-10'),
            ('dakson', 20,32000,'London','2005-11-10'),
            ('Doe', 30,60000,'Chicago','2000-11-10'),
            ('Dalinton', 26,77000,'PH','1998-01-10'),
            ('Mathew', 20,32000,'London','2005-11-10'),
            ('Ridwan', 30,60000,'Chicago','2000-11-10'),
            ('Alex', 26,77000,'PH','1998-01-10'),
            ('Jack', 20,32000,'London','2005-11-10'),
            ('Lovet', 30,60000,'Chicago','2000-11-10'),
            ('King', 36,50000,'Lagos','2000-11-10');
            
SELECT * FROM employee_table;

SELECT * FROM employee_table WHERE emp_name LIKE 'p%';

SELECT * FROM employee_table WHERE emp_name LIKE '%k';
SELECT * FROM employee_table WHERE emp_name LIKE '%e%';
SELECT * FROM employee_table WHERE emp_name LIKE '%er%';

SELECT * FROM employee_table WHERE emp_name LIKE '____';

SELECT * FROM employee_table where emp_name LIKE '___k';
SELECT * FROM employee_table where emp_name LIKE 'd__';
SELECT * FROM employee_table where emp_name LIKE '____%';
SELECT * FROM employee_table where emp_name LIKE 'p___%';

# ORDER BY:

SELECT * FROM employee_table ORDER BY salary;
SELECT salary FROM employee_table ORDER BY salary;
SELECT salary FROM employee_table ORDER BY salary ASC;
SELECT * FROM employee_table ORDER BY salary DESC;

SELECT * FROM employee_table ORDER BY emp_name;
SELECT emp_name FROM employee_table ORDER BY emp_name;
SELECT emp_name FROM employee_table ORDER BY emp_name ASC;
SELECT * FROM employee_table ORDER BY emp_name DESC;

SELECT * FROM employee_table ORDER BY emp_name DESC;

SELECT * FROM employee_table;

SELECT emp_name AS First_Name, salary, city
FROM employee_table
ORDER BY city ASC,  salary,First_Name DESC; 


# Aggregate

SELECT SUM(salary) as total_salary
FROM employee_table;

SELECT SUM(salary) as total_salary
FROM employee_table
WHERE city = 'ph';

SELECT COUNT(*)
FROM employee_table;

SELECT COUNT(*) as london_employee
FROM employee_table
WHERE city = 'london';

SELECT COUNT(DISTINCT city)
FROM employee_table;

SELECT MIN(SALARY)
FROM employee_table;

SELECT MAX(SALARY)
FROM employee_table;

# GROUP BY:

SELECT count(*) AS NUM_OF_EMPLOYEES, city  
FROM employee_table
GROUP BY city;

-- Class Tasks
SELECT COUNT(*) AS No_of_people, emp_age, COUNT(DISTINCT city) AS Unique_Cities
FROM employee_table
GROUP BY emp_age ;

SELECT DOB AS Date_Of_birth, COUNT(dob) AS Num_of_Employee, MIN(salary) AS Minimun_Salary, MAX(salary) AS Maximum_salary, AVG(salary) AS Average_salary, CITY 
FROM employee_table
GROUP BY dob, CITY;

-- having

 -- LIMIT AND OFFSET

INSERT INTO employee_table(emp_name,emp_age,salary,city,dob)
VALUES ('paresh', 20, 60000, 'lagos','2000-11-10'),
		('peter', 23, null, null, null),
		('patrick', 27, 32000, null, '2000-10-01'),
        ('paul', 33, 77000, 'london', '2000-10-04'),
        ('john', null, null, null, null);
        
-- null is used in the above insert to avoid the issues that comes with insert empty values. issues like knowing where to make a string or not.

SELECT COUNT(emp_age)
FROM employee_table;

-- The top five names that earns the most salaries and show result after the first 3.
SELECT DISTINCT emp_name, salary
FROM EMPLOYEE_TABLE
order by  salary desc
LIMIT 5
OFFSET 3;
## OFFSET ONLY WORK AFTER LIMIT AND IT DOESN'T WORK WITHOUT LIMIT

## Class Challenge:

SELECT DISTINCT(emp_age), 
				SUM(salary)AS 'Total Salary', 
                MIN(dob) AS 'Youngest member', 
                COUNT(DISTINCT city) AS 'Num of Cities',
                GROUP_CONCAT(city) AS Cities,
                GROUP_CONCAT(dob) AS Cities
FROM employee_table
GROUP BY emp_age
ORDER BY emp_age 
LIMIT 8;




# Join
CREATE DATABASE JoinDatabase;
SHOW DATABASES;

CREATE TABLE department(
dep_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
dep_name VARCHAR(20) NOT NULL
);

CREATE TABLE employees(
emp_id INT NOT NULL AUTO_INCREMENT,
emp_name VARCHAR(20) NOT NULL,
emp_age INT NOT NULL,
dep_id INT,

PRIMARY KEY(emp_id),
FOREIGN KEY(dep_id) REFERENCES department(dep_id)
);

CREATE TABLE project(
id INT NOT NULL AUTO_INCREMENT,
emp_id INT,
project_name VARCHAR(50) NOT NULL,
project_manager_id INT,

PRIMARY KEY(id),
FOREIGN KEY(emp_id) REFERENCES employees(emp_id),
FOREIGN KEY(project_manager_id) REFERENCES employees(emp_id)
);


INSERT INTO department(dep_name) VALUES
('Data Science'),
('AI'),
('IT'), 
('Analyst'),
('HR'),
('Software'),
('Customer Service'),
('Marketing'),
('Finance'),
('Research'),
('Sales');


INSERT INTO employees(emp_name, emp_age,dep_id)
VALUES ('Racheal', 25, NULL),
('Ross', 37, NULL),
('Rose', 22, NULL);

INSERT INTO project(emp_id, project_name, project_manager_id) VALUES
-- IT Department Projects (dep_id = 1)
(4, 'Network Upgrade', 1),       -- John (IT) manages Network Upgrade
(1, 'Network Upgrade', 4),       -- Alice (IT) works on Network Upgrade
(4, 'Server Migration', 1),       -- John (IT) manages Server Migration
(1, 'Server Migration', 4),       -- Alice (IT) works on Server Migration
(11, 'Security Audit', 4),      -- Henry (Research - assuming relevance) works on Security Audit
(4, 'Database Optimization', 1),  -- John (IT) manages Database Optimization
(1, 'Database Optimization', 4),  -- Alice (IT) works on Database Optimization

-- Analyst Department Projects (dep_id = 2)
(2, 'Sales Trend Analysis', 6),  -- Peter (Analyst) manages Sales Trend Analysis
(3, 'Sales Trend Analysis', 6),  -- Paul (Analyst) works on Sales Trend Analysis
(6, 'Customer Behavior Study', 2), -- Frank (Analyst) manages Customer Behavior Study
(2, 'Customer Behavior Study', 6), -- Peter (Analyst) works on Customer Behavior Study
(3, 'Marketing Campaign ROI', 6), -- Paul (Analyst) works on Marketing Campaign ROI

-- HR Department Projects (dep_id = 3)
(5, 'Employee Onboarding System', 7), -- Patrick (HR) manages Employee Onboarding System
(7, 'Employee Onboarding System', 5), -- Grace (Finance - assuming relevance) works on Onboarding
(5, 'Performance Review Process', 7), -- Patrick (HR) manages Performance Review Process
(7, 'Training Program Development', 5), -- Grace (Finance - assuming relevance) works on Training

-- Software Department Projects (dep_id = 4)
(8, 'New Feature Development', 4),  -- Bob (Software) manages New Feature Development
(1, 'New Feature Development', 8),  -- Alice (IT) works on New Feature Development
(8, 'Bug Fixing and Testing', 4),   -- Bob (Software) manages Bug Fixing
(1, 'Bug Fixing and Testing', 8),   -- Alice (IT) works on Bug Fixing
(9, 'API Integration', 8),       -- Charlie (Customer Service - assuming relevance) works on API Integration

-- Customer Service Department Projects (dep_id = 5)
(9, 'Customer Support Portal', 9), -- Charlie (Customer Service) manages Support Portal
(10, 'Customer Support Portal', 9),-- Diana (IT) works on Support Portal
(9, 'Feedback Analysis Project', 9),-- Charlie (Customer Service) manages Feedback Analysis
(10, 'Knowledge Base Creation', 9),-- Diana (IT) works on Knowledge Base

-- Marketing Department Projects (dep_id = 6)
(11, 'Social Media Campaign', 11), -- Eve (Marketing) manages Social Media Campaign
(2, 'Social Media Campaign', 11),  -- Peter (Analyst) works on Social Media Campaign
(11, 'Content Marketing Strategy', 11),-- Eve (Marketing) manages Content Strategy
(3, 'Content Marketing Strategy', 11);-- Paul (Analyst) works on Content Strategy

-- INNER JOIN

SELECT emp_id, emp_name,dep_name
from employees
INNER JOIN department
ON employees.dep_id = department.dep_id;

SELECT emp_id, emp_name, department.dep_id
FROM employees
INNER JOIN department
ON employees.dep_id = department.dep_id
WHERE dep_name = 'Analyst';

DROP DATABASE joindatabase;

select 
	e.emp_id, 
    e.emp_name, 
    e.emp_age, 
    d.dep_name
from department d
left join employees e 
	on e.dep_id = d.dep_id;

-- FULL OUTER JOIN
 
select 
	e.emp_id, 
    e.emp_name, 
    e.emp_age, 
    d.dep_name
from department d
left join employees e 
	on e.dep_id = d.dep_id
UNION
select 
	e.emp_id, 
    e.emp_name, 
    e.emp_age, 
    d.dep_name
from department d
right outer join employees e
	on e.dep_id = d.dep_id;



select 
	e.emp_id, 
    e.emp_name, 
    e.emp_age, 
    d.dep_name
from employees e1
SELF JOIN employees e2
	
    



