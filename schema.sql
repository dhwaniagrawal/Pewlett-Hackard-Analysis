--Creating tables for PH-EmployeesDB
DROP TABLE titles;
DROP TABLE dept_emp;
DROP TABLE salaries;
DROP TABLE dept_manager;
DROP TABLE employees;
DROP TABLE departments;

CREATE TABLE departments (
	dept_no VARCHAR(4) NOT NULL,
	dept_name VARCHAR(40) NOT NULL,
	PRIMARY KEY (dept_no),
	UNIQUE (dept_name)
);

CREATE TABLE employees(
	emp_no INT NOT Null,
	birth_date DATE NOT Null,
	first_name VARCHAR NOT Null,
	last_name VARCHAR NOT Null,
	gender VARCHAR NOT Null,
	hire_date DATE NOT Null,
	PRIMARY KEY (emp_no)
);

CREATE TABLE dept_manager (
dept_no VARCHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE salaries(
	emp_no INT NOT Null,
	salary INT NOT Null,
	from_date DATE NOT Null,
	to_date DATE NOT Null,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no)
);

CREATE TABLE dept_emp (
	emp_no INT NOT Null,
	dept_no VARCHAR(4) NOT Null,
	from_date DATE NOT Null,
	to_date DATE NOT Null,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE titles (
	emp_no INT NOT Null,
	title VARCHAR NOT Null,
	from_date DATE NOT Null,
	to_date DATE NOT Null,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no)
);

COPY departments FROM '/tmp/departments.csv' DELIMITER ',' CSV HEADER;
SELECT * FROM departments;
COPY employees FROM '/tmp/employees.csv' DELIMITER ',' CSV HEADER;
COPY dept_manager FROM '/tmp/dept_manager.csv' DELIMITER ',' CSV HEADER;
SELECT * FROM dept_manager;

COPY salaries FROM '/tmp/salaries.csv' DELIMITER ',' CSV HEADER;
SELECT * FROM salaries;

COPY dept_emp FROM '/tmp/dept_emp.csv' DELIMITER ',' CSV HEADER;
SELECT * FROM dept_emp;
SELECT * FROM employees;
