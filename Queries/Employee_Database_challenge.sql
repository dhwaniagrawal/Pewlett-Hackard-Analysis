--Deliverable 1
--The Number of Retiring Employees by Title		
SELECT e.emp_no,
	 e.first_name,
	 e.last_name,
	 ti.title,
	 ti.from_date,
	 ti.to_date
INTO retirement_title
FROM employees as e
LEFT JOIN titles as ti
ON e.emp_no = ti.emp_no
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no, rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_title as rt
WHERE to_date = '9999-01-01'
ORDER BY rt.emp_no ASC, rt.to_date DESC;

SELECT COUNT(ut.title), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY COUNT(ut.title) DESC;

--Deliverable 2
--The Employees Eligible for the Mentorship Program
SELECT DISTINCT ON(e.emp_no) e.emp_no,
		e.first_name,
		e.last_name,
		e.birth_date,
		de.from_date,
		de.to_date,
		ti.title
INTO mentorship_eligibilty
FROM employees as e
INNER JOIN dept_emp as de
ON e.emp_no = de.emp_no
INNER JOIN titles as ti
ON e.emp_no = ti.emp_no
WHERE birth_date BETWEEN '1965-01-01' AND '1965-12-31'
ORDER BY e.emp_no;

