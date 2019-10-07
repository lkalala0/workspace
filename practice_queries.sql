-- practice queries:
--1. Display the details of all employees
select * from emp;
--2. Display the depart information from department table
select * from dept;
--3.  Display the name and job for all the employees
select ename , job from emp;
--4. Display the name and salary  for all the employees
select ename , sal from emp;
--5.  Display the employee no and totalsalary  for all the employees
select empno, sum(sal) as totalsalary from emp
group by empno;
--6. Display the employee name and annual salary for all employees.
select empno , sal*12 as annual_salary from emp;
--7. ) Display the names of all the employees who are working in depart number 10.
select ename from emp where
deptno = '10';
--8.  Display the names of all the employees who are working as clerks and drawing a salary more than 3000.
select ename , sal from emp
where job = 'CLERK' and sal > 3000;
--9. Display the employee number and name  who are earning comm.
select empno , ename from emp 
where comm is not null and comm != 0;
--10. Display the employee number and name  who do not earn any comm.
select empno , ename from emp
where comm IS NULL or comm = 0;
--11.Display the names of employees who are working as clerks,salesman or analyst and drawing a salary more than 3000
select ename from emp
where job in ('CLERK', 'SALESMAN' , 'ANALYST') AND sal >= 3000;
--12.  Display the names of the employees who are working in the company for the past 5 years;
--13.Display the list of employees who have joined the company before 30-JUN-90 or after 31-DEC-90.
select * from emp where hiredate between '1990-06-30' and '1990-12-31';
--14. display current date
select CURRENT_DATE;
--15. Display the list of all users in your database(use catalog table).
--18. Display the names of employees working in depart number 10 or 20 or 40 or employees working as CLERKS, SALESMAN or ANALYST.
select ename from emp
where deptno in (10,20,40) or job in('CLERK', 'SALESMAN', 'ANALYST');
--19.  Display the names of employees whose name starts with alphabet S.
SELECT ename from emp 
where ename like 'S%';
--20. Display the Employee names for employees whose name ends with alphabet S.
select ename from emp
where ename like '%S';
--21. Display the names of employees whose names have second alphabet A in their names.
select ename from emp
where ename like '_A%';
--22.  select the names of the employee whose names is exactly five characters in length.
select ename from emp
where length (ename) = 5;
--23.  Display the names of the employee who ar e not working as MANAGERS.
select ename from emp where job <> 'MANAGER';
--24.  Display the names of the employee who are not work ing as SALESMAN OR CLERK OR ANALYST.
SELECT ename from emp
where job not in ('SALESMAN', 'CLERK', 'ANALYST');
--25. Display all rows from EMP table. The system should wait after every screen full of information.
--26.  Display the total number of employee working in the company.
SELECT COUNT(ename) as total_number_emp
from emp;
--27. Display the total salary being paid to all employees.
select sum(sal) as total_salary from emp;
--28. Display the maximum salary from emp table.
select max(sal) as max_salary from emp;
--29. Display the minimum salary from emp table.
select min(sal) as minimum_salary from emp;
--30.Display the average salary from emp table.
select round(avg(sal), 2) as average_salary from emp;
--31. Display the maximum salary being paid to CLERK.
SELECT max(sal) from emp where sal in (select sal from emp where job = 'CLERK');
--32. Display the maximum salary being paid to depart number 20.
SELECT max(sal) from emp where sal in (select sal from emp where deptno = 10);
--33. Display the minimum salary being paid to any SALESMAN.
SELECT min(sal) from emp where sal in (select sal from emp where job = 'SALESMAN');
--34. Display the average salary drawn by MANAGERS.
SELECT ROUND(avg(sal), 2) from emp where job = 'MANAGER';
--35. Display the total salary drawn by ANALYST working in depart number 40.
SELECT sal from emp
where job = 'ANALYST' and deptno = 40;
--36.Display the names of the employee in order of salary i.e the name of the employee earning lowest salary should salary appear first
select ename from emp
order by sal;
--37. Display the names of the employee in descending order of salary.
select ename from emp
order by sal desc;
-- 38. Display the names of the employee in order of employee name.
select ename from emp
order by ename;
-- 39.  Display empno,ename,deptno,sal sort the output first base on name and within name by deptno and with in deptno by sal.
select empno , ename , deptno , sal from emp
order by ename , deptno, sal;
--40. Display the name of the employee along with their annual salary(sal*12).The name of the employee earning highest annual salary should apper first.
select ename , sal*12 as annual_salary from emp
order by annual_salary desc;
--41. Display name,salary,hra,pf,da,total salary for each employee. The output should be in the order of total salary,hra 15% of salary,da 10% of salary,pf 5%
--salary,total salary will be(salary+hra+da)-pf.
with cte as (
select ename, sal , (sal/100)*15 as hra , (sal/100)*10 as da, (sal/100)*5 as pf from emp) select ename, sal,
hra, da, pf, (sal+hra+da)-pf as total_salary from cte;
--42. Display depart numbers and total number of employees working in each department.
select deptno , count(deptno) from emp
group by deptno
order by deptno;
--43. Display the various jobs and total number of employees within each job group.
select job , count(job) from emp
group by job;
--44. Display the depart numbers and total salary for each department.
select deptno, sum(sal) from emp
group by deptno;
--45. Display the depart numbers and max salary for each department.
select deptno, max(sal) from emp
group by deptno;
--46.Display the various jobs and total salary for each job
select job , sum(sal) from emp
group by job;
--47.  Display the depart numbers with more than three employees in each dept.
select deptno from emp
group by deptno
having count(ename) > 3;
--49.Display the various jobs along with total salary for each of the jobs where total salary is greater than 40000.
select job , sum(sal) from emp
group by job
having sum(sal) > 40000;
--50. Display the various jobs along with total number of employees in each job.The output should contain only those jobs with more than three employees.
select job, count(ename) as total_emp from emp
group by job
having count(ename) > 3
lina is done





