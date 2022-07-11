REM   Script: 615. Average Salary: Departments VS Company - LeetCode - Hard Level
REM   Write an SQL query to report the comparison result (higher/lower/same) of the average salary of employees in a department to the company's average salary.

Create table  Salary (id int, employee_id int, amount int, pay_date date);

Create table  Employee (employee_id int, department_id int);

insert into Salary (id, employee_id, amount, pay_date) values ('1', '1', '9000', date '2017-03-31');

insert into Salary (id, employee_id, amount, pay_date) values ('2', '2', '6000', date '2017-03-31');

insert into Salary (id, employee_id, amount, pay_date) values ('3', '3', '10000', date '2017-03-31');

insert into Salary (id, employee_id, amount, pay_date) values ('4', '1', '7000', date '2017-02-28');

insert into Salary (id, employee_id, amount, pay_date) values ('5', '2', '6000', date '2017-02-28');

insert into Salary (id, employee_id, amount, pay_date) values ('6', '3', '8000', date '2017-02-28');

insert into Employee (employee_id, department_id) values ('1', '1');

insert into Employee (employee_id, department_id) values ('2', '2');

insert into Employee (employee_id, department_id) values ('3', '2');

select distinct pay_month,department_id, 
case when avg_dep_month = avg_comp_dept then 'same' 
when avg_dep_month > avg_comp_dept then 'higher' 
when avg_dep_month < avg_comp_dept then 'lower' end comparison 
from ( 
select distinct to_char(pay_date,'yyyy-mm') pay_month, 
avg(AMOUNT) over (partition by pay_date,emp.DEPARTMENT_ID) avg_dep_month, 
sum(amount) over (partition by pay_date)/ count(*) over (partition by pay_date) avg_comp_dept, 
emp.department_id department_id 
from Salary sal 
join Employee emp 
on sal.EMPLOYEE_ID=emp.EMPLOYEE_ID 
order by emp.department_id);

