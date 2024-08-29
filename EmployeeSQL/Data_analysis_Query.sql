-- Data Analysis - Query 1
-- 1.List the employee number, last name, first name, sex, and salary of each employee.

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
INNER JOIN salaries ON
employees.emp_no=salaries.emp_no;


-- Data Analysis - Query 2
-- 2.List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT employees.first_name, employees.last_name,  employees.hire_date
FROM employees
WHERE EXTRACT(YEAR FROM employees.hire_date) = 1986;


-- Data Analysis - Query 3
-- 3.List the manager of each department along with their department number, department name, employee number,last name, and first name.

SELECT dept_manager.dept_no, departments.dept_name, employees.emp_no, employees.last_name, employees.first_name
FROM 
(
  ( dept_manager
  INNER JOIN departments
  ON  dept_manager.dept_no=departments.dept_no)
  INNER JOIN employees
  ON employees.emp_no=dept_manager.emp_no
);


-- Data Analysis - Query 4
-- 4.List the department number for each employee along with that employee’s employee number, last name, first name,and department name.

SELECT dept_emp.dept_no, employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM 
(
  ( dept_emp
  INNER JOIN departments
  ON  dept_emp.dept_no=departments.dept_no)
  INNER JOIN employees
  ON employees.emp_no=dept_emp.emp_no
);


-- Data Analysis - Query 5
-- 5.List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.


SELECT first_name, last_name,  sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';


-- Data Analysis - Query 6
-- 6.List each employee in the Sales department, including their employee number, last name, and first name.

SELECT employees.emp_no AS sales_emp_no, employees.last_name, employees.first_name
FROM employees
INNER JOIN dept_emp ON employees.emp_no=dept_emp.emp_no
INNER JOIN departments ON dept_emp.dept_no=departments.dept_no
WHERE departments.dept_name='Sales';


-- Data Analysis - Query 7
-- 7.List each employee in the Sales and Development departments, including their employee number, last name, fi rstname, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM 
(
	(employees
	INNER JOIN dept_emp
	ON employees.emp_no=dept_emp.emp_no)
	INNER JOIN departments 	
	ON dept_emp.dept_no=departments.dept_no)
WHERE departments.dept_name='Sales' OR departments.dept_name='Development';


-- Data Analysis - Query 8
-- 8.List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT last_name, COUNT(last_name) AS "Last Name Frequency"
FROM employees
GROUP BY last_name
ORDER BY "Last Name Frequency" DESC;