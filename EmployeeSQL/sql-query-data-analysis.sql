-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.first_name, e.last_name, e.sex, s.salary
FROM employees e
INNER JOIN salaries s
ON e.emp_no = s.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '01/01/1986' AND '12/31/1986';

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM dept_manager dm
INNER JOIN employees e ON dm.emp_no = e.emp_no
INNER JOIN departments d ON dm.dept_no = d.dept_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT dm.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM employees e
LEFT JOIN dept_manager dm ON dm.emp_no = e.emp_no
LEFT JOIN departments d ON dm.dept_no = d.dept_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name= 'Hercules' AND last_name like 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT emp_no, first_name, last_name
FROM employees
WHERE emp_no IN (
    SELECT emp_no
    FROM dept_emp
    WHERE dept_no = (
        SELECT dept_no
        FROM departments
        WHERE dept_name = 'Sales'
        )
    );

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT emp_no, first_name, last_name
FROM employees
WHERE emp_no IN (
    SELECT emp_no
    FROM dept_emp
    WHERE dept_no = (
        SELECT dept_no
        FROM departments
        WHERE dept_name = 'Sales'
        )
    )
    OR emp_no IN(
        SELECT emp_no
        FROM dept_emp
        WHERE dept_no = (
            SELECT dept_no
            FROM departments
            WHERE dept_name = 'Development'
            )
    );

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, count(last_name) as "count last name"
FROM employees
GROUP BY last_name
ORDER BY "count last name" DESC
