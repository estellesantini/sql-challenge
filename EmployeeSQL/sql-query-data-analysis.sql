-- Left join because of each employee?
-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.first_name, e.last_name, e.sex, s.salary
FROM employees e
LEFT JOIN salaries s
ON e.emp_no = s.emp_no

-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '01/01/1986' AND '12/31/1986'

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
-- Alternative way to do this that isn't manual m0001. Can you do a subquery on a join?
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM dept_manager dm
LEFT JOIN employees e ON dm.emp_no = e.emp_no
LEFT JOIN departments d ON dm.dept_no = dm.dept_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT dept_no, dept_name, emp_no, last_name, first_name
FROM departments d
INNER JOIN employees e
ON d.dept_no = e.dept_no

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name= 'Hercules' AND last_name like 'B%'

-- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT emp_no, first_name, last_name
FROM employees
WHERE emp_no = (
    SELECT emp_no
    FROM dept_emp
    WHERE dept_no = (
        SELECT dept_no
        FROM departments
        WHERE dept_name = 'Sales'
        )
    )

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
-- Can I do this?
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
INNER JOIN departments d
ON e.emp_no = d.emp_no
WHERE dept_no = (
        SELECT dept_no
        FROM departments
        WHERE dept_name IN ('Sales','Development')
        )

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT count(last_name) as "count last name"
FROM employees
GROUP BY last_name
ORDER BY "count last name" DESC