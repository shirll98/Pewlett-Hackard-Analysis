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
WHERE (employee.birth_date BETWEEN '1952-01-01' AND '1955-12-31')


-- filter the list to show the most recent title per employee 
SELECT DISTINCT ON (retirement_title) emp_no,
first_name,
last_name,
titles

INTO unique_titles
FROM retirement_title
ORDER BY emp_no, to_date DESC;

-- number of employees by their most recent job title about to retire 
SELECT COUNT(recent_titles.emp_no), 
recent_titles
INTO retiring_titles 
FROM recent_titles 
GROUP BY title 
ORDER BY COUNT(title) DESC; 


