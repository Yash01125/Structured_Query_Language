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