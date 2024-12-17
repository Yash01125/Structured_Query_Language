create database Assignment;
use Assignment;

-- 1) Statement to create the Contact table

create table contact(
contact_id int primary key,
company_id int,
first_name varchar(45),
last_name varchar(45),
street varchar(45),
city varchar(45),
state varchar(2),
zip varchar(10),
ismain boolean,
email varchar(45),
phone varchar(12)
);

-- 2) Statement to create the Employee table 

create table employee(
emp_id int primary key,
first_name varchar(45),
last_name varchar(45),
salary decimal(10,2),
hire_date date,
job_title varchar(25),
email varchar(45),
phone varchar(12)
);

/* 3) Statement to create the ContactEmployee table HINT: Use DATE as the datatype for ContactDate. It allows you to store the
      date in this format: YYYY-MM-DD (i.e., ‘2014-03-12’ for March 12, 2014). */

CREATE TABLE contactemployee(
    ce_id INT PRIMARY KEY ,
    contact_id int,
    emp_id int,
    c_date DATE NOT NULL,
    description VARCHAR(100)
);

-- 4) In the Employee table, the statement that changes Lesley Bland’s phone number to 215-555-8800 

update employee
set PhoneNumber = '215-555-8800'
where EmployeeName = 'Lesley Bland';

-- 5) In the Company table, the statement that changes the name of “Urban Outfitters, Inc.” to “Urban Outfitters” . 

create table company(
company_id int primary key,
company_name varchar(45),
street varchar(45),
city varchar(45),
state varchar(2),
zip varchar(10)
);

update company
set company_name = 'Urban Outfitters'
where company_name = 'Urban Outfitters, Inc.';

-- 6) In ContactEmployee table, the statement that removes Dianne Connor’s contact event with Jack Lee (one statement).

delete from contactemployee
where contact_name = 'Dianne Connor';

/* 7) Write the SQL SELECT query that displays the names of the employees that have contacted Toll Brothers (one statement). 
      Run the SQL SELECT query in MySQL Workbench. Copy the results below as well. */

SELECT employees.name
FROM employees
JOIN contacts ON employees.employee_id = contacts.employee_id
WHERE contacts.company_name = 'Toll Brothers';

-- 8) What is the significance of “%” and “_” operators in the LIKE statement? 

/* the LIKE statement is used for pattern matching in queries.The % and _ operators are used with LIKE to define search patterns.
   %(Percent Sign)
   Examples:
   WHERE Name LIKE 'A%': Matches all names starting with "A" (e.g., "Alice", "Andrew", "Anna").

    _(Underscore)
    It is used when you want to match a specific position with any character.
    Examples:
    WHERE Name LIKE 'J_n': Matches names with three characters where the second is "n" (e.g., "Jon", "Jan").
*/

-- 9) Explain normalization in the context of databases. 

/* Normalization is the process of organizing data within a relational database to reduce redundancy and improve data integrity. It involves decomposing larger tables into smaller, related tables and defining relationships between them. The goal of normalization is to ensure that the data is stored in an efficient, logical, and consistent way.

Normalization helps to prevent common data issues such as:

Data duplication (redundancy)
Update anomalies (inconsistencies when data is updated)
Insertion anomalies (difficulty inserting data without unnecessary repetition)
Deletion anomalies (unintended loss of data) */

-- 10) What does a join in MySQL mean? 

/* A JOIN in MySQL is a SQL operation that combines rows from two or more tables based on a related column between them. It allows 
  you to retrieve data from multiple tables in a single query, making it a powerful tool for working with relational databases.*/

-- 11) What do you understand about DDL, DCL, and DML in MySQL? 

/* MySQL, SQL (Structured Query Language) commands are categorized into different types based on their functionality.

   DDL : Data Definition Language
   DCL : Data Control Language
   DML : Data Manipulation Language 

   Common DDL Commands : CREATE, DROP, ALTER, TRUNCATE. 
   Common DCL Commands : GRANT, REVOKE. 
   Common DML Commands : SELECT, INSERT, UPDATE, DELETE. */
   
-- 12) What is the role of the MySQL JOIN clause in a query, and what are some common types of joins? 

/* The JOIN clause in MySQL is used to combine rows from two or more tables based on a related column between them.
   there some common types of joins are given below : 
   
   1) INNER JOIN
   2) LEFT JOIN
   3) RIGHT JOIN
   4) FULL JOIN
   5) CROSS JOIN */
   