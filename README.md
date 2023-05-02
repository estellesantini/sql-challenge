# sql-challenge
April 28, 2023 | Estelle Santini | UC Berkeley Data Analytics Bootcamp

## Description
For this project, I designed the tables to hold the data from six CSV files, import the CSV files into a SQL database, and then answer questions about the data. That is, I performed data modeling, data engineering, and data analysis, respectively.

## Data Modeling
In this step I inspected the CSV files, and then sketched an Entity Relationship Diagram of the tables using the tool QuickDBDLinks.

## Data Engineering
Use the provided information to export and create a table schema for each of the six CSV files: departments, dept_emp, dept_manager, employees, salaries, and titles. In this phase I specified the data types, primary keys, foreign keys, and other constraints. I verified they were unique or created composite keys, then imported each CSV file into its corresponding SQL table.

## Data Analysis
Finally, I wrote a separate query to practice subqueries, functions, and joins for the following questions:

1. List the employee number, last name, first name, sex, and salary of each employee.

2. List the first name, last name, and hire date for the employees who were hired in 1986.

3. List the manager of each department along with their department number, department name, employee number, last name, and first name.

4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

6. List each employee in the Sales department, including their employee number, last name, and first name.

7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
