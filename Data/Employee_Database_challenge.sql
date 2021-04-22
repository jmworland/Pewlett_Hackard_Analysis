--Employee_Database_challenge.sql
SELECT 
	em.emp_no, 
	em.first_name, 
	em.last_name, 
	ti.title,
	ti.from_date,
	ti.to_date

INTO retirement_titles
FROM employees as em
inner join titles as ti
on em.emp_no = ti.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
order by emp_no;

select * from retirement_titles

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (r.emp_no) r.emp_no,
r.first_name,
r.last_name,
r.title

INTO unique_titles
FROM retirement_titles as r
ORDER BY emp_no, to_date DESC;

select * from unique_titles

select count(u.emp_no), u.title
into retiring_titles
from unique_titles as u
group by title
order by count DESC;

select * from retiring_titles

SELECT DISTINCT ON (e.emp_no)
	e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship_eligibility
FROM employees as e
JOIN dept_emp as de
ON e.emp_no = de.emp_no
JOIN titles as ti
ON e.emp_no = ti.emp_no
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY emp_no;

select * from mentorship_eligibility