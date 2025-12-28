#42. Write an SQL query to find the average GPA for each major.
use student1;
select AVG(gpa) as average_gpa,major
from student_table
group by major;

#43. Write an SQL query to show the top 3 students with the highest GPA.
select  *
from student_table
order by gpa desc
limit 3;

#44. Write an SQL query to find the number of students in each major who have a GPA greater than 7.5.
select count(student_id),major
from student_table
where gpa>7.5
group by major;

select student_id
from student_table
where first_name="shivansh";

#45. Write an SQL query to find the students who have the same GPA as 'Shivansh Mahajan.
select *
from student_table
where gpa =(select gpa from student_table where student_id=201)


