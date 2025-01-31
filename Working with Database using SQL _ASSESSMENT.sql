--  Working with Database using SQL 
--  "ASSESSMENT"

CREATE DATABASE try; 
use try;

CREATE TABLE employees (
emp_id INT AUTO_INCREMENT PRIMARY KEY, 
name VARCHAR (100),
position VARCHAR (100), 
salary DECIMAL (10, 2), 
hire_date DATE
); 

CREATE TABLE employee_audit (
audit_id INT AUTO_INCREMENT PRIMARY KEY,
emp_id INT,
name VARCHAR(100),
position VARCHAR (100),
salary DECIMAL (10, 2), 
hire_date DATE,
action_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
); 

INSERT INTO employees (name, position, salary, hire_date) 
VALUES ('John Doe','Software Engineer', 80000.00, '2022-01-15'),
('Jane Smith', 'Project Manager', 90000.00, '2021-05-22'),
('Alice Johnson', 'UX Designer', 75000.00, '2023-03-01'); 

DELIMITER //

CREATE TRIGGER after_employee_insert
AFTER INSERT ON employees
FOR EACH ROW
BEGIN
    INSERT INTO employee_audit (emp_id, action)
    VALUES (NEW.emp_id, 'INSERT');
END//

DELIMITER ;

select * from employee_audit;
select * from employees;