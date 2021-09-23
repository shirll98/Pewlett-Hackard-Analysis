-- Use Dictinct with Orderby to remove duplicate rows
-- creating/joining the table 
SELECT employees.first_name,
    employees.last_name,
    employees.emp_no,
    titles.titles,
    titles.from_date,
    titles.to_date
INTO retirement_title
FROM employees
INNER JOIN titles
ON employees.emp_no = titles.emp_no, 
WHERE employee.birth_date BETWEEN '1952-01-01' AND '1955-12-31';


-- filter the list to show the most recent title per employee 
-- selext distinct on expressions must match initial order by expresion!!! 
SELECT DISTINCT ON (retirement_title.emp_no) emp_no,
first_name,
last_name,
titles

INTO unique_titles
FROM retirement_title
ORDER BY emp_no, to_date DESC

-- number of employees by their most recent job title about to retire 
SELECT COUNT(unique_titles.emp_no), 
unique_titles.title
INTO retiring_titles 
FROM unique_titles 
GROUP BY title 
ORDER BY COUNT(title) DESC; 


-- deliverable 2 mentorship program 
SELECT DISTINCT ON (employees.emp_no) 
employees.emp_no, 
employees.first_name, 
employees.last_name, 
employees.birth_date,
dept_emp.from_date, 
dept_emp.to_date, 
titles.title
INTO membership_eligibility 
FROM employees 
LEFT JOIN dept_emp 
ON (employees.emp_no = dept_emp.emp_no) 
LEFT JOIN titles
ON (dept_emp.emp_no = titles.emp_no) 
WHERE (employees.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (dept_emp.to_date = '9999-01-01') 
ORDER BY employees.emp_no ASC;  

