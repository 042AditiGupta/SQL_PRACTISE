use student1;
select * from student_table;
#29. Write an SQL query to fetch the MAJOR subject that have less than 4 people in it.
select major ,count(major)
from student_table
group by major
having count(major)<4;

#30. Write an SQL query to show all MAJOR subject along with the number of people in there.
select major,count(student_id)
from student_table
group by major;

#31. Write an SQL query to show the last record from a table.
select *
from student_table
order by student_id desc
limit 1;

# or we can use subquery
select * from student_table
where student_id=(select max(student_id) from student_table);

#32. Write an SQL query to fetch the first row of a table
select * from student_table
where student_id=(select min(student_id) from student_table);

# 33. Write an SQL query to fetch the last five records from a table.

select * from (select * from student_table
order by student_id desc
limit 5) as subquery order by student_id;

#34. Write an SQL query to fetch three max GPA from a table using co-related subquery.
select distinct GPA
from student_table
order by gpa desc
limit 3;

# using subquery 
SELECT DISTINCT GPA
FROM Student_table S1
WHERE 3 >= (
    SELECT COUNT(DISTINCT GPA)
    FROM Student_table S2
    WHERE S1.GPA <= S2.GPA
)
ORDER BY S1.GPA DESC;

#35. Write an SQL query to fetch three min GPA from a table using Correlated subquery.
select distinct gpa
from student_table s1
where 3>=(
	select count(distinct(gpa)) 
    from student_table s2
    where s2.gpa<=s1.gpa
)
order by s1.gpa;

#36. Write an SQL query to fetch nth max GPA from a table
select distinct gpa from student_table s1
where n=(select count(gpa) from student_table s2
where s1.gpa<s2.gpa);

#37. Write an SQL query to fetch MAJOR subjects along with the max GPA in each of these MAJOR subjects.
select major,max(gpa) as max_gpa
from student_table
group by major;
#Use GROUP BY when you apply an aggregate function (MAX, MIN, COUNT, SUM, AVG) and also want a non-aggregated column in SELECT.

#38. Write an SQL query to fetch the names of Students who has highest GPA.
select first_name,last_name
from student_table
where gpa=(select max(gpa) from student_table);

#39. Write an SQL query to show the current date and time.
select curdate(),now();

#40. Write a query to create a new table which consists of data and structure copied from the other table (say Student) or clone the table named Student.

create table clonetable as select * from student_table;
select * from clonetable;

# This query creates a new table CloneTable that contains the same structure 
# and data as the Student table. It is a simple way to back up or duplicate a table for testing or other purposes.

SET SQL_SAFE_UPDATES = 0;
#41. Write an SQL query to update the GPA of all the students in 'maths' MAJOR subject to 7.5.
update student_table
set gpa=7.5
where major="maths"

