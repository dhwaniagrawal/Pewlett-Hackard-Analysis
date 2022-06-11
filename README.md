# Postgresql Module 7 Challenge #

## Overview of the Project ##
 This analysis wilp help prepare Bobby's manager for the "silver tsunami" as many current current employees reach retirement age. This can be done by determining the number of retiring employees per title, and by identifying employees who are elegibile to participate in a mentorship program.
 
 ## Results ##
 - As we can see in retiring_titles table the number of employees retiring are higher for Senior Engineer and Seniour Staff. This means Bobby's Manager will have to hire more people for the same titles.
 ![this is an image](https://github.com/dhwaniagrawal/Pewlett-Hackard-Analysis/blob/main/retiring_titles.png)
 
 - There are many duplicate enteries, which signifies that there were many people those were promoted.
 ![this is an image](https://github.com/dhwaniagrawal/Pewlett-Hackard-Analysis/blob/main/Retirement_titles.png)
 
 - Highest number of employees retiring are the ones joined in the year 1991 
 ![this is an image](https://github.com/dhwaniagrawal/Pewlett-Hackard-Analysis/blob/main/Mentorship_eligibilty_%20filtered.png)
 
 
## Summary ##
1. 72,458 roles need to be filled.
2. As mentioned above the highest number (50,842) of employees getting retired are in roles Senior Engineer and Senior Staff. They will have enough experience to mentor next generation of Pewlett Hackard employees.

### Two Additional Queries ###
1. retiring employees by their departments.
SELECT ri.emp_no,
		ri.first_name,
		ri.last_name,
		d.dept_name
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no
INNER JOIN departments as d
ON d.dept_no = de.dept_no

2. retiring employees by the gender
SELECT ri.emp_no,
		ri.first_name,
		ri.last_name,
		e.gender
FROM retirement_info as ri
LEFT JOIN employees as e
ON ri.emp_no = e.emp_no
