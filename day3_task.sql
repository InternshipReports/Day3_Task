-- to create a database 
CREATE DATABASE employee; 

-- to use a database 
USE employee; 

-- to calculate the average tenure of employers by department 
CREATE VIEW average_tenure AS 
SELECT Department, ROUND(AVG(Years),1) AS avg_tenure 
FROM employees 
GROUP BY Department 
ORDER BY avg_tenure DESC; 
SELECT* FROM  average_tenure;

-- to find the average, Minimum and Maximum annual Salary for each department 
CREATE VIEW avg_Min_Max_Annual_Salary AS 
SELECT department, ROUND(AVG(annual_salary),1) AS average_salary , MIN(annual_salary) AS 
minimum_salary, MAX(annual_salary) AS maximum_salary 
FROM employees 
GROUP BY department; 
SELECT* FROM avg_Min_Max_Annual_Salary;


-- to find average job rates by department and country 
CREATE VIEW avg_Job_Rates AS 
SELECT country, department, ROUND(AVG(job_rate),0) AS avg_Job_Rate 
FROM employees 
GROUP BY country , department 
ORDER BY country; 
SELECT*FROM avg_Job_Rates;


-- to find most leave taking employees 
CREATE VIEW Total_Leaves_Taken AS 
SELECT employee_id,full_name as employee_name, (unpaid_leaves+sick_leaves) as 
total_leaves 
FROM employees 
ORDER BY total_leaves DESC; 
SELECT* FROM Total_Leaves_Taken;


-- to find the to 5 employees with maximum overtime 
CREATE VIEW top_overtime_employees AS 
SELECT employee_id, full_name as employee_name, overtime_hours 
FROM employees 
ORDER BY overtime_hours DESC 
LIMIT 5;


-- to find average salary, job rate and leaves taken by gender 
CREATE VIEW avgsalary_jobrate_LeavesTaken AS 
SELECT gender, ROUND(AVG(annual_salary),0) AS average_salary, ROUND(AVG(job_rate),0) AS 
average_JobRate, ROUND(AVG(sick_leaves + unpaid_leaves),0)AS Total_Leaves 
FROM employees 
GROUP BY gender; 
SELECT *FROM avgsalary_jobrate_LeavesTaken;